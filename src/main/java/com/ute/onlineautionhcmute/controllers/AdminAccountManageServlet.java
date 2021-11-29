package com.ute.onlineautionhcmute.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.beans.UserType;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.models.UserModel;
import com.ute.onlineautionhcmute.models.UserTypeModel;
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

@WebServlet(name = "AccountManageServlet", value = "/Admin/Account/*")
public class AdminAccountManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Manage";
        }

        // Phan get du lieu partials left
        List<Category> categories = CategoryModel.findAll();
        List<ProductType> listProductType = new ArrayList<ProductType>();
        categories.forEach((category -> {
            List<ProductType> list = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
            list.forEach((productType -> {
                listProductType.add(productType);
            }));
            listProductType.add(null);
        }));
        request.setAttribute("categories", categories);
        request.setAttribute("listProductType", listProductType);
        // End phan get du lieu partials left

        switch (path){
            case "/Manage":{
                List<User> list = UserModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("listUser", list);
                ServletUtils.forward("/views/vwAccount/AccountManager.jsp",request,response);
                break;
            }
            case "/Add":{
                List<UserType> list = UserTypeModel.findAll();        //dua list user type ra cho select su dung
                request.setAttribute("listUserType", list);
                ServletUtils.forward("/views/vwAccount/Add.jsp",request,response);
                break;
            }
            case "/Upgrade":{
                ServletUtils.forward("/views/vwAccount/AccountUpgrade.jsp",request,response);
                break;
            }
            case "/Delete":{ //Nhan vao id user can xoa
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                User c = UserModel.findById(id);
                if (c != null) {
                    UserModel.delete(id);
                    ServletUtils.redirect("/Admin/Account/Manage", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            case "/IsAvailable": { //Kiem tra username tồn tại không
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null); //Co username ton tai false, khong co username ton tai true
//                boolean isAvailable = true;
//                if (user != null){
//                    isAvailable = false;
//                }
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
                break;
            }

            default:{
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();

        // Phan get du lieu partials left
        List<Category> categories = CategoryModel.findAll();
        List<ProductType> listProductType = new ArrayList<ProductType>();
        categories.forEach((category -> {
            List<ProductType> list = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
            list.forEach((productType -> {
                listProductType.add(productType);
            }));
            listProductType.add(null);
        }));
        request.setAttribute("categories", categories);
        request.setAttribute("listProductType", listProductType);
        // End phan get du lieu partials left

        switch (path) {
            case "/Add": {
                addUser(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthDate = request.getParameter("birthdate"); //Xu li birtdate ve Date
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int user_type_id = Integer.parseInt(request.getParameter("user_type_id"));
        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try{
            birthDateParsed = df.parse(birthDate);
        }catch (ParseException ex){
            birthDateParsed = new Date();
        }

        User c = new User(-1, username, bcryptHashPassword, firstname, lastname
        , birthDateParsed, address, email,phone, user_type_id);
        UserModel.add(c);
        ServletUtils.redirect("/Admin/Account/Manage", request, response);

    }
}
