<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">
    </jsp:attribute>
    <jsp:attribute name="js">
<%--        Sử dụng date time picker cho ô birthdate --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

        $('#txtdob').datetimepicker({
                format: 'd/m/Y',
                timepicker:false,
                mask:true
        });

    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmRegister">
            <div class="card">
                <h4 class="card-header">
                    Create new Account
                </h4>
                <div class="card-body">
                    <h5>Thông tin tài khoản</h5>
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control" id="txtUsername" name="name" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input type="password" class="form-control" id="txtPassword" name="rawpwd">
                    </div>
                    <h5>Thông tin cá nhân</h5>
                    <div class="form-group">
                        <label for="txtFirstName">First name</label>
                        <input type="text" class="form-control" id="txtFirstName" name="firstname">
                    </div>
                    <div class="form-group">
                        <label for="txtLastName">Last name</label>
                        <input type="text" class="form-control" id="txtLastName" name="lastname">
                    </div>
                    <div class="form-group">
                        <label for="txtdob">Birthdate</label>
                        <input type="text" class="form-control" id="txtdob" name="birthdate">
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <input type="text" class="form-control" id="txtAddress" name="address">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <input type="text" class="form-control" id="txtEmail" name="email">
                    </div>
                    <div class="form-group">
                        <label for="txtPhone">Phone</label>
                        <input type="text" class="form-control" id="txtPhone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="txtUserType">User type id</label>
                        <input type="text" class="form-control" id="txtUserType" name="user_type_id">
                    </div>
                    <div class="form-group">
                        <label for="txtAvatar">Avatar</label>
                        <input type="text" class="form-control" id="txtAvatar" name="avatar" readonly value="user.png">
                    </div>
<%--                    <div class="input-group mb-3">--%>
<%--                        <div class="input-group-prepend">--%>
<%--                            <label class="input-group-text" for="inputGroupSelect01">Loại user</label>--%>
<%--                        </div>--%>
<%--                        <select class="custom-select" id="inputGroupSelect01" name="">--%>
<%--                            <option value="aa">Bidder</option>--%>
<%--                            <option value="aa">Seller</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Account/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-success">
                        Tạo tài khoản <i class="fa fa-check" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>