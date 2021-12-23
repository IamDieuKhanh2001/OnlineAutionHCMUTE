package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
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
                List<Product> c = ProductModel.findAll();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
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

            case "/TopFive":{
                ServletUtils.forward("/views/vwHome/TopFive.jsp",request,response);
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
        switch (path) {
            case "/Search": {
                String search = request.getParameter("txtsearch");
                List<Product> c = ProductModel.fullTextSearch(search);
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list);
                ServletUtils.forward("/views/vwHome/Search.jsp", request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
}




