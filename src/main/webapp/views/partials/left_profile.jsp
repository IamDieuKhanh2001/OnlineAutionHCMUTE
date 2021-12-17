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

<div class="card mt-3">
    <h4 class="card-header">
        Featured

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
        <a href="${pageContext.request.contextPath}/Account/Profile/Upgrade" class="list-group-item list-group-item-action">Xin lên Seller</a>

    </div>
</div>

