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

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="listUserType" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.UserType>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
<%--        Sử dụng date time picker cho ô birthdate --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
        <script src="../../public/js/ValidateUtils.js"></script>
    <script>
        //Kiem tra form validation
        $('#frmAddAccount').on('submit', function (e){
            e.preventDefault();
            const username = $('#txtUsername').val();
            if(username.length === 0){
                bootbox.alert({
                    message: 'Invalid username',
                    size: 'large'
                });
                return;
            }
            const rawpwd = $('#txtPassword').val();
            if(rawpwd.length === 0){
                bootbox.alert({
                    message: 'Invalid Password',
                    size: 'large'
                });
                return;
            }
            const firstname = $('#txtFirstName').val();
            if(firstname.length === 0){
                bootbox.alert({
                    message: 'Invalid first name',
                    size: 'large'
                });
                return;
            }
            const lastname = $('#txtLastName').val();
            if(lastname.length === 0){
                bootbox.alert({
                    message: 'Invalid last name',
                    size: 'large'
                });
                return;
            }
            const birthdate = $('#txtDOB').val();
            if(birthdate.length === 0){
                bootbox.alert({
                    message: 'Invalid birthdate',
                    size: 'large'
                });
                return;
            }
            const address = $('#txtAddress').val();
            if(address.length === 0){
                bootbox.alert({
                    message: 'Invalid address',
                    size: 'large'
                });
                return;
            }
            const email = $('#txtEmail').val();
            if(email.length === 0 || !isEmail(email)){
                bootbox.alert({
                    message: 'Invalid email',
                    size: 'large'
                });
                return;
            }
            const phone = $('#txtPhone').val();
            if(phone.length === 0){
                bootbox.alert({
                    message: 'Invalid phone number',
                    size: 'large'
                });
                return;
            }
            //Kiem tra tai khoan username tồn tại không
            $.getJSON('${pageContext.request.contextPath}/Admin/Account/IsAvailable?user=' + username,function (data){
                if(data === true){//Tai khoan khong ton tai trong db, post
                    $('#frmAddAccount').off('submit').submit();
                }else{
                    bootbox.alert({
                        message: 'Username has been used!!!',
                        size: 'large'
                    });
                }
            })
        });
        // cai dat query date time picker
        $('#txtDOB').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });
    </script>

    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmAddAccount">
            <div class="card">
                <h4 class="card-header">
                    Create new Account
                </h4>
                <div class="card-body">
                    <h5>Thông tin tài khoản</h5>
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control" id="txtUsername" name="username" autofocus>
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
                        <label for="txtDOB">Birthdate</label>
                        <input type="text" class="form-control" id="txtDOB" name="birthdate">
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
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Loại user</label>
                        </div>
                        <select class="custom-select" id="inputGroupSelect01" name="user_type_id">
                            <c:forEach items="${listUserType}" var="c">
                                <option value="${c.id}">User ID: ${c.id} - ${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="txtAvatar">Avatar</label>--%>
<%--                        <input type="text" class="form-control" id="txtAvatar" name="avatar" readonly value="user.png">--%>
<%--                    </div>--%>

                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Account/"
                       role="button">
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