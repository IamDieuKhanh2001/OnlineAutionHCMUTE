package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Login";
        }
        switch (path){
            case "/Login":{
                ServletUtils.forward("/views/vwAccount/Login.jsp",request,response);
                break;
            }
            case "/Register":{
                ServletUtils.forward("/views/vwAccount/Register.jsp",request,response);
                break;
            }
            case "/Profile":{

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
