package com.ute.onlineautionhcmute.controllers;

import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.EmailTemplate;
import com.ute.onlineautionhcmute.utils.SendEmail;
import com.ute.onlineautionhcmute.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        switch (path) {
            //Bidder xem sp theo mục Product type id
            case "/ByProID": {
                int proID = 0;
                try {
                    proID = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                int pagecurrent =1;
                try {
                    pagecurrent = Integer.parseInt(request.getParameter("pagecurrent"));
                    if (pagecurrent <= 0)
                        pagecurrent =1;
                }
                catch (Exception ex){

                }

                List<Product> list = ProductModel.findAllProductByProductTypeID(proID);
                request.setAttribute("products", list);
                int endPage = list.size() / 6;
                if(list.size() % 6 != 0 ){
                    endPage++;
                }
                request.setAttribute("endP",endPage);
                request.setAttribute("currentPage",pagecurrent);
                List<Product> c = ProductModel.findProducTypeIdByPages(proID,pagecurrent);
                request.setAttribute("products", c);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                request.setAttribute("proID",proID);
                List<ProductBiddingCount> list2 = ProductBiddingCountModel.findProductBiddingCount();
                request.setAttribute("quantity",list2);
                ServletUtils.forward("/views/vwProduct/ByProID.jsp", request, response);
                break;
            }

            case "/MyWatchList": {
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");
                List<WatchList> userWatchList = WatchListModel.findByUserID(userLogin.getId());  // User id lay tu session
                request.setAttribute("userWatchList", userWatchList);
                List<Product> userProduct = new ArrayList<>();         //Tim san pham tu watchlist ra product
                for (WatchList item : userWatchList) {
                    Product p = ProductModel.findProductByID(item.getProduct_id());
                    if (p != null) {
                        userProduct.add(p);
                    }
                }
                request.setAttribute("products", userProduct);
                List<User> sellerList = UserModel.findAll();
                request.setAttribute("sellerList", sellerList);
                ServletUtils.forward("/views/vwProduct/watchList.jsp", request, response);
                break;
            }

            case "/RemoveFromWatchList": {
                String url = request.getHeader("referer"); //Luu dia chi trang trc do de quay ve
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                WatchList wl = WatchListModel.findByProIdAndUserId(id, userLogin.getId());
                if (wl != null) {
                    WatchListModel.delete(id, userLogin.getId());
                    ServletUtils.redirect(url, request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }

            case "/WatchList/IsAvailable": {
                boolean isAvailable = false;
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int productID = -1;
                try
                {
                    productID = Integer.parseInt(request.getParameter("idProductAddingToWatchList"));
                }
                catch (Exception ex)
                {
                    out.print(isAvailable);
                    out.flush();
                    break;
                }

                WatchList wl = WatchListModel.findByProIdAndUserId(productID, userLogin.getId());
                isAvailable = (wl == null);

                out.print(isAvailable);
                out.flush();
                break;
            }

            case "/WatchList/Add": {
                boolean isAdd = false;
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");
                Boolean auth = (Boolean) session.getAttribute("auth");

                int productID = 0;
                try {
                    productID = Integer.parseInt(request.getParameter("productID"));
                } catch (NumberFormatException e) {
                    out.print(isAdd);
                    out.flush();
                    break;
                }
                Product c = ProductModel.findById(productID);
                if(!auth){  //Nếu chưa đăng nhập thì không cho sp vào watchlist
                    out.print(isAdd);
                    out.flush();
                    break;
                }
                if (c != null) {                             //neu trong watchlist chuwa có sp
                    if (WatchListModel.findByProIdAndUserId(c.getId(), userLogin.getId()) == null) {
                        WatchListModel.add(c, userLogin);
                        isAdd = true;
                        out.print(isAdd);
                        out.flush();
                        break;
                    } else {                                                 //neu trong watchlist da có sp
                        out.print(isAdd);
                        out.flush();
                        break;
                    }
                } else {
                    out.print(isAdd);
                    out.flush();
                    break;
                }
            }

            case "/Detail": {
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");

                int productID = -1;
                try {
                    productID = Integer.parseInt(request.getParameter("id"));
                } catch (Exception ex) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                }

                Product product = ProductModel.findById(productID);
                if (product == null)
                    ServletUtils.forward("/views/404.jsp", request, response);

                User seller = UserModel.findById(product.getUser_id());
                User userHighestBid = UserModel.findById(product.getUser_id_holding_price());
                if(userHighestBid == null){
                    userHighestBid = new User(-1);
                }
                List<Product> similarProduct = ProductModel.findFirstFiveProductByProductTypeID(product.getProduct_type_id()); //Hien thi danh sach 5 san pham cung chuyen muc

                request.setAttribute("product", product);
                request.setAttribute("seller", seller);
                request.setAttribute("userHighestBid",userHighestBid);
                request.setAttribute("similarProduct", similarProduct);
                if(product.getEnd_time().after(new Date())){                 //Kiem tra thoi gian ket thuc chua
                    request.setAttribute("time_ended", false);
                }else{
                    request.setAttribute("time_ended", true);
                }
                //Kiểm tra người dùng có đủ 80% lượt like không
                List<Evaluation> userLoginAllEvaluation = EvaluationModel.findAllEvaluationByUserID(userLogin.getId());
                List<Evaluation> userLoginLikeEvaluation = EvaluationModel.findLikeEvaluationByUserID(userLogin.getId());
                AuctionPermission userPermissionAccept = AuctionPermissionModel.findByProductIdAndUserId(productID,userLogin.getId(),"accept");
                if(userPermissionAccept != null){         //dc CHo phep dau gia
                    request.setAttribute("allowBidding", true);
                }
                else if(userLoginAllEvaluation.size() != 0){
                    float likeEvaluationRequire = (float) (userLoginAllEvaluation.size() * 80) / 100;
                    if(userLoginLikeEvaluation.size() >= likeEvaluationRequire){
                        request.setAttribute("allowBidding", true);
                    }else{
                        request.setAttribute("allowBidding", false);
                    }
                }else{
                    request.setAttribute("allowBidding", false);
                }

                //Lich su dau gia
                //Nhận vào product id
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }

                Product p = ProductModel.findById(id);

                if(p != null) {
                    List<ProductHistory> list = ProductHistoryModel.findByProductID(p.getId());
                    request.setAttribute("listProduct_history", list);
                    List<User> user = UserModel.findAll();
                    request.setAttribute("user", user);
                }
                else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }

                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
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
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        switch (path) {
            case "/Auction": {
                if (!(boolean) session.getAttribute("auth")) {
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }else{
                    checkAuctionProduct(request, response);
                }
                break;
            }
            case "/Request": {
                auctionRequest(request,response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    private void auctionRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        int productID = -1;
        try {
            productID = Integer.parseInt(request.getParameter("productID"));
        } catch (Exception ex) {
            ServletUtils.forward("/views/404.jsp", request, response);
        }
        String setStatus = "request";
        AuctionPermission isAvailableRequest = AuctionPermissionModel.findByProductIdAndUserId(productID,userLogin.getId(),"request");
        if(isAvailableRequest == null){
            AuctionPermission auctionRequest = new AuctionPermission(-1,productID,userLogin.getId(),setStatus);
            AuctionPermissionModel.add(auctionRequest);

            // Gửi mail thông báo đến người bán là có người yêu cầu đấu giá
            Product product = ProductModel.findProductByID(productID); // Lấy thông tin sản phẩm đang yêu cầu đấu giá
            Thread threadSendEmail = new Thread(()->{
                try
                {
                    String productName = "";
                    User userSeller = null;
                    if(product != null)
                    {
                        productName = product.getName();
                        userSeller = UserModel.findById(product.getUser_id()); // Lấy mail của người bán để nhận mail
                    }
                    if(userSeller == null)
                        return;
                    String emailSeller = userSeller.getEmail();

                    String title = "Someone has requested to bid on your product";
                    String contentMain = "You have received a request to bid for a product name: <h1><b>[name]</b></h1>";
                    contentMain = contentMain.replace("[name]", productName);
                    String content = EmailTemplate.TemplateNotification("Request a product auction", contentMain);
                    SendEmail.sendAsHtml(emailSeller, title, content);
                }
                catch (Exception ex) { }
            });
            threadSendEmail.start();
            //End Send Email
        }
        String retUrl = "/Product/Detail?id=" + productID;
        ServletUtils.redirect(retUrl,request,response);
    }

    private void checkAuctionProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        int productId = -1;
        try {
            productId = Integer.parseInt(request.getParameter("id"));
        } catch (Exception ex) {
            ServletUtils.forward("/views/404.jsp", request, response);
        }
            Product product = ProductModel.findById(productId);
        if (product != null && product.getEnd_time().after(new Date())) { //Nếu sp chưa hết hạn
            AuctionPermission auctionBlocked = AuctionPermissionModel.findByProductIdAndUserId(productId,userLogin.getId(),"block");
            if(auctionBlocked != null && auctionBlocked.getStatus().equals("block")){ //Nếu tk đã có trong auction permission có status block (Người bán cấm)
                request.setAttribute("product",product);
                request.setAttribute("ResultMessage","Bạn đã bị người bán cấm đấu giá sản phẩm này, bạn không thể đấu sản phẩm này được nữa!!");
            }else{ //Nếu không bị người bán cấm thì xử lí đấu giá
                auctionProduct(product,request,response);
            }
        } else {
            ServletUtils.forward("/views/204.jsp", request, response);
        }

        request.setAttribute("product",product);
        ServletUtils.forward("/views/vwProduct/BidResult.jsp",request,response);
    }
    private void auctionProduct(Product product,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("authUser");

        if(userLogin.getId() == product.getUser_id_holding_price()){
            request.setAttribute("ResultMessage","Bạn đã đặt giá cho sản phẩm này rồi!!");
            return;
        }
        double currentAuctionPrice = Double.parseDouble(request.getParameter("maxAuctionPrice")); //So tien nguoi hien tai dat
        if(product.getPrice_start() > currentAuctionPrice || product.getPrice_current() > currentAuctionPrice){
            request.setAttribute("ResultMessage","Đặt giá không thành công, giá trị đặt cần lớn hơn giá ban đầu");
            return;
        }else if(product.getPrice_buy_now() <= currentAuctionPrice){
            request.setAttribute("ResultMessage","Giá trị bạn đặt đã vượt qua giá mua ngay của sản phẩm, bạn có thể nhấn vào mua ngay");
            return;
        }


        if(product.getUser_id_holding_price() == 0){ // Nguoi dau tien dat, gia vao cung la gia bat dau
            AuctionHistory productDeposit = new AuctionHistory(-1,product.getId(),userLogin.getId(),currentAuctionPrice);
            AuctionHistoryModel.add(productDeposit);
            product.setUser_id_holding_price(userLogin.getId());
            ProductModel.update(product);
            //Luu lich su san pham
            ProductHistory productHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),product.getUser_id_holding_price());
            ProductHistoryModel.add(productHistory);
            request.setAttribute("ResultMessage","Bạn đã đặt giá thành công cho sản phẩm!! vui lòng kiểm tra lịch sử đấu giá tại sản phẩm");

            // Send Email đến người bán
            User userSeller = UserModel.findById(product.getUser_id()); // Lấy thông tin người bán
            Thread threadSendEmail = new Thread(()->{
                try {
                    String emailTo = userSeller.getEmail();
                    String title = "Someone has placed a bid on your product";
                    String contentMain = "Someone has placed a bid on your product: <h1><b>[name]</b></h1>";
                    contentMain = contentMain.replace("[name]", product.getName());
                    String content = EmailTemplate.TemplateNotification("Someone has bid", contentMain);
                    SendEmail.sendAsHtml(emailTo, title, content);
                } catch (Exception ex) {
                }
            });
            threadSendEmail.start();
            // End Send Email
        }
        else{                                                           // Nguoi thu 2 tro di dat
            AuctionHistory previousAuctionBidder = AuctionHistoryModel.findMaxDepositPrice(product);
            if(previousAuctionBidder.getDeposit_price() > currentAuctionPrice){
                AuctionHistory productDeposit = new AuctionHistory(-1,product.getId(),userLogin.getId(),currentAuctionPrice);
                AuctionHistoryModel.add(productDeposit);
                product.setPrice_current(currentAuctionPrice);
                ProductModel.update(product);
                //Luu lich su san pham
                //Lưu người giữ giá của sp hiện tại
                ProductHistory HightestProductHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),product.getUser_id_holding_price());
                ProductHistoryModel.add(HightestProductHistory);
                //Lưu người đặt giá hiện tại bị vượt do đấu giá sau người trước
                ProductHistory currentBiddingProductHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),userLogin.getId());
                ProductHistoryModel.add(currentBiddingProductHistory);
                request.setAttribute("ResultMessage","Giá trị bạn đặt đã bị vượt qua!! Hãy đặt giá cao hơn");
            }
            else if(previousAuctionBidder.getDeposit_price() < currentAuctionPrice){
                AuctionHistory productDeposit = new AuctionHistory(-1,product.getId(),userLogin.getId(),currentAuctionPrice);
                AuctionHistoryModel.add(productDeposit);
                product.setPrice_current(previousAuctionBidder.getDeposit_price() + product.getPrice_step());
                product.setUser_id_holding_price(userLogin.getId());
                ProductModel.update(product);
                //Luu lich su san pham
                //Lưu người giữ giá của sp hiện tại
                ProductHistory HightestProductHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),product.getUser_id_holding_price());
                ProductHistoryModel.add(HightestProductHistory);
                request.setAttribute("ResultMessage","Bạn đã đặt giá thành công cho sản phẩm!! vui lòng kiểm tra lịch sử đấu giá tại sản phẩm");

                // Send Email đến người giữa giá trước đó đã bị đặt giá cao hơn
                User userHoldPricePrevious = UserModel.findById(previousAuctionBidder.getUser_id()); // Lấy thông tin người giữ giá trước đó
                if(userHoldPricePrevious == null)
                    return;
                Thread threadSendEmail = new Thread(()->{
                    try {
                        String emailTo = userHoldPricePrevious.getEmail();
                        String title = "Someone has outbid you";
                        String contentMain = "Someone has outbid you for product: <h1><b>[name]</b></h1>";
                        contentMain = contentMain.replace("[name]", product.getName());
                        String content = EmailTemplate.TemplateNotification("Someone has outbid you", contentMain);
                        SendEmail.sendAsHtml(emailTo, title, content);
                    } catch (Exception ex) {
                    }
                });
                threadSendEmail.start();
                // End Send Email
            }
            else if(previousAuctionBidder.getDeposit_price() == currentAuctionPrice){
                AuctionHistory productDeposit = new AuctionHistory(-1,product.getId(),userLogin.getId(),currentAuctionPrice);
                AuctionHistoryModel.add(productDeposit);
                product.setPrice_current(previousAuctionBidder.getDeposit_price());
                ProductModel.update(product);
                //Luu lich su san pham
                //Lưu người giữ giá của sp hiện tại
                ProductHistory HightestProductHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),product.getUser_id_holding_price());
                ProductHistoryModel.add(HightestProductHistory);
                //Lưu người đặt giá hiện tại bị vượt do đấu giá sau người trước
                ProductHistory currentBiddingProductHistory = new ProductHistory(-1,product.getId(),product.getPrice_current(),userLogin.getId());
                ProductHistoryModel.add(currentBiddingProductHistory);
                request.setAttribute("ResultMessage","Đã có người đặt giá bằng bạn và trước bạn!! Hãy đặt giá cao hơn");
            }
        }
    }
}

