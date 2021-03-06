<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 12/22/2021
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="productAuctionRequest" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.AuctionPermission>"/>
<jsp:useBean id="users" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<jsp:useBean id="product" scope="request"
             type="com.ute.onlineautionhcmute.beans.Product"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Danh sách Bidder yêu cầu đấu giá sản phẩm
                ${product.name}
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">${productAuctionRequest.size()} yêu cầu</h4>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Username</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Ngày gửi yêu cầu</th>
                                <th scope="col">Chấp nhận</th>
                                <th scope="col">Từ chối</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productAuctionRequest}" var="c">
                                <tr>
                                    <c:forEach items="${users}" var="t">
                                        <c:choose>
                                            <c:when test="${t.id == c.user_id}">
                                                <td>${t.username}</td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <td>${c.status}</td>
                                    <td>${c.create_time}</td>
                                    <td>
                                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}//Seller/Product/AcceptRequest?ProductId=${c.product_id}&UserId=${c.user_id}" role="button">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}//Seller/Product/DenyRequest?ProductId=${c.product_id}&UserId=${c.user_id}" role="button">
                                            <i class="fa fa-user-times" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
            </div>
            <div class="card-footer">
                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/All"
                   role="button">
                    <i class="fa fa-backward" aria-hidden="true"></i>
                    Back
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>
