package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        switch (path) {
            case "/Index": {
                List<ProductType> list = ProductTypeModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("productTypeList", list);             //Cho phep day du lieu bat ki ra view, khi ben ngoai view nos la 1 attribute
                ServletUtils.forward("/views/vwProductType/Index.jsp", request, response);
                break;
            }
            case "/Add": {
//                ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
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
        switch (path) {
            case "/Add": {
                addCategory(request, response);
                break;
            }
            case "/Delete": {
                deleteCategory(request, response);
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
    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("name");
//        Date dateCurrent = new Date();
//        Category c = new Category(-1,name,dateCurrent,dateCurrent);
//        CategoryModel.add(c);
//        ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
    }

    private void updateProductType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Update thong tin ProductType va dieu chinh modify time thanh thoi gian hien tai
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int cat_id = Integer.parseInt(request.getParameter("category_id"));
        String createTime = request.getParameter("create_time");
        String modifyTime = request.getParameter("modified_time");
        Date createTimeParsed;
        Date modifyTimeParsed;
        Date dateCurrent = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            createTimeParsed = df.parse(createTime);
            modifyTimeParsed = dateCurrent;
        }catch (ParseException ex){
            createTimeParsed = dateCurrent;
            modifyTimeParsed = dateCurrent;
        }
        ProductType c = new ProductType(id,name,cat_id,createTimeParsed,modifyTimeParsed);
        ProductTypeModel.update(c);
        ServletUtils.redirect("/Admin/Product/Type/", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        CategoryModel.delete(id);
//        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
