package com.ute.onlineautionhcmute.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineautionhcmute.beans.*;
import com.ute.onlineautionhcmute.models.*;
import com.ute.onlineautionhcmute.utils.EmailTemplate;
import com.ute.onlineautionhcmute.utils.SendEmail;
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
import java.util.Locale;

@WebServlet(name = "AccountManageServlet", value = "/Admin/Account/*")
public class AdminAccountManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Manage";
        }

        switch (path) {
            case "/ManageSeller":{
                List<User> listUserSeller = UserModel.findAllByUserTypeID(2); // ID 2 la seller
                request.setAttribute("listUserSeller", listUserSeller);
                ServletUtils.forward("/views/vwAccount/ManageSeller.jsp", request, response);
                break;
            }
            case "/ManageSeller/CheckProduct":{ // API kiểm tra xem người bán có những sản phẩm nào còn hạn , xem xét trước khi hạ cấp
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                JSONObject jsonObject = new JSONObject();

                int sellerID = -1;
                try{
                    sellerID = Integer.parseInt(request.getParameter("sellerID"));
                } catch (NumberFormatException ex) {
                    jsonObject.put("status", "error");
                    jsonObject.put("data", new JSONArray());
                    out.print(jsonObject.toJSONString());
                    break;
                }

                List<Product> listProductExpried = ProductModel.findProductPostExpired(sellerID);
                if(listProductExpried.size() == 0)
                {
                    jsonObject.put("status", "success");
                    jsonObject.put("data", new JSONArray());
                    out.print(jsonObject.toJSONString());
                    break;
                }
                jsonObject.put("status", "error");
                JSONArray jsonArray = new JSONArray();
                for(Product product : listProductExpried)
                {
                    JSONObject productJson = new JSONObject();
                    productJson.put("name", product.getName());
                    jsonArray.add(productJson);
                }
                jsonObject.put("data", jsonArray);
                out.print(jsonObject.toJSONString());

                break;
            }

            case "/ManageSeller/DownGrade": {
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                JSONObject jsonObject = new JSONObject();

                int sellerID = -1;
                try{
                    sellerID = Integer.parseInt(request.getParameter("sellerID"));
                } catch (NumberFormatException ex) {
                    jsonObject.put("status", "error");
                    out.print(jsonObject.toJSONString());
                    break;
                }
                User userSeller = new User();
                userSeller.setId(sellerID);
                UserModel.updateUserTypeID(userSeller,3);
                jsonObject.put("status", "success");
                out.print(jsonObject.toJSONString());
                break;
            }

            case "/Manage": {
                List<User> list = UserModel.findAll();          //Cach day viewModel ra view su dung set attribute
                request.setAttribute("listUser", list);
                List<UserType> userType = UserTypeModel.findAll();        //dua list user type ra cho select su dung
                request.setAttribute("userType", userType);
                ServletUtils.forward("/views/vwAccount/AccountManager.jsp", request, response);
                break;
            }
            case "/Add": {
                List<UserType> list = UserTypeModel.findAll();        //dua list user type ra cho select su dung
                request.setAttribute("listUserType", list);
                ServletUtils.forward("/views/vwAccount/Add.jsp", request, response);
                break;
            }
//            servlet sort user
            case "/Find": { //Nhan vao perrmission id để sort, nếu truyền 0 xuất tất cả
                int permissionID = 0;
                try {
                    permissionID = Integer.parseInt(request.getParameter("permissionID"));
                } catch (NumberFormatException e) {
                }
//                Tìm theo permissionID
                if(permissionID <= 3 && permissionID >= 1){                                 //ID perrmission từ 1 đến 3 xuất list đã tìm đc từ model
                    List<User> listUserFinded = UserModel.findByPermissionID(permissionID);// list user da tim dc tu perrmission id
                    request.setAttribute("listUser", listUserFinded);
                    List<UserType> userType = UserTypeModel.findAll();                    //dua list user type ra cho select su dung
                    request.setAttribute("userType", userType);
                    ServletUtils.forward("/views/vwAccount/AccountManager.jsp", request, response);
                }else if(permissionID == 0){                                            //id per = 0: ng dùng chọn Tất cả hoặc tự chỉnh trên url
                    ServletUtils.redirect("/Admin/Account/Manage", request, response);
                } else {                                                               //Các TH khác ng dùng chỉnh trên url parram
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            case "/Profile": {
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                    break;
                }
                User c = UserModel.findById(id);
                if (c != null) {
                    User userFinded = UserModel.findById(id);
                    request.setAttribute("user", userFinded);
                    ServletUtils.forward("/views/vwAccount/AccountProfileReadOnly.jsp", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }

            case "/ResetPassword":{
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.forward("/views/204.jsp", request, response);
                    break;
                }
                User c = UserModel.findById(id);
                if (c != null) {
                    User userFinded = UserModel.findById(id);
                    request.setAttribute("user", userFinded);
                    ServletUtils.forward("/views/vwAccount/AdminAccountResetPassword.jsp", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }

            case "/Upgrade": {
                List<AccountUpgrade.UpgradeApply> listAccountApplyUpgrade = AccountUpgradeModel.getListUpgradeApplyByStatus("pending");
                request.setAttribute("listAccountApplyUpgrade", listAccountApplyUpgrade);
                ServletUtils.forward("/views/vwAccount/AccountUpgrade.jsp", request, response);
                break;
            }
            case "/Upgrade/Action": {
                int applyID = Integer.parseInt(request.getParameter("id"));
                AccountUpgrade accountUpgrade = AccountUpgradeModel.findByID(applyID);
                if(accountUpgrade == null)
                {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }
                String action = request.getParameter("action");
                if(action.equals("accept"))
                {
                    accountUpgrade.setStatus("success");
                    AccountUpgradeModel.update(accountUpgrade);
                    User user = new User();
                    user.setId(accountUpgrade.getUser_id());
                    UserModel.updateUserTypeID(user, 2);
                }
                else if(action.equals("reject"))
                {
                    accountUpgrade.setStatus("fail");
                    AccountUpgradeModel.update(accountUpgrade);
                }
                else
                {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    break;
                }

                ServletUtils.redirect("/Admin/Account/Upgrade", request, response);
                break;
            }
            case "/Delete": { //Nhan vao id user can xoa
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                User c = UserModel.findById(id);
                if (c != null) {
                    UserModel.delete(id);
                    ServletUtils.redirect("/Admin/Account/Manage", request, response);
                } else {
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            }
            case "/IsAvailable": { //Kiem tra username tồn tại không
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null); //Co username ton tai false, khong co username ton tai true
//                boolean isAvailable = true;
//                if (user != null){
//                    isAvailable = false;
//                }
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
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
                addUser(request, response);
                break;
            }
            case "/ResetPassword":
            {
                resetPassword(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
            }
        }
    }

    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int userID = -1;
        try
        {
            userID = Integer.parseInt(request.getParameter("userID"));
        } catch (Exception ex)
        {
            ServletUtils.forward("/views/404.jsp", request, response);
        }
        String newPassword = request.getParameter("password_new");
        String emailSent = request.getParameter("email_send");
        String passwordHash = BCrypt.withDefaults().hashToString(12, newPassword.toCharArray());
        UserModel.updatePasswordByID(userID, passwordHash);
        Thread threadSendEmail = new Thread(()->{
            try
            {
                String title = "Your password has been changed";
                String mainContent = "Admin reset your password. Password is: <h1><b>" + newPassword + "</b></h1>";
                SendEmail.sendAsHtml(emailSent, title, EmailTemplate.TemplateNotification("Password has been changed", mainContent));
            }
            catch (Exception ex) {}
        });
        threadSendEmail.start();

        ServletUtils.redirect("/Admin/Account/Manage", request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashPassword = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthDate = request.getParameter("birthdate"); //Xu li birtdate ve Date
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int user_type_id = Integer.parseInt(request.getParameter("user_type_id"));
        Date birthDateParsed;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthDateParsed = df.parse(birthDate);
        } catch (ParseException ex) {
            birthDateParsed = new Date();
        }

        User c = new User(-1, username, bcryptHashPassword, firstname, lastname
                , birthDateParsed, address, email, phone, user_type_id);
        UserModel.add(c);
        ServletUtils.redirect("/Admin/Account/Manage", request, response);

    }
}
