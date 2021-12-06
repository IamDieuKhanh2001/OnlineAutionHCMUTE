package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SellerProductServlet", value = "/Seller/Product/*")
public class SellerProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Phan get du lieu partials left
        List<Category> categories = CategoryModel.findAll();
        List<ProductType> listProductType = new ArrayList<ProductType>();
        categories.forEach((category -> {
            List<ProductType> list = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
            list.forEach((productType -> {
                listProductType.add(productType);
            }));
            listProductType.add(null);
        }));
        request.setAttribute("categories", categories);
        request.setAttribute("listProductType", listProductType);
        // End phan get du lieu partials left

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

        // Phan get du lieu partials left
        List<Category> categories = CategoryModel.findAll();
        List<ProductType> listProductType = new ArrayList<ProductType>();
        categories.forEach((category -> {
            List<ProductType> list = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
            list.forEach((productType -> {
                listProductType.add(productType);
            }));
            listProductType.add(null);
        }));
        request.setAttribute("categories", categories);
        request.setAttribute("listProductType", listProductType);
        // End phan get du lieu partials left

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
        ServletUtils.redirect("/Seller/Product/Dashboard",request,response);    //Sua lai duong dan view
    }

}
