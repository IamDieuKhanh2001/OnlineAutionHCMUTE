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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminProductTypeServlet", value = "/Admin/Product/Type/*")
public class AdminProductTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
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

        switch (path) {
            case "/Index": {


                List<ProductType> list = ProductTypeModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("productTypeList", list);             //Cho phep day du lieu bat ki ra view, khi ben ngoai view nos la 1 attribute
                ServletUtils.forward("/views/vwProductType/Index.jsp", request, response);
                break;
            }
            case "/Add": {

                //Gửi list category ra cho select Add cat
                List<Category> list = CategoryModel.findAll();
                request.setAttribute("categories", list);
                ServletUtils.forward("/views/vwProductType/Add.jsp", request, response);
                break;
            }
            case "/Edit": {


                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {

                }
                ProductType c = ProductTypeModel.findById(id);

                if (c != null) {
                    request.setAttribute("productType", c);
                    //Gửi list category ra cho select Add cat
                    List<Category> list = CategoryModel.findAll();
                    request.setAttribute("categories", list);
                    ServletUtils.forward("/views/vwProductType/Edit.jsp", request, response);
                } else {
//                    ServletUtils.redirect("/Admin/Category",request,response);
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

        switch (path) {
            case "/Add": {
                addProductType(request, response);
                break;
            }
            case "/Delete": {
                deleteProductType(request, response);
                break;
            }
            case "/Update": {
                updateProductType(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    private void addProductType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int cat_id = Integer.parseInt(request.getParameter("category_id"));
        Date dateCurrent = new Date();
        ProductType c = new ProductType(-1,name,cat_id,dateCurrent,dateCurrent);
        ProductTypeModel.add(c);
        ServletUtils.redirect("/Admin/Product/Type/Add", request, response);
    }

    private void updateProductType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Update thong tin ProductType va dieu chinh modify time thanh thoi gian hien tai
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int cat_id = Integer.parseInt(request.getParameter("category_id"));
        ProductType c = new ProductType(id, name, cat_id);
        ProductTypeModel.update(c);
        ServletUtils.redirect("/Admin/Product/Type/", request, response);
    }

    private void deleteProductType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductTypeModel.delete(id);
        ServletUtils.redirect("/Admin/Product/Type/", request, response);
    }
}