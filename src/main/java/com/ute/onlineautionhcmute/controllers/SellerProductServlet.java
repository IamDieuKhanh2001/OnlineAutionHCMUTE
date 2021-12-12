package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SellerProductServlet", value = "/Seller/Product/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class SellerProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Dashboard";
        }
        switch (path){
            case "/Dashboard":{
                ServletUtils.forward("/views/vwProduct/SellerProductDashBoard.jsp",request,response);
                break;
            }
            case "/Add":{
                List<ProductType> productTypeList = ProductTypeModel.findAll();
                request.setAttribute("productTypeList",productTypeList);
                ServletUtils.forward("/views/vwProduct/Add.jsp",request,response);
                break;
            }
            case "/Edit":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);
                if (c != null && c.getUser_id() == userLogin.getId()) {              //Kiểm tra sản phẩm tồn tại và có thuộc sở hữu người login k
                    request.setAttribute("product", c);                                  //San pham id can tim
                    User sellerInfo = UserModel.findById(c.getUser_id());                   //Attribute hien thi ten username ng ban ra view
                    request.setAttribute("sellerInfo", sellerInfo);
                    ProductType proType = ProductTypeModel.findById(c.getProduct_type_id()); //Attribute hien thi ten product type ra view
                    request.setAttribute("proType", proType);
                    ServletUtils.forward("/views/vwProduct/Edit.jsp",request,response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            //Xem tat ca san pham cua seller da dang
            case "/All":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                List<Product> sellerProduct = ProductModel.findByUserID(userLogin.getId());     //Lay id user tu session AuthUser
                request.setAttribute("products", sellerProduct);
                ServletUtils.forward("/views/vwProduct/SellerProducts.jsp",request,response);
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
        request.setCharacterEncoding("UTF-8");

        String path = request.getPathInfo();
        switch (path) {
            case "/Add": {
                addProduct(request, response);
                break;
            }
            case "/Edit": {
                editProduct(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productID"));
        String old_description = request.getParameter("old_description");
        String descriptionAppend = request.getParameter("description");
        Date dateNow = new Date();
        String appendDateModified = "<br>"+ "Bổ sung vào lúc: " + String.valueOf(dateNow) + "<br>";
        String descriptionEdited = old_description + appendDateModified + descriptionAppend;
        Product p = ProductModel.findById(id);
        p.setDescription(descriptionEdited);
        p.setModified_time(dateNow);
        ProductModel.update(p);
        ServletUtils.redirect("/Seller/Product/All", request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int product_type_id = Integer.parseInt(request.getParameter("Product_type_id"));
        int user_id = userLogin.getId();

        int end_time_select = Integer.parseInt(request.getParameter("end_time"));
        long dayNowMillis = System.currentTimeMillis();
        Date end_time = new Date(dayNowMillis + (24 * 60 * 60 * 1000 * end_time_select));   //Luu thoi gian ket thuc ng user


        double priceStart = Double.parseDouble(request.getParameter("priceStart"));
        double priceCurrent = Double.parseDouble(request.getParameter("priceStart"));
        double priceStep = Double.parseDouble(request.getParameter("PriceStep"));
        double priceBuyNow = Double.parseDouble(request.getParameter("PriceBuyNow"));
        Product p = new Product(-1,name,description,product_type_id,user_id,priceStart,priceStep,priceCurrent,priceBuyNow,end_time);
        ProductModel.add(p);

        storeImage(request,response);  //Lưu hình vào server

        ServletUtils.redirect("/Seller/Product/Dashboard",request,response);    //Sua lai duong dan view
    }
    private void storeImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        Product p = ProductModel.findInsertRecentByUserID(userLogin.getId());

        for (Part part : request.getParts()) { //Nhan hinh anh tu browse và lưu vào server
            if (part.getName().equals("mainImg")) {
                String filename = "main.jpg";
                String targetDir = this.getServletContext().getRealPath("public/img/product" + "/" + p.getId());
                File dir = new File(targetDir);
                if (!dir.exists()) {
                    dir.mkdir();
                }
                String destination = targetDir + "/" + filename;
                part.write(destination);
            }
            if (part.getName().equals("thumps_1")) {
                String filename = "thumps_1.jpg";
                String targetDir = this.getServletContext().getRealPath("public/img/product" + "/" + p.getId());
                File dir = new File(targetDir);
                if (!dir.exists()) {
                    dir.mkdir();
                }
                String destination = targetDir + "/" + filename;
                part.write(destination);
            }
            if (part.getName().equals("thumps_2")) {
                String filename = "thumps_2.jpg";
                String targetDir = this.getServletContext().getRealPath("public/img/product" + "/" + p.getId());
                File dir = new File(targetDir);
                if (!dir.exists()) {
                    dir.mkdir();
                }
                String destination = targetDir + "/" + filename;
                part.write(destination);
            }
        }
    }
}
