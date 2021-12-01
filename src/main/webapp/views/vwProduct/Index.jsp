<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="products" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Product>"/>
<jsp:useBean id="userList" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Product (Admin)
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
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th class="text-left">Price buy now</th>
                                    <th class="text-right">Price start</th>
                                    <th class="text-right">Price current</th>
                                    <th class="text-right">Seller</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${products}" var="c">
                                    <tr>
                                        <td>${c.name}</td>
                                        <td class="text-left">
                                            <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                        </td>
                                        <td class="text-right">
                                            <fmt:formatNumber value="${c.price_start}" type="number"/>
                                        </td>
                                        <td class="text-right">
                                            <fmt:formatNumber value="${c.price_current}" type="number"/>
                                        </td>
<%--                                        hien thi ten user name len cot Seller--%>
                                            <c:forEach items="${userList}" var="u">
                                                <c:choose>
                                                    <c:when test="${u.id == c.user_id}">
                                                        <td class="text-right">
                                                                ${u.username}
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
<%--                                                ${c.user_id}--%>
                                        <td class="text-right">
                                            <a class="btn btn-danger"
                                               Delete
                                               href="${pageContext.request.contextPath}/Admin/Product/Delete?id=${c.id}"
                                               role="button">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </jsp:body>
</t:main>