<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/17/2021
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Lay Du Lieu Tu Controller--%>
<jsp:useBean id="listProductCard" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.ProductWithCard>" />

<t:profile>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Sản Phẩm Chiến Thắng
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">Các sản phẩm bạn đã chiến thắng</h4>

                <c:choose>
                    <c:when test="${listProductCard.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu</p>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${listProductCard}" var="c">
                                    <div class="col-sm-4 mb-3">
                                        <div class="card h-100">
                                            <img class="card-img-top" src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg" alt="${c.name}" title="${c.name}">
                                            <div class="card-body">
                                                <h4 class="card-title text-success">${c.name}</h4>
                                                <h5 class="card-title text-danger">
                                                    Giá hiện tại:
                                                    <fmt:formatNumber value="${c.price_current}" type="number"/>
                                                </h5>

                                                <p class="card-text">Người bán: ${c.firstname} ${c.lastname}</p>
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
</t:profile>
