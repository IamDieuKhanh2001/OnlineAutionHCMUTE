package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.EmailTemplate;
import com.ute.onlineautionhcmute.utils.SendEmail;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
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
                List<ProductType> productTypeList = ProductTypeModel.findAll();
                request.setAttribute("productTypeList",productTypeList);
                ServletUtils.forward("/views/vwProduct/Add.jsp",request,response);
                break;
            }
            case "/Edit":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(id);
                if (c != null && c.getUser_id() == userLogin.getId()) {              //Kiểm tra sản phẩm tồn tại và có thuộc sở hữu người login k
                    request.setAttribute("product", c);                                  //San pham id can tim
                    User sellerInfo = UserModel.findById(c.getUser_id());                   //Attribute hien thi ten username ng ban ra view
                    request.setAttribute("sellerInfo", sellerInfo);
                    ProductType proType = ProductTypeModel.findById(c.getProduct_type_id()); //Attribute hien thi ten product type ra view
                    request.setAttribute("proType", proType);
                    ServletUtils.forward("/views/vwProduct/Edit.jsp",request,response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            //Xem tat ca san pham cua seller da dang
            case "/All":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                List<Product> sellerProduct = ProductModel.findByUserID(userLogin.getId());     //Lay id user tu session AuthUser
                request.setAttribute("products", sellerProduct);
                ServletUtils.forward("/views/vwProduct/SellerProducts.jsp",request,response);
                break;
            }
            case "/History":{
                //Nhận vào product id
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                Product p = ProductModel.findById(id);
                if(p != null){
                    List<ProductHistory> productHistory = ProductHistoryModel.findByProductID(p.getId());
                    Collections.sort(productHistory);
                    List<User> allUser = UserModel.findAll();
                    request.setAttribute("product", p);
                    request.setAttribute("productHistory", productHistory);
                    request.setAttribute("allUser", allUser);
                }else{
                    ServletUtils.forward("/views/204.jsp", request, response);
                }

                ServletUtils.forward("/views/vwProduct/SellerProductBiddingHistory.jsp",request,response);
                break;
            }
            case "/RequestList": {
                int productID = -1;
                try {
                    productID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                List<AuctionPermission> productAuctionRequest = AuctionPermissionModel.findProductPermissionByProductId(productID,"request");
                List<User> users = UserModel.findAll();
                Product product = ProductModel.findById(productID);
                request.setAttribute("productAuctionRequest",productAuctionRequest);
                request.setAttribute("users",users);
                request.setAttribute("product",product);
                ServletUtils.forward("/views/vwProduct/SellerBiddingRequest.jsp",request,response);
                break;
            }
            case "/AcceptRequest":{
                int productID = -1;
                int userID = -1;
                try {
                    productID = Integer.parseInt(request.getParameter("ProductId"));
                    userID = Integer.parseInt(request.getParameter("UserId"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                AuctionPermission auctionRequest = AuctionPermissionModel.findByProductIdAndUserId(productID,userID,"request");
                auctionRequest.setStatus("accept");
                AuctionPermissionModel.update(auctionRequest);
                String retUrl = "/Seller/Product/RequestList?id=" + productID;
                ServletUtils.redirect(retUrl,request,response);
                break;
            }
            case "/DenyRequest":{
                int productID = -1;
                int userID = -1;
                try {
                    productID = Integer.parseInt(request.getParameter("ProductId"));
                    userID = Integer.parseInt(request.getParameter("UserId"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                AuctionPermission auctionRequest = AuctionPermissionModel.findByProductIdAndUserId(productID,userID,"request");
                AuctionPermissionModel.delete(auctionRequest);
                String retUrl = "/Seller/Product/RequestList?id=" + productID;
                ServletUtils.redirect(retUrl,request,response);
                break;
            }

            case "/ProductPostExpired":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                List<Product> c = ProductModel.findProductPostExpired(userLogin.getId());
                request.setAttribute("products", c);
                ServletUtils.forward("/views/vwProduct/ProductPostExpired.jsp",request,response);
                break;
            }

            case "/ProductWinner":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                List<Product> c = ProductModel.findProductWinnerOfSeller(userLogin.getId());
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwProduct/ProductWinner.jsp",request,response);
                break;
            }

            case "/ProductWinner/EvaluationOfSeller":{
                ServletUtils.forward("/views/vwProduct/EvaluationOfSeller.jsp",request,response);
                break;
            }

            case "/ProductWinner/EvaluationOfSeller/DoneEvaluation":{
                ServletUtils.forward("/views/vwProduct/DoneEvaluation.jsp",request,response);
                break;
            }

            case "/ProductWinner/EvaluationOfSeller/FailedEvaluation":{
                ServletUtils.forward("/views/vwProduct/ResultEvaluation.jsp",request,response);
                break;
            }

            case "/ProductWinner/DenyDeal":{
                int bidderid = Integer.parseInt(request.getParameter("bidderid"));
                int productid = Integer.parseInt(request.getParameter("productid"));
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");
                String comment = "Người thắng không thanh toán";
                String type = "dislike";
                // Kiểm tra đã đánh giá trước đó chưa
                Evaluation evalutionValid = EvaluationModel.findByAssessorAndProductID(userLogin.getId(), productid);
                if(evalutionValid != null) // da ton tai
                {
                    request.setAttribute("message","Bạn đã hủy giao dịch đánh giá trước đó");
                    ServletUtils.forward("/views/vwProduct/ResultEvaluation.jsp",request,response);
                    return;
                }
                Evaluation evaluation = new Evaluation(-1,productid,userLogin.getId(),bidderid,type,comment);
                EvaluationModel.add(evaluation);

                WinnerModel.delete(productid);

                request.setAttribute("message","Đã hủy giao dịch thảnh công");
                ServletUtils.forward("/views/vwProduct/ResultEvaluation.jsp",request,response);
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
            case "/Edit": {
                editProduct(request, response);
                break;
            }

            case "/History/Delete": {
                int productID = -1;
                int userHighestBiddingID = -1;
                try {
                    productID = Integer.parseInt(request.getParameter("productID"));
                    userHighestBiddingID = Integer.parseInt(request.getParameter("userHighestBiddingID"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                System.out.println("Product id" + productID);
                System.out.println("User highest" + userHighestBiddingID);
                ProductHistoryModel.deleteByProductIdAndUserId(productID,userHighestBiddingID);   //Xoa lich su dau gia nguoi id user do
                AuctionHistoryModel.deleteByProductIdAndUserId(productID,userHighestBiddingID);   //Xoa lich su dat gia cao nhat id user do
                ProductHistory secondBiddingHistory = ProductHistoryModel.findHighestPriceBiddingRecord(productID); //Tìm người đấu giá cao thứ 2 và update thành người đấu giá cao nhất
                System.out.println(secondBiddingHistory);
                if(secondBiddingHistory != null){
                    Product product = ProductModel.findById(secondBiddingHistory.getProduct_id());
                    product.setPrice_current(secondBiddingHistory.getPrice_bidding());
                    product.setUser_id_holding_price(secondBiddingHistory.getUser_id_holding());
                    ProductModel.update(product);
                }else{                                          //Nếu đã cấm hết người đang bidding sản phẩm | reset giá về ban đầu và user id là null
                    Product product = ProductModel.findById(productID);
                    product.setPrice_current(product.getPrice_start());
                    product.setUser_id_holding_price(0);
                    ProductModel.update(product);
                }
                AuctionPermission auctionPermissionDeletedUser = new AuctionPermission(-1,productID,userHighestBiddingID,"block"); //Chặn người dùng này không cho đấu sp này nữa
                AuctionPermissionModel.add(auctionPermissionDeletedUser);

                //Gửi mail thông báo đến người bị từ chối
                User userTop = UserModel.findById(userHighestBiddingID);
                Product product = ProductModel.findProductByID(productID);
                Thread threadSendEmail = new Thread(()->{
                    try {
                        String nameProduct = "Product";
                        if(product != null)
                            nameProduct = product.getName();
                        String emailTitle = "You Have Been Banned From Bidding";
                        String emailContent = EmailTemplate.TemplateNotification("You Have Been Banned From Bidding ", "You have been banned from bidding on the product <h1><b>"+ nameProduct +"</b></h1>");
                        SendEmail.sendAsHtml(userTop.getEmail(), emailTitle, emailContent);
                    } catch (Exception ex) {

                    }
                });
                threadSendEmail.start();
                // End SendEmail

                String retUrl = "/Seller/Product/History?id=" + productID;
                ServletUtils.redirect(retUrl,request,response);
                break;
            }

            case "/ProductWinner/EvaluationOfSeller":{

                String productbidder = request.getParameter("productbidder");
                request.setAttribute("productbidder", productbidder);
                String productname = request.getParameter("productname");
                request.setAttribute("productname", productname);
                String productid = request.getParameter("productid");
                request.setAttribute("productid", productid);
                String bidderid = request.getParameter("bidderid");
                request.setAttribute("bidderid", bidderid);
                ServletUtils.forward("/views/vwProduct/EvaluationOfSeller.jsp",request,response);
                break;
            }

            case "/ProductWinner/EvaluationOfSeller/DoneEvaluation":{
                addevaluation(request,response);
                break;
            }

            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productID"));
        String old_description = request.getParameter("old_description");
        String descriptionAppend = request.getParameter("description");
        Date dateNow = new Date();
        String appendDateModified = "<br>"+ "Bổ sung vào lúc: " + String.valueOf(dateNow) + "<br>";
        String descriptionEdited = old_description + appendDateModified + descriptionAppend;
        Product p = ProductModel.findById(id);
        p.setDescription(descriptionEdited);
        p.setModified_time(dateNow);
        ProductModel.update(p);
        ServletUtils.redirect("/Seller/Product/All", request, response);
    }


    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int product_type_id = Integer.parseInt(request.getParameter("Product_type_id"));
        int user_id = userLogin.getId();

        int end_time_select = Integer.parseInt(request.getParameter("end_time"));
        long dayNowMillis = System.currentTimeMillis();
        Date end_time = new Date(dayNowMillis + (24 * 60 * 60 * 1000 * end_time_select));   //Luu thoi gian ket thuc ng user


        double priceStart = Double.parseDouble(request.getParameter("priceStart"));
        double priceCurrent = Double.parseDouble(request.getParameter("priceStart"));
        double priceStep = Double.parseDouble(request.getParameter("PriceStep"));
        double priceBuyNow = Double.parseDouble(request.getParameter("PriceBuyNow"));
        Product p = new Product(-1,name,description,product_type_id,user_id,priceStart,priceStep,priceCurrent,priceBuyNow,end_time);
        ProductModel.add(p);

        storeImage(request,response);  //Lưu hình vào server

        ServletUtils.redirect("/Seller/Product/Dashboard",request,response);    //Sua lai duong dan view
    }
    private void addevaluation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");

        String txtnamebidder = request.getParameter("txtnamebidder");
        String txtnameproduct = request.getParameter("txtnameproduct");
        String txtcomment = request.getParameter("txtcomment");
        String type = request.getParameter("fav_language");
        int bidderid = Integer.parseInt(request.getParameter("bidderid"));
        int productid = Integer.parseInt(request.getParameter("productid"));


        // Kiểm tra đã đánh giá trước đó chưa
        Evaluation evaluation = EvaluationModel.findByAssessorAndProductID(user.getId(), productid);
        if(evaluation != null) // da ton tai
        {
            request.setAttribute("message","Bạn đã đánh giá trước đó");
            ServletUtils.forward("/views/vwProduct/ResultEvaluation.jsp",request,response);
            return;
        }
        evaluation = new Evaluation();
        evaluation.setAssessor(user.getId());
        evaluation.setUser_id(bidderid);
        evaluation.setProduct_id(productid);
        evaluation.setType(type);
        evaluation.setComment(txtcomment);
        EvaluationModel.add(evaluation);
        request.setAttribute("message","Đã gửi đánh giá thành công");
        ServletUtils.forward("/views/vwProduct/ResultEvaluation.jsp",request,response);
    }

    private void storeImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        Product p = ProductModel.findInsertRecentByUserID(userLogin.getId());

        for (Part part : request.getParts()) { //Nhan hinh anh tu browse và lưu vào server
            if (part.getName().equals("mainImg")) {
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
