<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User"/>

<div class="fixed-top">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Home/Index">
            <i class="fa fa-home" aria-hidden="true"></i>
            Home
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Home/About">About</a>
                </li>
            </ul>
            <div class=" my-2 my-lg-0">
                <div class="d-flex justify-content-between">
<%--                    <button type="button" class="btn btn-outline-warning mr-3" data-toggle="modal"--%>
<%--                            data-target="#exampleModalCenter">--%>
<%--                        <i class="fa fa-bell" aria-hidden="true"></i>--%>
<%--                        Notifications--%>
<%--                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">--%>
<%--                    99+--%>
<%--                    </span>--%>
<%--                    </button>--%>
                    <ul class="navbar-nav">
                        <c:choose>
                        <c:when test="${auth}">
                        <a class="btn btn-outline-danger mr-3"
                           href="${pageContext.request.contextPath}/Product/MyWatchList"
                           role="button">
                            <i class="fa fa-heart" aria-hidden="true"></i>
                            My watch list
                        </a>
                        <form id="frmLogout" method="post"
                              action="${pageContext.request.contextPath}/Account/Logout"></form>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${pageContext.request.contextPath}/public/img/Avatar/${authUser.id}/userAvatar.jpg" onerror="this.src='${pageContext.request.contextPath}/public/img/Avatar/user.jpg'" alt="userImg" class="rounded-circle" width="23" height="23">
                                Hi, <b>${authUser.username}!</b>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/Account/Profile/Overview">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    Sign Out
                                </a>
                            </div>
                        </li>
                        </c:when>
                        <c:otherwise>
                        <a class="btn btn-outline-success mr-3" href="${pageContext.request.contextPath}/Account/Login"
                           role="button">
                            <i class="fa fa-sign-in" aria-hidden="true"></i>
                            ????ng nh???p
                        </a>
                        <a class="btn btn-outline-warning mr-3"
                           href="${pageContext.request.contextPath}/Account/Register2"
                           role="button">
                            <i class="fa fa-registered" aria-hidden="true"></i>
                            ????ng k??
                        </a>
                        </c:otherwise>
                        </c:choose>
                        <ul/>
                </div>
            </div>
        </div>
    </nav>

</div>
<!-- Modal Notification-->
<%--<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"--%>
<%--     aria-labelledby="exampleModalCenterTitle"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLongTitle">--%>
<%--                    <i class="fa fa-bell" aria-hidden="true"></i>--%>
<%--                    Notification--%>
<%--                </h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                Hien thi thong bao khi mon hang da dau gia thanh cong--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>