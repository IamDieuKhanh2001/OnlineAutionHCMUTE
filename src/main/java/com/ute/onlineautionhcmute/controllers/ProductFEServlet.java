package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        switch (path) {
            //Bidder xem sp theo mục Product type id
            case "/ByProID": {
                int proID = 0;
                try {
                    proID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                List<Product> list = ProductModel.findAllProductByProductTypeID(proID);
                request.setAttribute("products", list);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwProduct/ByProID.jsp", request, response);
                break;
            }
            case "/AddWatchList": {
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                System.out.println(userLogin.getId());
                String url = request.getHeader("referer"); //Luu dia chi trang trc do de quay ve
                int id = 0;
                int bidderID = userLogin.getId();


                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);
                if (c != null) {                             //neu trong watchlist chuwa có sp
                    if (WatchListModel.findByProIdAndUserId(c.getId(),userLogin.getId()) == null){
                        WatchListModel.add(c,userLogin);
                        ServletUtils.redirect(url,request,response);
                    }else{                                                 //neu trong watchlist da có sp
                        ServletUtils.redirect(url,request,response);
                    }
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }

            case "/MyWatchList": {
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");
                List<WatchList> userWatchList =WatchListModel.findByUserID(userLogin.getId());  // User id lay tu session
                request.setAttribute("userWatchList", userWatchList);
                List<Product> userProduct = new ArrayList<>();         //Tim san pham tu watchlist ra product
                for (WatchList item : userWatchList){
                    Product p = ProductModel.findProductByID(item.getProduct_id());
                    if(p != null){
                        userProduct.add(p);
                    }
                }
                request.setAttribute("products", userProduct);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwProduct/watchList.jsp", request, response);
                break;
            }

            case "/RemoveFromWatchList": {
                String url = request.getHeader("referer"); //Luu dia chi trang trc do de quay ve
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                WatchList wl = WatchListModel.findByProIdAndUserId(id,userLogin.getId());
                if (wl != null) {
                    WatchListModel.delete(id,userLogin.getId());
                    ServletUtils.redirect(url, request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            case "/Detail":{
                int productID = -1;
                try
                {
                    productID = Integer.parseInt(request.getParameter("id"));
                } catch (Exception ex)
                {
                    ServletUtils.forward("/views/404.jsp", request, response);
                }

                Product product = ProductModel.findById(productID);
                if(product == null)
                    ServletUtils.forward("/views/404.jsp", request, response);



                request.setAttribute("product", product);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
