package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.UserModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountManageServlet", value = "/Admin/Account/*")
public class AdminAccountManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Manage";
        }
        switch (path){
            case "/Manage":{
                List<User> list = UserModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("listUser", list);
                ServletUtils.forward("/views/vwAccount/AccountManager.jsp",request,response);
                break;
            }
            case "/Add":{
                ServletUtils.forward("/views/vwAccount/Add.jsp",request,response);
                break;
            }
            case "/Upgrade":{
                ServletUtils.forward("/views/vwAccount/AccountUpgrade.jsp",request,response);
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

    }
}
