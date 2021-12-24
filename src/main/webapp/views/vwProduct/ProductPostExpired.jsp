<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="products" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Product>"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Sản phẩm đang đăng và còn hạn
            </h4>
            <div class="card-body">
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
                                            <img style="height: 222px" class="card-img-top" src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg" alt="${c.name}" title="${c.name}">
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
                                                <p class="card-text">Thời hạn : ${c.end_time} </p>
                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Seller/Product/RequestList?id=${c.id}" role="button">
                                                    <i class="fa fa-align-justify" aria-hidden="true"></i>
                                                    Danh sách yêu cầu đấu giá sản phẩm
                                                </a>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/Edit?id=${c.id}" role="button">
                                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    Bổ sung thông tin
                                                </a>
                                                <!-- Button mở modal lịch sử đấu-->
                                                <a role="button" class="btn btn-success" href="${pageContext.request.contextPath}/Seller/Product/History?id=${c.id}">
                                                    Lịch sử đấu giá
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
