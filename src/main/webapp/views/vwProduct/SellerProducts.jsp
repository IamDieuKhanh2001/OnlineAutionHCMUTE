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
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/SellerLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                <i class="fa fa-heart" aria-hidden="true"></i>
                Sản phẩm đã đăng
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
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
                                                <p class="card-text">Giá mua ngay:
                                                    <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                                </p>
                                                <p class="card-text">Ngày đăng: ${c.create_time}</p>
                                                <p class="card-text">Lần cuối chỉnh sửa: ${c.modified_time}</p>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <a class="btn btn-outline-primary" href="#" role="button">
                                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    Chỉnh sửa
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
