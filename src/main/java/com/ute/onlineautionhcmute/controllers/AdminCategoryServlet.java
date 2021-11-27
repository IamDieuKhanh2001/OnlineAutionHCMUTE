package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index": {
                List<Category> list = CategoryModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("categories", list);             //Cho phep day du lieu bat ki ra view, khi ben ngoai view nos la 1 attribute
                ServletUtils.forward("/views/vwCategory/Index.jsp", request, response);
                break;
            }
            case "/Add": {
                ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
                break;
            }
            case "/Edit": {
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {

                }
                Category c = CategoryModel.findById(id);

                if (c != null) {
                    request.setAttribute("category", c);
                    ServletUtils.forward("/views/vwCategory/Edit.jsp", request, response);
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
                updateCategory(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Date dateCurrent = new Date();
        Category c = new Category(-1,name,dateCurrent,dateCurrent);
        CategoryModel.add(c);
        ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Update thong tin category va dieu chinh modify time thanh thoi gian hien tai
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
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
        Category c = new Category(id, name,createTimeParsed,modifyTimeParsed);
        CategoryModel.update(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
