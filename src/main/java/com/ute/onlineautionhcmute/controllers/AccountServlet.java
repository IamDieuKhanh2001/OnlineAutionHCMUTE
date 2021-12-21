package com.ute.onlineautionhcmute.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String path = request.getPathInfo();
        switch (path) {


//            Profile
            case "/Profile":
            case "/Profile/":
            case "/Profile/Overview":
            case "/Profile/Overview/":
                ServletUtils.forward("/views/vwAccount/ProfileOverview.jsp", request, response);
                break;

            case "/Profile/WatchList":
            {
                User userLogin = (User)session.getAttribute("authUser");
                List<WatchList> listWatchList = WatchListModel.findByUserID(userLogin.getId());
                List<ProductWithCard> listProductCard = new ArrayList<ProductWithCard>();

                listWatchList.forEach((wl) -> {
                    ProductWithCard pwc = ProductModel.getProductInfoWithCard(wl.getProduct_id());
                    if(pwc != null)
                        listProductCard.add(pwc);
                });

                request.setAttribute("listProductCard", listProductCard);
                ServletUtils.forward("/views/vwAccount/ProfileWatchList.jsp", request, response);
                break;
            }

            case "/Profile/ProductWin":
            {
                User userLogin = (User)session.getAttribute("authUser");
                List<Winner> listWinner = WinnerModel.findByUserID(userLogin.getId());
                List<ProductWithCard> listProductCard = new ArrayList<ProductWithCard>();

                listWinner.forEach((win) -> {
                    ProductWithCard pwc = ProductModel.getProductInfoWithCard(win.getProduct_id());
                    if(pwc != null)
                        listProductCard.add(pwc);
                });

                request.setAttribute("listProductCard", listProductCard);
                ServletUtils.forward("/views/vwAccount/ProfileProductWin.jsp", request, response);
                break;
            }

            case "/Profile/ProductAuction":
            {
                ServletUtils.forward("/views/vwAccount/ProfileProductAuction.jsp", request, response);
                break;
            }

            case "/Profile/Upgrade":
            {
                ServletUtils.forward("/views/vwAccount/ProfileUpgrade.jsp", request, response);
                break;
            }


            case "/Profile/ChangePassword":
            {
                request.setAttribute("isError", false);
                request.setAttribute("errorMessage", "");
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
                break;
            }

            case "/Profile/ChangeEmail":
            {
                request.setAttribute("status", "");
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
                break;
            }

            case "/Profile/ChangeInformation":
            {
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangeInformation.jsp", request, response);
                break;
            }
//            End Profile

            case "/Register2":
            {
                ServletUtils.forward("/views/vwAccount/Register2.jsp", request, response);
                break;
            }

            case "/Login":
            {
                if ((boolean) session.getAttribute("auth")) {
                    ServletUtils.redirect("/Home", request, response);
                } else ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            }

            case "/ResetPassword":
            {
                String userID = request.getParameter("userID");
                String code = request.getParameter("code");

                if (userID == null || code == null)
                    ServletUtils.forward("/views/404.jsp", request, response);

                User userTemp = new User();
                userTemp.setId(Integer.parseInt(userID));

                AccountRecovery accountRecovery = AccountRecoveryModel.findCodeValid(userTemp, code);
                if (accountRecovery == null)
                    ServletUtils.forward("/views/404.jsp", request, response);

                request.setAttribute("userID", userID);
                request.setAttribute("code", code);
                ServletUtils.forward("/views/vwAccount/ResetPassword.jsp", request, response);
                break;
            }

            case "/Recovery":
            {
                request.setAttribute("isPost", false);
                request.setAttribute("isExist", false);
                request.setAttribute("emailPost", "");
                ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
                break;
            }

            case "/IsAvailable":
            {
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;
            }

            case "/EmailIsAvailable":
            {
                String email = request.getParameter("email");
                User emailOfUser = UserModel.findByEmail(email);
                boolean EmailisAvailable = (emailOfUser == null);

                PrintWriter out2 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out2.print(EmailisAvailable);
                out2.flush();
                break;
            }


            default:
            {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
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

            case "/Profile/ChangePassword":
                changePassword(request, response);
                break;

            case "/Profile/ChangeInformation":
                changeInformation(request, response);
                break;

            case "/Profile/ChangeEmail":
                changeEmail(request, response);
                break;

            case "/Recovery":
                recovery(request, response);
                break;

            case "/ResetPassword":
                resetPassword(request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void changeEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setAttribute("status", "");
        request.setAttribute("message", "");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        String newEmail = request.getParameter("email_new");
        String currentPassword = request.getParameter("password_current");

        BCrypt.Result result = BCrypt.verifyer().verify(currentPassword.toCharArray(), user.getPassword());
        if(!result.verified)
        {
            request.setAttribute("status", "error");
            request.setAttribute("message", "Mật khẩu của bạn không đúng!");
            ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
        }
        else
        {
            if(ValidateUtils.isValidEmail(newEmail))
            {
                UserModel.updateEmail(user.getId(), newEmail);
                request.setAttribute("status", "success");
                request.setAttribute("message", "Cập nhật email thành công");
            }
            else
            {
                request.setAttribute("status", "error");
                request.setAttribute("message", "Cập nhật email thất bại. Email không hợp lệ");
            }

            ServletUtils.updateUserSession(request, response);
            ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
        }
    }

    private void changeInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");

        String newLastname = request.getParameter("lastname");
        String newFirstname = request.getParameter("firstname");
        String newPhone = request.getParameter("phone");
        String newAddress = request.getParameter("address");
        String newBirthdate = request.getParameter("birthdate");

        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        try {
            birthDateParsed = df.parse(newBirthdate);
        } catch (ParseException ex) {
            birthDateParsed = new Date();
        }

        user.setLastname(newLastname);
        user.setFirstname(newFirstname);
        user.setPhone(newPhone);
        user.setAddress(newAddress);
        user.setBirthdate(birthDateParsed);

        UserModel.updateInformation(user);

        request.setAttribute("message", "Cập nhật thông tin cá nhân thành công");
        ServletUtils.forward("/views/vwAccount/ProfileChangeInformation.jsp", request, response);
    }

    private void recovery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        User user = UserModel.findByEmail(email);
        if (user == null) {
            request.setAttribute("isExist", false);
        } else {
            request.setAttribute("isExist", true);
            try {
                String code = Common.getRandomNumberString();
                AccountRecoveryModel.add(user, code);
                SendEmail.sendAsHtml(email, "Reset Password Online Aution HCMUTE", EmailTemplate.TemplateRecoverAccount2(user, code));
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }

        request.setAttribute("emailPost", email);
        request.setAttribute("isPost", true);
        ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String userID = request.getParameter("userID");
        String code = request.getParameter("code");

        if (userID == null || code == null)
            ServletUtils.forward("/views/404.jsp", request, response);

        User userTemp = new User();
        userTemp.setId(Integer.parseInt(userID));

        AccountRecovery accountRecovery = AccountRecoveryModel.findCodeValid(userTemp, code);
        if (accountRecovery == null)
            ServletUtils.forward("/views/404.jsp", request, response);

        String newPassword = request.getParameter("password1");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, newPassword.toCharArray());
        UserModel.updatePasswordByID(Integer.parseInt(userID), bcryptHashPassword);
        AccountRecoveryModel.updateStatusUsed(accountRecovery);
        ServletUtils.redirect("/Account/Login", request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setAttribute("isError", false);
        request.setAttribute("errorMessage", "");
        request.setAttribute("message", "");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        boolean isLogin = (boolean)session.getAttribute("auth");
        if(isLogin && user != null)
        {
            String passwordCurrent = request.getParameter("password_current");
            String passwordNew = request.getParameter("password_new");

            System.out.println(passwordCurrent);

            BCrypt.Result isPasswordCorrect = BCrypt.verifyer().verify(passwordCurrent.toCharArray(), user.getPassword().toCharArray());
            if(isPasswordCorrect.verified)
            {
                String newPasswordCrypt = BCrypt.withDefaults().hashToString(12, passwordNew.toCharArray());
                UserModel.updatePasswordByID(user.getId(), newPasswordCrypt);

                request.setAttribute("message", "Đổi mật khẩu thành công!");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
            }
            else // Sai mật khẩu hiện tại
            {
                request.setAttribute("isError", true);
                request.setAttribute("errorMessage", "Sai mật khẩu hiện tại");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
            }
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

//    public static  void abc ()
//    {
//        ProductType productType = new ProductType(1, "", 2);
//    }
}
