package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountManagerServlet", value = "/Admin/Account/*")
public class AdminAccountManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Manager";
        }
        switch (path){
            case "/Manager":{
                ServletUtils.forward("/views/vwAccount/AccountManager.jsp",request,response);
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
