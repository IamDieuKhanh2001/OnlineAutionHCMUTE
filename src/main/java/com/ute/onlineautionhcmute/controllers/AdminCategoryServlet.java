package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.Category;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.ProductType;
import com.ute.onlineautionhcmute.models.CategoryModel;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.ProductTypeModel;
import com.ute.onlineautionhcmute.utils.ServletUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
            case "/CheckCategoryContainProductType": { // Kiểm tra danh mục này còn chứa những loại sản phẩm nào
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                JSONObject jsonObject = new JSONObject();

                int categoryID = -1;
                try {
                    categoryID = Integer.parseInt(request.getParameter("categoryID"));
                } catch (Exception ex) {
                    jsonObject.put("status", "error");
                    jsonObject.put("data", new JSONArray());
                    out.print(jsonObject.toJSONString());
                    break;
                }

                List<ProductType> listProductType = ProductTypeModel.findProductTypeWithCategoryID(categoryID);
                if(listProductType.size() == 0)
                {
                    jsonObject.put("status", "success");
                    jsonObject.put("data", new JSONArray());
                    out.print(jsonObject.toJSONString());
                    break;
                }
                jsonObject.put("status", "error");
                JSONArray jsonArray = new JSONArray();
                for(ProductType productType : listProductType)
                {
                    JSONObject productJson = new JSONObject();
                    productJson.put("name", productType.getName());
                    jsonArray.add(productJson);
                }
                jsonObject.put("data", jsonArray);
                out.print(jsonObject.toJSONString());
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
        Category c = new Category(id, name);
        CategoryModel.update(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
