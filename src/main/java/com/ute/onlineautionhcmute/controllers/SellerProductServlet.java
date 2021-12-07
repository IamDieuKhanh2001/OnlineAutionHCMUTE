package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.beans.WatchList;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.models.WatchListModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
                //Them attribute Protypeid vao o select
                ServletUtils.forward("/views/vwProduct/Add.jsp",request,response);
                break;
            }
            //Xem tat ca san pham cua seller da dang
            case "/All":{

                List<Product> sellerProduct = ProductModel.findByUserID(14);     //Lay id user tu session AuthUser
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
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int product_type_id = Integer.parseInt(request.getParameter("Product_type_id"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));              //Xem usser id cua usser tu session (chua xong)
        double priceStart = Double.parseDouble(request.getParameter("priceStart"));
        double priceCurrent = Double.parseDouble(request.getParameter("priceCurrent"));
        double priceStep = Double.parseDouble(request.getParameter("PriceStep"));
        double priceBuyNow = Double.parseDouble(request.getParameter("PriceBuyNow"));
        Product p = new Product(-1,name,description,product_type_id,user_id,priceStart,priceStep,priceCurrent,priceBuyNow);
        ProductModel.add(p);

        storeImage(user_id,request,response);  //Lưu hình vào server

        ServletUtils.redirect("/Seller/Product/Dashboard",request,response);    //Sua lai duong dan view
    }
    private void storeImage(int user_id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Product p = ProductModel.findInsertRecentByUserID(user_id);

        for (Part part : request.getParts()) { //Nhan hinh anh tu browse và lưu vào server
            if (part.getName().equals("mainImg")) {
                String contentDisposition = part.getHeader("content-disposition");
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
                String contentDisposition = part.getHeader("content-disposition");
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
                String contentDisposition = part.getHeader("content-disposition");
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
