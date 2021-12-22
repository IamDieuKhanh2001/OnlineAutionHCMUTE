package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.models.UserModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.util.*;

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
                ServletUtils.forward("/views/vwHome/About.jsp",request,response);
                break;
            }

            case
             "/Top5ProductPrice":{
                List<Product> c = ProductModel.findTop5ProductPrice();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwHome/Top5ProductPrice.jsp",request,response);
                break;
            }

            case "/Top5ProductExpire":{
                List<Product> c = ProductModel.findTop5ProductExpire();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwHome/Top5ProductExpire.jsp",request,response);
                break;
            }

            case "/Top5ProductPriceBuyNow":{
                List<Product> c = ProductModel.findTop5ProductBuyNow();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwHome/Top5ProductPriceBuyNow.jsp",request,response);
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
