package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeServlet", value = "/Home/*")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Index";
        }
        switch (path){
            case "/Index":{
                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            }
            case "/About":{
//                List<Category> list =(List<Category>) request.getAttribute("categoriesWithDetails");
                ServletUtils.forward("/views/vwHome/About.jsp",request,response);
                break;
            }
            default:{
//                ServletUtils.forward("/views/404.jsp",request,response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
