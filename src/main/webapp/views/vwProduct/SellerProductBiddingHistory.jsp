<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request"
             type="com.ute.onlineautionhcmute.beans.Product"/>
<jsp:useBean id="productHistory" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.ProductHistory>"/>
<jsp:useBean id="allUser" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Lịch sử đấu giá của sản phẩm ${product.name}

            </h4>
            <div class="card-body">
                <h4 class="card-title">Số lượt đấu giá: ${productHistory.size()} lượt</h4>
                <c:choose>
                    <c:when test="${productHistory.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Chưa có lượt đấu giá nào</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <%--                đổ data vào đây--%>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Thời điểm</th>
                                <th scope="col">Người đặt</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Xem thông tin</th>
                                <th scope="col">Cấm đấu giá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productHistory}" var="c" varStatus="loop">
                                <form id="frmHistoryDelete" method="post"
<%--                                      form post id sản phẩm và id user đặt cao nhất để xử lí delete--%>
                                      action="${pageContext.request.contextPath}/Seller/Product/History/Delete">
                                    <c:if test="${loop.index == 0}">
                                        <input class="d-none" type="text" readonly name="productID" value="${c.product_id}">
                                        <input class="d-none" type="text" readonly name="userHighestBiddingID" value="${c.user_id_holding}">
                                    </c:if>
                                </form>
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>
                                        ${c.create_time}
                                    </td>
                                    <c:forEach items="${allUser}" var="u">
                                        <c:choose>
                                            <c:when test="${u.id == c.user_id_holding}">
                                                <td>
                                                        ${u.username}
                                                </td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <td>
                                        <fmt:formatNumber value="${c.price_bidding}" type="number"/>
                                    </td>
                                    <td>
                                        <a  class="btn btn-primary" href="${pageContext.request.contextPath}/Account/Profile/User?userid=${c.user_id_holding}" role="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </a>
                                    </td>
<%--                                    Hiển thị nút xóa người đặt cao nhất trong bảng--%>
                                    <c:if test="${loop.index == 0}">
                                        <td>
                                            <a class="btn btn-outline-danger" href="javascript: $('#frmHistoryDelete').submit()" role="button">
                                                <i class="fa fa-user-times" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
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
