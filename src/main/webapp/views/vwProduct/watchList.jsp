<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<%--<jsp:useBean id="category" scope="request" type="com.example.day10_javawebdemo3.beans.Category"></jsp:useBean>--%>
<jsp:useBean id="products" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Product>"/>
<jsp:useBean id="sellerList" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                <i class="fa fa-heart" aria-hidden="true"></i>
                My watch list
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">Các sản phẩm bạn đã yêu thích</h4>
                        <c:choose>
                            <c:when test="${products.size() == 0}">
                                <div class="card-body">
                                    <p class="card-text">Khong co du lieu</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="card-body">
                                    <div class="row">
                                        <c:forEach items="${products}" var="c">
                                            <div class="col-sm-4 mb-3">
                                                <div class="card h-100">
                                                    <img class="card-img-top" src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg" alt="${c.name}" title="${c.name}">
                                                    <div class="card-body">
                                                        <h4 class="card-title text-success">${c.name}</h4>
                                                        <h5 class="card-title text-danger">
                                                            Giá hiện tại:
                                                            <fmt:formatNumber value="${c.price_current}" type="number"/>
                                                        </h5>


                                                        <c:forEach items="${sellerList}" var="s">
                                                            <c:choose>
                                                                <c:when test="${s.id == c.user_id}">
                                                                    <p class="card-text">Người bán: ${s.username} #${s.id}</p>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <p class="card-text">Giá mua ngay:
                                                            <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                                        </p>
                                                        <p class="card-text">Ngày đăng: ${c.create_time}</p>
                                                    </div>
                                                    <div class="card-footer text-muted">
                                                        <a  href="${pageContext.request.contextPath}/Product/Detail?id=${c.id}" class="btn btn-outline-primary" role="button">
                                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                                            Details
                                                        </a>
                                                        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/Product/RemoveFromWatchList?id=${c.id}" role="button">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                            Xóa khỏi watch list
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
            </div>
        </div>
    </jsp:body>
</t:main>
