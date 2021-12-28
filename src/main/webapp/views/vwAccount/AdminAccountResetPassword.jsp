<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/28/2021
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="user" scope="request"
             type="com.ute.onlineautionhcmute.beans.User"/>

<t:main>
    <jsp:attribute name="js">
        <script>
            function randomString(length) {
                var result           = '';
                var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                var charactersLength = characters.length;
                for ( var i = 0; i < length; i++ ) {
                    result += characters.charAt(Math.floor(Math.random() *
                        charactersLength));
                }
                return result;
            }

            function randomPassword(){
                document.getElementById('password_new').value = randomString(15);
            }
            document.getElementById('password_new').value = randomString(15);
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                Reset mật khẩu của ${user.firstname} ${user.lastname}
            </h4>
            <div class="card-body">
                <div class="form-group">
                    <label for="txtUsername">Username</label>
                    <input type="text" class="form-control" id="txtUsername" name="username" value="${user.username}" readonly>
                </div>
                <h5>
                    Thông tin cá nhân
                </h5>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <input type="text" class="form-control" id="txtEmail" value="${user.email}" name="email" readonly>
                </div>
                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <input type="text" class="form-control" id="txtPhone" value="${user.phone}" name="phone" readonly>
                </div>
                <h5>
                    Mật khẩu
                </h5>
                <form method="post" action="${pageContext.request.contextPath}/Admin/Account/ResetPassword">
                    <div class="form-group">
                        <label for="password_new">Mật khẩu mới</label>
                        <input type="text" class="form-control" id="password_new" value="" name="password_new">
                        <input type="text" class="d-none" value="${user.id}" name="userID">
                        <input type="text" class="d-none" value="${user.email}" name="email_send" readonly>
                        <button type="button" onclick="randomPassword()" class="mt-2 btn btn-outline-primary">Random Password</button>
                    </div>
                    <div class="form-group mt-5">
                        <button type="submit" class="btn btn-primary">Reset Password</button>
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Account/"
                   role="button">
                    <i class="fa fa-backward" aria-hidden="true"></i>
                    Back
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>
