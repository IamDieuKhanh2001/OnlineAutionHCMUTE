package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            case "/ByProID": {
                int proID = 0;
                try {
                    proID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                List<Product> list = ProductModel.findAllProductByProductTypeID(proID);          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("products", list);             //Cho phep day du lieu bat ki ra view, khi ben ngoai view nos la 1 attribute
                ServletUtils.forward("/views/vwProduct/ByProID.jsp", request, response);
                break;
            }
            case "/AddWatchList": {
                int id = 0;
                int bidderID = 6; //Bien luu id user lấy trên session (chưa xong)
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);              //Kiem tra thong tin bidder, san pham
                User u = UserModel.findById(bidderID);
                if (c != null) {
                    if (WatchListModel.findByProID(c.getId()) == null){
                        WatchListModel.add(c,u);
                        ServletUtils.redirect("/Home",request,response);
                    }else{
                        System.out.println("da co");
                        ServletUtils.redirect("/Home",request,response);
                    }
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
//            case "/Detail": {
//                int proId = Integer.parseInt(request.getParameter("id"));
//                Product product = ProductModel.findById(proId);
//                if(product == null){
//                    ServletUtils.redirect("/Home",request,response);
//                }else{
//                    request.setAttribute("product",product);
//                    ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
//                }
//                break;
//            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
