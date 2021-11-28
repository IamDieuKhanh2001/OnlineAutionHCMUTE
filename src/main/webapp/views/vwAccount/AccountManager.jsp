<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/27/2021
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="listUser" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between bg-dark text-light">
                Account manager
                <a class="btn btn-success" href="${pageContext.request.contextPath}/Admin/Account/Add" role="button">
                    Add account
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
            <div class="card-body">
                <h4 class="card-title">Danh sách các tài khoản</h4>
                    <%--                đổ data vào đây--%>
                <c:choose>
                    <c:when test="${listUser.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Khong co du lieu</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên người dùng</th>
                                <th>Tên đăng nhập</th>
                                <th >Loại người dùng</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                                <%--                            Data usser--%>
                            <tbody>
                            <c:forEach items="${listUser}" var="c">
                            <tr>
                                <td>${c.firstname} ${c.lastname}</td>
                                <td>${c.username}</td>
                                <td>${c.user_type_id}</td>
                                <td>
                                    <a class="btn btn-outline-primary" href="#" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger" href="#" role="button">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </jsp:body>
</t:main>
