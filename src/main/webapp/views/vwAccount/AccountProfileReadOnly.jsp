<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="user" scope="request"
             type="com.ute.onlineautionhcmute.beans.User"/>

<%--View này Admin có quyền vào | view có form chứa user info chỉ đọc và không thể sửa--%>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>

    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                Thông tin của ${user.firstname} ${user.lastname}
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
                    <label for="txtFirstName">First name</label>
                    <input type="text" class="form-control" id="txtFirstName" value="${user.firstname}" name="firstname" readonly>
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last name</label>
                    <input type="text" class="form-control" id="txtLastName" value="${user.lastname}" name="lastname" readonly>
                </div>
                <div class="form-group">
                    <label for="txtDOB">Birthdate</label>
                    <input type="text" class="form-control" id="txtDOB" value="${user.birthdate}" name="birthdate" readonly>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <input type="text" class="form-control" id="txtAddress" value="${user.address}" name="address" readonly>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <input type="text" class="form-control" id="txtEmail" value="${user.email}" name="email" readonly>
                </div>
                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <input type="text" class="form-control" id="txtPhone" value="${user.phone}" name="phone" readonly>
                </div>
                <div class="form-group">
                    <label for="txtUserTypeId">Loại user</label>
                    <input type="text" class="form-control" id="txtUserTypeId" value="${user.user_type_id}" name="user_type_id" readonly>
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
            </div>
        </div>


    </jsp:body>
</t:main>
