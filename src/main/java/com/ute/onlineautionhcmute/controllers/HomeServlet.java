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

import java.util.Hashtable;
import java.util.List;

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
                List<Category> categories = CategoryModel.findAll();
                Hashtable<String, List<ProductType>> listProductType = new Hashtable<String, List<ProductType>>();
                categories.forEach((category) -> {
                    List<ProductType> productTypes = ProductTypeModel.findProductTypeWithCategoryID(category.getId());
                    listProductType.put(String.valueOf(category.getId()), productTypes);
                });

                request.setAttribute("categories", categories);
                request.setAttribute("listProductType", listProductType);

                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            }
            case "/About":{
//                List<Category> list =(List<Category>) request.getAttribute("categoriesWithDetails");
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
