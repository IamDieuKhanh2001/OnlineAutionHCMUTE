package com.ute.onlineautionhcmute.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.models.AccountRecoveryModel;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.models.UserModel;
import com.ute.onlineautionhcmute.utils.Common;
import com.ute.onlineautionhcmute.utils.EmailTemplate;
import com.ute.onlineautionhcmute.utils.SendEmail;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register2":
                ServletUtils.forward("/views/vwAccount/Register2.jsp", request, response);
                break;

            case "/Login":
//                HttpSession session = request.getSession();
//                if ((boolean) session.getAttribute("auth")) {
//                    ServletUtils.redirect("/Home", request, response);
//                } else ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;

            case "/Recovery":
                request.setAttribute("isPost", false);
                request.setAttribute("isExist", false);
                request.setAttribute("emailPost", "");
                ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
                break;

            case "/Profile":
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;

            case "/IsAvailable":
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register2":
                registerUser(request, response);
                break;

            case "/Login":
                login(request, response);
                break;

            case "/Logout":
                logout(request, response);
                break;

            case "/Recovery":
                String email = request.getParameter("email");
                User user = UserModel.findByEmail(email);
                if(user == null)
                {
                    request.setAttribute("isExist", false);
                }
                else
                {
                    request.setAttribute("isExist", true);
                    try
                    {
                        String code = Common.getRandomNumberString();
                        AccountRecoveryModel.add(user, code);
                        SendEmail.sendAsHtml(email, "Reset Password Online Aution HCMUTE", EmailTemplate.TemplateRecoverAccount(user, code));
                    } catch (Exception ex) { System.out.println(ex.getMessage()); }
                }

                request.setAttribute("emailPost", email);
                request.setAttribute("isPost", true);
                ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String rawpwd = request.getParameter("rawpwd");
//        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
//
//
//        String username = request.getParameter("username");
//        int user_type_id = 3;
//
//        User c = new User(username, bcryptHashString, firstname, , null, null,null,null,user_type_id);
//        UserModel.add(c);
        String username = request.getParameter("username");

        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthDate = request.getParameter("birthdate"); //Xu li birtdate ve Date
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int user_type_id = 3;
        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthDateParsed = df.parse(birthDate);
        } catch (ParseException ex) {
            birthDateParsed = new Date();
        }

        User c = new User(-1, username, bcryptHashPassword, firstname, lastname
                , birthDateParsed, address, email, phone, user_type_id);
        UserModel.add(c);
        ServletUtils.forward("/views/vwAccount/Register2.jsp", request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserModel.findByUsername(username);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));

                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/Home";
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/Home";
        ServletUtils.redirect(url, request, response);
    }

    public static  void abc ()
    {
        ProductType productType = new ProductType(1, "", 2);
    }
}
