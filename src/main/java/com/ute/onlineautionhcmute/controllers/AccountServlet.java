package com.ute.onlineautionhcmute.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.*;
import org.apache.commons.codec.digest.DigestUtils;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@WebServlet(name = "AccountServlet", value = "/Account/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String path = request.getPathInfo();
        switch (path) {
//            Profile
            case "/Profile":
            case "/Profile/":
            case "/Profile/Overview":
            case "/Profile/Overview/":
            {
                User userLogin = (User)session.getAttribute("authUser");

                List<Evaluation.HistoryEvaluation> listEvaluationHistory = EvaluationModel.findAllEvaluationHistoryByUserID(userLogin.getId());

                int totalEvaluation = listEvaluationHistory.size();
                int likeEvaluation = 0;
                int dislikeEvaluation = 0;

                for(Evaluation.HistoryEvaluation history : listEvaluationHistory)
                {
                    if(history.getType().equals("like"))
                        likeEvaluation++;
                    else if(history.getType().equals("dislike"))
                        dislikeEvaluation++;
                }

                float percentLike = 0;
                float percentDislike = 0;
                if(totalEvaluation != 0)
                {
                    percentLike = ((float) likeEvaluation / totalEvaluation) * 100;
                    percentDislike = 100 - percentLike;
                }

                request.setAttribute("likeEvaluation", likeEvaluation);
                request.setAttribute("dislikeEvaluation", dislikeEvaluation);
                request.setAttribute("percentLike", percentLike);
                request.setAttribute("percentDislike", percentDislike);
                request.setAttribute("listEvaluationHistory", listEvaluationHistory);
                ServletUtils.forward("/views/vwAccount/ProfileOverview.jsp", request, response);
                break;
            }
            case "/ConfirmEmail": {
                String hash = request.getParameter("hash");
                int userID = -1;
                try {
                    userID = Integer.parseInt(request.getParameter("id"));
                } catch (Exception ex) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                EmailConfirm emailConfirm = EmailConfirmModel.check(userID, "confirm_email", "pending", hash);
                if(emailConfirm == null)
                {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                String jsonData = emailConfirm.getJson_data();
                JSONParser parser = new JSONParser();
                JSONObject json = null;
                try {
                    json = (JSONObject) parser.parse(jsonData);
                } catch (Exception ex) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                String newEmail = (String)json.get("email");
                if(ValidateUtils.isValidEmail(newEmail)){
                    EmailConfirmModel.updateStatus(emailConfirm.getId(), "success");
                    UserModel.updateStatus(userID, "active");
                    ServletUtils.updateUserSession(request, response);
                    request.setAttribute("URLRedirect", "/OnlineAutionHCMUTE/Account/Login");
                    request.setAttribute("title", "Th??ng b??o");
                    request.setAttribute("message", "Ch??c m???ng b???n ???? x??c nh???n email th??nh c??ng!");
                    ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
                    break;
                } else {
                    EmailConfirmModel.updateStatus(emailConfirm.getId(), "success");
                    request.setAttribute("URLRedirect", "/OnlineAutionHCMUTE/Account/Login");
                    request.setAttribute("title", "Th??ng b??o");
                    request.setAttribute("message", "?????a ch??? email n??y kh??ng h???p l???! Vui l??ng ki???m tra l???i");
                    ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
                }
                break;
            }
            case "/Profile/ConfirmChangeEmail":
            {
                String hash = request.getParameter("hash");
                int userID = -1;
                try {
                    userID = Integer.parseInt(request.getParameter("id"));
                } catch (Exception ex) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }

                EmailConfirm emailConfirm = EmailConfirmModel.check(userID, "change_email", "pending", hash);
                if(emailConfirm == null)
                {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                String jsonData = emailConfirm.getJson_data();
                JSONParser parser = new JSONParser();
                JSONObject json = null;
                try {
                    json = (JSONObject) parser.parse(jsonData);
                } catch (Exception ex) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                String newEmail = (String)json.get("email");
                if(ValidateUtils.isValidEmail(newEmail)){
                    EmailConfirmModel.updateStatus(emailConfirm.getId(), "success");
                    UserModel.updateEmail(emailConfirm.getUser_id(), newEmail);

                    ServletUtils.updateUserSession(request, response);
                    request.setAttribute("URLRedirect", "/OnlineAutionHCMUTE/Account/Profile/ChangeEmail");
                    request.setAttribute("title", "Th??ng b??o");
                    request.setAttribute("message", "Ch??c m???ng b???n ???? x??c nh???n email m???i th??nh c??ng!");
                    ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
                    break;
                } else {
                    EmailConfirmModel.updateStatus(emailConfirm.getId(), "success");
                    request.setAttribute("URLRedirect", "/OnlineAutionHCMUTE/Account/Profile/ChangeEmail");
                    request.setAttribute("title", "Th??ng b??o");
                    request.setAttribute("message", "?????a ch??? email n??y kh??ng h???p l???! Vui l??ng ki???m tra l???i");
                    ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
                }
                break;
            }
            case "/Profile/WatchList":
            {
                User userLogin = (User)session.getAttribute("authUser");
                List<WatchList> listWatchList = WatchListModel.findByUserID(userLogin.getId());
                List<ProductWithCard> listProductCard = new ArrayList<ProductWithCard>();

                listWatchList.forEach((wl) -> {
                    ProductWithCard pwc = ProductModel.getProductInfoWithCard(wl.getProduct_id());
                    if(pwc != null)
                        listProductCard.add(pwc);
                });

                request.setAttribute("listProductCard", listProductCard);
                ServletUtils.forward("/views/vwAccount/ProfileWatchList.jsp", request, response);
                break;
            }

            case "/Profile/ProductWin":
            {
                User userLogin = (User)session.getAttribute("authUser");
                List<Winner> listWinner = WinnerModel.findByUserID(userLogin.getId());
                List<ProductWithCard> listProductCard = new ArrayList<ProductWithCard>();

                listWinner.forEach((win) -> {
                    ProductWithCard pwc = ProductModel.getProductInfoWithCard(win.getProduct_id());
                    if(pwc != null)
                        listProductCard.add(pwc);
                });

                request.setAttribute("listProductCard", listProductCard);
                ServletUtils.forward("/views/vwAccount/ProfileProductWin.jsp", request, response);
                break;
            }

            case "/Profile/ProductAuction":
            {
                User userLogin = (User)session.getAttribute("authUser");
                List<Integer> listProductID = AuctionHistoryModel.getListProductIDByUserID(userLogin.getId());
                List<ProductWithCard> listProductCard = new ArrayList<ProductWithCard>();
                if(listProductID == null)
                {
                    request.setAttribute("listProductCard", listProductCard);
                    ServletUtils.forward("/views/vwAccount/ProfileProductAuction.jsp", request, response);
                    break;
                }
                else
                {
                    listProductID.forEach((productID)->{
                        ProductWithCard pwc = ProductModel.getProductInfoWithCard(productID);
                        if(pwc != null)
                            listProductCard.add(pwc);
                    });

                    request.setAttribute("listProductCard", listProductCard);
                    ServletUtils.forward("/views/vwAccount/ProfileProductAuction.jsp", request, response);
                    break;
                }
            }

            case "/Profile/Upgrade":
            {
                User userLogin = (User)session.getAttribute("authUser");
                if(userLogin.getUser_type_id() != 3) // Kh??ng ph???i bidder th?? out kh???i trang n??y
                {
                    ServletUtils.redirect("/Account/Profile/Overview", request, response);
                    break;
                }

                List<AccountUpgrade> listHistory = AccountUpgradeModel.findAllByUser(userLogin);
                request.setAttribute("listHistory", listHistory);
                ServletUtils.forward("/views/vwAccount/ProfileUpgrade.jsp", request, response);
                break;
            }
            case "/Profile/Upgrade/Apply":
            {
                User userLogin = (User)session.getAttribute("authUser");

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                boolean isAvailable = false;

                // Ki???m tra ??ang c?? ????n ch??? duy???t hay ch??a . Tr??nh spam
                AccountUpgrade accountUpgrade = AccountUpgradeModel.findByUserStatus(userLogin, "pending");
                if(accountUpgrade != null)
                {
                    out.print(isAvailable);
                    out.flush();
                    break;
                }

                AccountUpgradeModel.add(userLogin.getId(), "pending");
                isAvailable = true;
                out.print(isAvailable);
                out.flush();
                break;
            }

            case "/Profile/ChangePassword":
            {
                request.setAttribute("isError", false);
                request.setAttribute("errorMessage", "");
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
                break;
            }

            case "/Profile/ChangeEmail":
            {
                request.setAttribute("status", "");
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
                break;
            }

            case "/Profile/ChangeInformation":
            {
                request.setAttribute("message", "");
                ServletUtils.forward("/views/vwAccount/ProfileChangeInformation.jsp", request, response);
                break;
            }
//            End Profile

            case "/Register2":
            {
                ServletUtils.forward("/views/vwAccount/Register2.jsp", request, response);
                break;
            }

            case "/Login":
            {
                if ((boolean) session.getAttribute("auth")) {
                    ServletUtils.redirect("/Home", request, response);
                } else ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            }

            case "/ResetPassword":
            {
                String userID = request.getParameter("userID");
                String code = request.getParameter("code");

                if (userID == null || code == null)
                    ServletUtils.forward("/views/404.jsp", request, response);

                User userTemp = new User();
                userTemp.setId(Integer.parseInt(userID));

                AccountRecovery accountRecovery = AccountRecoveryModel.findCodeValid(userTemp, code);
                if (accountRecovery == null)
                    ServletUtils.forward("/views/404.jsp", request, response);

                request.setAttribute("userID", userID);
                request.setAttribute("code", code);
                ServletUtils.forward("/views/vwAccount/ResetPassword.jsp", request, response);
                break;
            }

            case "/Recovery":
            {
                request.setAttribute("isPost", false);
                request.setAttribute("isExist", false);
                request.setAttribute("emailPost", "");
                ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
                break;
            }

            case "/IsAvailable":
            {
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;
            }

            case "/EmailIsAvailable":
            {
                String email = request.getParameter("email");
                User emailOfUser = UserModel.findByEmail(email);
                boolean EmailisAvailable = (emailOfUser == null);

                PrintWriter out2 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out2.print(EmailisAvailable);
                out2.flush();
                break;
            }
            case "/Profile/User":
            {
                int userId =1;
                try {
                    userId = Integer.parseInt(request.getParameter("userid"));
                }
                catch (Exception ex){
                    ServletUtils.forward("/views/404.jsp", request, response);
                }
                List<Evaluation.HistoryEvaluation> listEvaluationHistory = EvaluationModel.findAllEvaluationHistoryByUserID(userId);

                int totalEvaluation = listEvaluationHistory.size();
                int likeEvaluation = 0;
                int dislikeEvaluation = 0;

                for(Evaluation.HistoryEvaluation history : listEvaluationHistory)
                {
                    if(history.getType().equals("like"))
                        likeEvaluation++;
                    else if(history.getType().equals("dislike"))
                        dislikeEvaluation++;
                }

                float percentLike = 0;
                float percentDislike = 0;
                if(totalEvaluation != 0)
                {
                    percentLike = ((float) likeEvaluation / totalEvaluation) * 100;
                    percentDislike = 100 - percentLike;
                }

                User user = UserModel.findById(userId);
                request.setAttribute("likeEvaluation", likeEvaluation);
                request.setAttribute("dislikeEvaluation", dislikeEvaluation);
                request.setAttribute("percentLike", percentLike);
                request.setAttribute("percentDislike", percentDislike);
                request.setAttribute("listEvaluationHistory", listEvaluationHistory);
                request.setAttribute("User",user);
                ServletUtils.forward("/views/vwAccount/ProfileUser.jsp", request, response);
                break;
            }
            default:
            {
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

            case "/Register2":
                registerUser(request, response);
                break;

            case "/Login":
                login(request, response);
                break;

            case "/Logout":
                logout(request, response);
                break;

            case "/Profile/Evaluation": {
                evaluation(request, response);
                break;
            }

            case "/Profile/ChangePassword":
                changePassword(request, response);
                break;

            case "/Profile/ChangeInformation":
                changeInformation(request, response);
                break;

            case "/Profile/ChangeEmail":
                changeEmail(request, response);
                break;

            case "/Recovery":
                recovery(request, response);
                break;

            case "/ResetPassword":
                resetPassword(request, response);
                break;
            case "/StoreAvatar":{
                HttpSession session = request.getSession();
                User userLogin = (User) session.getAttribute("authUser");
                for (Part part : request.getParts()) { //Nhan hinh anh tu browse v?? l??u v??o server
                    if (part.getName().equals("avatar")) {
                        String filename = "userAvatar.jpg";
                        String targetDir = this.getServletContext().getRealPath("public/img/Avatar" + "/" + userLogin.getId());
                        File dir = new File(targetDir);
                        if (!dir.exists()) {
                            dir.mkdir();
                        }
                        String destination = targetDir + "/" + filename;
                        part.write(destination);
                    }
                }
                ServletUtils.redirect("/Account/Profile/Overview",request,response);
                break;
            }
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void evaluation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String URLCurrent = request.getParameter("URLCurrent");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");

        int sellerID = Integer.parseInt(request.getParameter("seller-id"));
        int productID = Integer.parseInt(request.getParameter("product-id"));
        String type = request.getParameter("radio_type");
        String message = request.getParameter("message-text");

        // Ki???m tra xem ng?????i n??y c?? ph???i l?? ng?????i th???ng s???n ph???m kh??ng
        Winner winner = WinnerModel.findByUserIDAndProductID(user.getId(), productID);
        if(winner == null)
        {
            request.setAttribute("URLRedirect", URLCurrent);
            request.setAttribute("title", "Thong b??o");
            request.setAttribute("message", "B???n kh??ng ph???i l?? ng?????i th???ng s???n ph???m n??y!");
            ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
            return;
        }

        // Ki???m tra ???? ????nh gi?? tr?????c ???? ch??a
        Evaluation evaluation = EvaluationModel.findByAssessorAndProductID(user.getId(), productID);
        if(evaluation != null) // da ton tai
        {
            request.setAttribute("URLRedirect", URLCurrent);
            request.setAttribute("title", "Thong b??o");
            request.setAttribute("message", "B???n ???? ????nh gi?? s???n ph???m n??y tr?????c ????!");
            ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
            return;
        }

        evaluation = new Evaluation();
        evaluation.setAssessor(user.getId());
        evaluation.setUser_id(sellerID);
        evaluation.setProduct_id(productID);
        evaluation.setType(type);
        evaluation.setComment(message);
        EvaluationModel.add(evaluation);

        request.setAttribute("URLRedirect", URLCurrent);
        request.setAttribute("title", "Thong b??o");
        request.setAttribute("message", "B???n ???? ????nh gi?? th??nh c??ng!");
        ServletUtils.forward("/views/NotificationRedirect.jsp", request, response);
    }

    private void changeEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setAttribute("status", "");
        request.setAttribute("message", "");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        String newEmail = request.getParameter("email_new");
        String currentPassword = request.getParameter("password_current");

        BCrypt.Result result = BCrypt.verifyer().verify(currentPassword.toCharArray(), user.getPassword());
        if(!result.verified)
        {
            request.setAttribute("status", "error");
            request.setAttribute("message", "M???t kh???u c???a b???n kh??ng ????ng!");
            ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
        }
        else
        {
            if(ValidateUtils.isValidEmail(newEmail))
            {
                String emailHash = DigestUtils.sha256Hex(newEmail);
                JSONObject obj = new JSONObject();
                obj.put("email", newEmail);
                EmailConfirm emailConfirm = new EmailConfirm();
                emailConfirm.setUser_id(user.getId());
                emailConfirm.setPurpose("change_email");
                emailConfirm.setStatus("pending");
                emailConfirm.setJson_data(obj.toJSONString());
                emailConfirm.setHash(emailHash);

                EmailConfirmModel.add(emailConfirm);

                // G???i email x??c nh???n ?????n mail m???i
                Thread threadSendEmail = new Thread(()->{
                    try {
                        SendEmail.sendAsHtml(newEmail, "Please Confirm Your Email", EmailTemplate.TemplateConfirmNewEmail(emailConfirm,"http://localhost:8080/OnlineAutionHCMUTE/Account/Profile/ConfirmChangeEmail?id="));
                    } catch (Exception ex) {
                    }
                });
                threadSendEmail.start();

                request.setAttribute("status", "success");
                request.setAttribute("message", "Ch??ng t??i ???? g???i email x??c nh???n ?????n email " + newEmail);
            }
            else
            {
                request.setAttribute("status", "error");
                request.setAttribute("message", "C???p nh???t email th???t b???i. Email kh??ng h???p l???");
            }

            ServletUtils.updateUserSession(request, response);
            ServletUtils.forward("/views/vwAccount/ProfileChangeEmail.jsp", request, response);
        }
    }

    private void changeInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");

        String newLastname = request.getParameter("lastname");
        String newFirstname = request.getParameter("firstname");
        String newPhone = request.getParameter("phone");
        String newAddress = request.getParameter("address");
        String newBirthdate = request.getParameter("birthdate");
        System.out.println(newBirthdate);

        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            birthDateParsed = df.parse(newBirthdate);
        } catch (ParseException ex) {
            birthDateParsed = new Date();
        }

        user.setLastname(newLastname);
        user.setFirstname(newFirstname);
        user.setPhone(newPhone);
        user.setAddress(newAddress);
        user.setBirthdate(birthDateParsed);

        UserModel.updateInformation(user);

        request.setAttribute("message", "C???p nh???t th??ng tin c?? nh??n th??nh c??ng");
        ServletUtils.forward("/views/vwAccount/ProfileChangeInformation.jsp", request, response);
    }

    private void recovery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        User user = UserModel.findByEmail(email);
        if (user == null) {
            request.setAttribute("isExist", false);
        } else {
            request.setAttribute("isExist", true);

            // G???i mail reset password
            try {
                String code = Common.getRandomNumberString();
                AccountRecoveryModel.add(user, code);
                Thread threadSendEmail = new Thread(()->{
                    try {
                        SendEmail.sendAsHtml(email, "Reset Password Online Aution HCMUTE", EmailTemplate.TemplateRecoverAccount2(user, code));
                    } catch (Exception ex) {}
                });
                threadSendEmail.start();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }

        request.setAttribute("emailPost", email);
        request.setAttribute("isPost", true);
        ServletUtils.forward("/views/vwAccount/AccountRecovery.jsp", request, response);
    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String userID = request.getParameter("userID");
        String code = request.getParameter("code");

        if (userID == null || code == null)
            ServletUtils.forward("/views/404.jsp", request, response);

        User userTemp = new User();
        userTemp.setId(Integer.parseInt(userID));

        AccountRecovery accountRecovery = AccountRecoveryModel.findCodeValid(userTemp, code);
        if (accountRecovery == null)
            ServletUtils.forward("/views/404.jsp", request, response);

        String newPassword = request.getParameter("password1");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, newPassword.toCharArray());
        UserModel.updatePasswordByID(Integer.parseInt(userID), bcryptHashPassword);
        AccountRecoveryModel.updateStatusUsed(accountRecovery);
        ServletUtils.redirect("/Account/Login", request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setAttribute("isError", false);
        request.setAttribute("errorMessage", "");
        request.setAttribute("message", "");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("authUser");
        boolean isLogin = (boolean)session.getAttribute("auth");
        if(isLogin && user != null)
        {
            String passwordCurrent = request.getParameter("password_current");
            String passwordNew = request.getParameter("password_new");

            System.out.println(passwordCurrent);

            BCrypt.Result isPasswordCorrect = BCrypt.verifyer().verify(passwordCurrent.toCharArray(), user.getPassword().toCharArray());
            if(isPasswordCorrect.verified)
            {
                String newPasswordCrypt = BCrypt.withDefaults().hashToString(12, passwordNew.toCharArray());
                UserModel.updatePasswordByID(user.getId(), newPasswordCrypt);

                // G???i email th??ng b??o m???t kh???u ???? b??? thay ?????i
                Thread threadSendEmail = new Thread(()->{
                    try {
                        SendEmail.sendAsHtml(user.getEmail(), "Password Has Been Changed",EmailTemplate.TemplateChangePasswordNotification(user));
                    } catch (Exception ex) {}
                });
                threadSendEmail.start();

                request.setAttribute("message", "?????i m???t kh???u th??nh c??ng!");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
            }
            else // Sai m???t kh???u hi???n t???i
            {
                request.setAttribute("isError", true);
                request.setAttribute("errorMessage", "Sai m???t kh???u hi???n t???i");
                ServletUtils.forward("/views/vwAccount/ProfileChangePassword.jsp", request, response);
            }
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        // Verify CAPTCHA.
        boolean valid = VerifyUtils.verify(gRecaptchaResponse);
        if (!valid) {
            request.setAttribute("message", "You haven't  checked ReCaptcha yet!");
            ServletUtils.forward("/views/vwAccount/Register2.jsp", request, response);
            return;
        }
        String username = request.getParameter("username");
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthDate = request.getParameter("birthdate"); //Xu li birtdate ve Date
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int user_type_id = 3;
        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            birthDateParsed = df.parse(birthDate);
        } catch (ParseException ex) {
            birthDateParsed = new Date();
        }

        User c = new User(-1, username, bcryptHashPassword, firstname, lastname
                , birthDateParsed, address, email, phone, user_type_id);
        c.setStatus("inactive");
        UserModel.add(c);

        try {
            User newuser =  UserModel.findByEmail(c.getEmail());
            EmailConfirm emailConfirm = new EmailConfirm();
            emailConfirm.setUser_id(newuser.getId());
            emailConfirm.setStatus("pending");
            emailConfirm.setPurpose("confirm_email");
            String emailHash = DigestUtils.sha256Hex(c.getEmail());
            JSONObject obj = new JSONObject();
            obj.put("email", c.getEmail());
            emailConfirm.setHash(emailHash);
            emailConfirm.setJson_data(obj.toJSONString());
            EmailConfirmModel.add(emailConfirm);

            // G???i email x??c nh???n ????ng k??
            Thread threadSendEmail = new Thread(()->{
                try {
                    SendEmail.sendAsHtml(c.getEmail(),"Confirm email",EmailTemplate.TemplateConfirmNewEmail(emailConfirm,"http://localhost:8080/OnlineAutionHCMUTE/Account/ConfirmEmail?id="));
                } catch (Exception ex) {}
            });
            threadSendEmail.start();
        }
        catch (Exception ex ){

        }
        ServletUtils.redirect("/Account/Login",request,response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserModel.findByUsername(username);
        if (user != null) {
            try {
                if(user.getStatus().contains("inactive")){
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "You haven't confirmed email yet!.");
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                    return;
                }
            } catch (Exception ex){

            }
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));

                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/Home";

                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/Home";
        ServletUtils.redirect(url, request, response);
    }

//    public static  void abc ()
//    {
//        ProductType productType = new ProductType(1, "", 2);
//    }
}
