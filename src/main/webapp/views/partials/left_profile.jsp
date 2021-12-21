<%@ page import="com.ute.onlineautionhcmute.beans.ProductType" %>
<%--
  Created by IntelliJ IDEA.
  User: TomPC
  Date: 11/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User"/>

<div class="card mt-3">
    <h4 class="card-header">
        Thông tin cơ bản
    </h4>
    <div class="list-group list-group-flush">
<%--        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">--%>
<%--            The current link item (edited)--%>
<%--        </a>--%>
        <a href="${pageContext.request.contextPath}/Account/Profile/Overview" class="list-group-item list-group-item-action">Tổng quan thông tin</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/ChangeInformation" class="list-group-item list-group-item-action">Đổi thông tin cá nhân</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/ChangeEmail" class="list-group-item list-group-item-action">Đổi Email</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/ChangePassword" class="list-group-item list-group-item-action">Đổi mật khẩu mới</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/WatchList" class="list-group-item list-group-item-action">Danh sách sản phẩm yêu thích</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/ProductAuction" class="list-group-item list-group-item-action">Sản phẩm đang đấu giá</a>
        <a href="${pageContext.request.contextPath}/Account/Profile/ProductWin" class="list-group-item list-group-item-action">Sản phẩm đã thắng</a>
    <c:if test="${authUser.user_type_id == 3}">
        <a href="${pageContext.request.contextPath}/Account/Profile/Upgrade" class="list-group-item list-group-item-action">Xin lên Seller</a>
    </c:if>
    </div>
</div>

<c:if test="${authUser.user_type_id == 2}">
    <div class="card mt-3">
        <h4 class="card-header bg-dark text-light">
            <i class="fa fa-balance-scale" aria-hidden="true"></i>
            Seller
        </h4>
        <div class="list-group">
                <%--            Dashboard--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/Dashboard" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-dashboard" aria-hidden="true"></i>
                Dashboard
            </a>
                <%--        Đăng--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/Add" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-plus" aria-hidden="true"></i>
                Đăng đấu giá sản phẩm
            </a>
                <%--      Xem tất cả sp seller--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/All" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-product-hunt" aria-hidden="true"></i>
                Sản phẩm đã đăng
            </a>
        </div>
    </div>
</c:if>