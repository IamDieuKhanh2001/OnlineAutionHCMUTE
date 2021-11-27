package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminProductServlet", value = "/Admin/Product/*")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index": {
//                List<Product> list = ProductModel.findAll();          //Cach day viewModel ra view su dung set attribute
//                request.setAttribute("products", list);             //Cho phep day du lieu bat ki ra view, khi ben ngoai view nos la 1 attribute
                ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
                break;
            }
            case "/Add": {
//                ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
                break;
            }
            case "/Edit": {
//                int id = 0;
//                try {
//                    id = Integer.parseInt(request.getParameter("id"));
//                } catch (NumberFormatException e) {
//
//                }
//                Product c = ProductModel.findById(id);
//                if (c != null) {
//                    request.setAttribute("product", c);
//                    ServletUtils.forward("/views/vwProduct/Edit.jsp", request, response);
//                } else {
////                    ServletUtils.redirect("/Admin/Category",request,response);
//                    ServletUtils.forward("/views/204.jsp", request, response);
//                }
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
//        String path = request.getPathInfo();
//        switch (path) {
//            case "/Add": {
//                addProduct(request, response);
//                break;
//            }
//            case "/Delete": {
//                deleteProduct(request, response);
//                break;
//            }
//            case "/Update": {
//                updateProduct(request, response);
//                break;
//            }
//            default: {
//                ServletUtils.forward("/views/404.jsp", request, response);
//                break;
//            }
//        }
    }
//    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("ProName");
//        String tinyDes = request.getParameter("TinyDes");
//        String fullDes = request.getParameter("FullDes");
//        int proPrice = Integer.parseInt(request.getParameter("ProPrice"));
//        int catID = Integer.parseInt(request.getParameter("CatID"));
//        int quantity = Integer.parseInt(request.getParameter("Quantity"));
//
//        Product c = new Product(name,tinyDes,fullDes,proPrice,catID,quantity);
//        ProductModel.add(c);
//        ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
//    }
//
//    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("ProID"));
//        String name = request.getParameter("ProName");
//        String tinyDes = request.getParameter("TinyDes");
//        String fullDes = request.getParameter("FullDes");
//        int proPrice = Integer.parseInt(request.getParameter("ProPrice"));
//        int catID = Integer.parseInt(request.getParameter("CatID"));
//        int quantity = Integer.parseInt(request.getParameter("Quantity"));
//
//        Product c = new Product(id, name, tinyDes,fullDes,proPrice,catID,quantity);
//        ProductModel.update(c);
//        ServletUtils.redirect("/Admin/Product", request, response);
//    }
//
//    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("ProID"));
//        ProductModel.delete(id);
//        ServletUtils.redirect("/Admin/Product", request, response);
//    }
}
