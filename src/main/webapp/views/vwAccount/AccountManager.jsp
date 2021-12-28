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
<jsp:useBean id="userType" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.UserType>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between bg-dark text-light">
                Người dùng
                <a class="btn btn-success" href="${pageContext.request.contextPath}/Admin/Account/Add" role="button">
                    Add account
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
            <div class="card-body">
                <h4 class="card-title">Danh sách các tài khoản</h4>
                    <%--    search --%>
                <div class="sort d-flex justify-content-between mb-3">
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle mr-2" type="button" id="permission"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-filter" aria-hidden="true"></i>
                            Lọc theo quyền hạn
                        </button>
                        <div class="dropdown-menu" aria-labelledby="permission">
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/Admin/Account/Find?permissionID=${0}">Tất cả</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/Admin/Account/Find?permissionID=${userType.get(2).id}">Bidder</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/Admin/Account/Find?permissionID=${userType.get(1).id}">Seller</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/Admin/Account/Find?permissionID=${userType.get(0).id}">Administrator</a>
                        </div>
                    </div>
                </div>
                    <%--              end  search--%>
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
                                <th>Loại người dùng</th>
                                <th>Email</th>
                                <th>Reset mật khẩu</th>
                                <th>Xem thông tin</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                                <%--Data usser--%>
                            <tbody>
                            <c:forEach items="${listUser}" var="c">
                                <tr>
                                    <td>${c.firstname} ${c.lastname}</td>
                                    <td>${c.username}</td>
                                        <%--Tim va Hien thi ten quyen cua user--%>
                                    <c:forEach items="${userType}" var="t">
                                        <c:choose>
                                            <c:when test="${t.id == c.user_type_id}">
                                                <td>
                                                        ${t.name}
                                                </td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <td>${c.email}</td>
                                    <td>
                                        <a class="btn btn-primary"
                                           href="${pageContext.request.contextPath}/Admin/Account/ResetPassword?id=${c.id}"
                                           role="button">
                                            <i class="fa fa-retweet" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-secondary"
                                           href="${pageContext.request.contextPath}/Admin/Account/Profile?id=${c.id}"
                                           role="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-danger"
                                           href="${pageContext.request.contextPath}/Admin/Account/Delete?id=${c.id}"
                                           role="button">
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
