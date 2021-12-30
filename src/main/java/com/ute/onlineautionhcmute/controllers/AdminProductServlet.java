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
import java.util.ArrayList;
import java.util.List;

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
                List<Product> list = ProductModel.findAll();
                List<User> userList = UserModel.findAll();
               request.setAttribute("products", list);
                request.setAttribute("userList", userList);
                ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
                break;
            }
            case "/Delete":{ //Nhan vao id product can xoa
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);
                if (c != null) {
                    ProductModel.delete(id);
                    ServletUtils.redirect("/Admin/Product/Index", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            case "/Detail":{ //Nhan vao id product can xoa
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);
                if (c != null) {
                    request.setAttribute("product", c);//San pham id can tim
                    User sellerInfo = UserModel.findById(c.getUser_id()); //Attribute hien thi ten username ng ban ra view
                    request.setAttribute("sellerInfo", sellerInfo);
                    ProductType proType = ProductTypeModel.findById(c.getProduct_type_id()); //Attribute hien thi ten product type ra view
                    request.setAttribute("proType", proType);
                    ServletUtils.forward("/views/vwProduct/ProductDetailReadOnly.jsp", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
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
        String path = request.getPathInfo();
        request.setCharacterEncoding("UTF-8");
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
