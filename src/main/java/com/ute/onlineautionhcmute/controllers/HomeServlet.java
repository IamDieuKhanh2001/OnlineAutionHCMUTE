package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
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

        switch (path){
            case "/Index":{
                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            }
            case "/About":{
                ServletUtils.forward("/views/vwHome/About.jsp",request,response);
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
