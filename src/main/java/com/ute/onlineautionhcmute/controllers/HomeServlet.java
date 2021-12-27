package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
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
        switch (path){
            case "/Index":{
                int pagecurrent =1;
                try {
                    pagecurrent = Integer.parseInt(request.getParameter("pagecurrent"));
                    if (pagecurrent <= 0)
                        pagecurrent =1;
                }
                catch (Exception ex){

                }
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                int endPage = list.size() / 6;
                if(list.size() % 6 != 0 ){
                    endPage++;
                }
                request.setAttribute("endP",endPage);
                request.setAttribute("currentPage",pagecurrent);

                List<Product> c = ProductModel.findProductbyPages(pagecurrent);
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);

                List<ProductBiddingCount> list2 = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list2);
                ServletUtils.forward("/views/vwHome/Index.jsp",request,response);
                break;
            }
            case "/About":{
                ServletUtils.forward("/views/vwHome/About.jsp",request,response);
                break;
            }

            case
             "/Top5ProductPriceExpire":{
                List<Product> c = ProductModel.findTop5ProductPriceExpire();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list);
                ServletUtils.forward("/views/vwHome/Top5ProductPriceExpire.jsp",request,response);
                break;
            }

            case "/Top5ProductExpire":{
                List<Product> c = ProductModel.findTop5ProductExpire();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list);
                ServletUtils.forward("/views/vwHome/Top5ProductExpire.jsp",request,response);
                break;
            }

            case "/Top5ProductPriceBidding":{
                List<ProductBiddingCount2> c = ProductBiddingCount2Model.findTop5ProductBidding();
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list);
                ServletUtils.forward("/views/vwHome/Top5ProductBidding.jsp",request,response);
                break;
            }

            case "/TopFive":{
                ServletUtils.forward("/views/vwHome/TopFive.jsp",request,response);
                break;
            }

            case "/Search": {
                CheckStateSearchGet(request,response);
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
        String path = request.getPathInfo();
        switch (path) {
            case "/Search": {
                CheckStateSearchPost(request,response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    private void CheckStateSearchPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sortrequest = Integer.parseInt(request.getParameter("sortrequest"));
        String search = request.getParameter("txtsearch");
        int endPage;
        int pagecurrent =1;
        try {
            pagecurrent = Integer.parseInt(request.getParameter("pagecurrent"));
            if (pagecurrent <= 0)
                pagecurrent =1;
        }
        catch (Exception ex){

        }


        if(sortrequest == 1 && search != "" )
        {
            List<Product> c = ProductModel.fullTextSearchTime(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPagesFTSTime(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else if (sortrequest == 2 && search != "") {
            List<Product> c = ProductModel.fullTextSearchPrice(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPagesFTSPrice(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else if(sortrequest == 1 )
        {
            List<Product> c = ProductModel.findAllLowerTime();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPagesLowerTime(pagecurrent);
            request.setAttribute("products", list);
        }
        else if(sortrequest == 2 )
        {
            List<Product> c = ProductModel.findAllHigherPrice();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPagesHigherPrice(pagecurrent);
            request.setAttribute("products", list);
        }
        else if (search != "")
        {
            List<Product> c = ProductModel.fullTextSearch(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPagesFTS(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else{
            List<Product> c = ProductModel.findAll();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            List<Product> list = ProductModel.findProductbyPages(pagecurrent);
            request.setAttribute("products", list);
        }

        request.setAttribute("endP",endPage);
        List<User> sellerList = UserModel.findAll();
        request.setAttribute("sellerList", sellerList);
        List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
        request.setAttribute("quantity",list);
        request.setAttribute("txtsearch",search);
        request.setAttribute("sortrequest",sortrequest);
        request.setAttribute("currentPage",pagecurrent);
        ServletUtils.forward("/views/vwHome/Search.jsp", request, response);
    }
    private void CheckStateSearchGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sortrequest = Integer.parseInt(request.getParameter("sortrequest"));
        String search = request.getParameter("txtsearch");
        int endPage;
        int pagecurrent =1;
        try {
            pagecurrent = Integer.parseInt(request.getParameter("pagecurrent"));
            if (pagecurrent <= 0)
                pagecurrent =1;
        }
        catch (Exception ex){

        }

        if(sortrequest == 1 && search != "" )
        {
            List<Product> c = ProductModel.fullTextSearchTime(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPagesFTSTime(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else if (sortrequest == 2 && search != "") {
            List<Product> c = ProductModel.fullTextSearchPrice(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPagesFTSPrice(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else if(sortrequest == 1 )
        {
            List<Product> c = ProductModel.findAllLowerTime();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPagesLowerTime(pagecurrent);
            request.setAttribute("products", list);
        }
        else if(sortrequest == 2 )
        {
            List<Product> c = ProductModel.findAllHigherPrice();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPagesHigherPrice(pagecurrent);
            request.setAttribute("products", list);
        }
        else if (search != "")
        {
            List<Product> c = ProductModel.fullTextSearch(search);
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPagesFTS(search,pagecurrent);
            request.setAttribute("products", list);
        }
        else{
            List<Product> c = ProductModel.findAll();
            request.setAttribute("products", c);
            endPage = c.size() / 6;
            if(c.size() % 6 != 0 ){
                endPage++;
            }
            request.setAttribute("endP",endPage);
            request.setAttribute("currentPage",pagecurrent);
            List<Product> list = ProductModel.findProductbyPages(pagecurrent);
            request.setAttribute("products", list);
        }

        request.setAttribute("txtsearch",search);
        request.setAttribute("sortrequest",sortrequest);
        request.setAttribute("currentPage",pagecurrent);
        List<User> sellerList = UserModel.findAll();
        request.setAttribute("sellerList", sellerList);
        List<ProductBiddingCount> list = ProductBiddingCountModel.findProductBiddingCount();
        request.setAttribute("quantity",list);
        ServletUtils.forward("/views/vwHome/Search.jsp", request, response);
    }
}






