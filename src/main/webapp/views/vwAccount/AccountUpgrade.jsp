<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/27/2021
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="listAccountApplyUpgrade" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.AccountUpgrade.UpgradeApply>" />

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Account Upgrade
            </h4>
            <div class="card-body">
                <h4 class="card-title">Danh sách tài khoản xin upgrade lên seller</h4>
                <c:choose>
                    <c:when test="${listAccountApplyUpgrade.size() == 0}">
                        <p>Khong co du lieu</p>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID Apply</th>
                                <th>Tên người dùng</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Đồng ý</th>
                                <th>Hủy bỏ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listAccountApplyUpgrade}" var="accountApplyUpgrade">
                                <tr>
                                    <td>${accountApplyUpgrade.id}</td>
                                    <td>${accountApplyUpgrade.username}</td>
                                    <td>${accountApplyUpgrade.firstname} ${accountApplyUpgrade.lastname}</td>
                                    <td>${accountApplyUpgrade.email}</td>
                                    <td>${accountApplyUpgrade.phone}</td>
                                    <td>
                                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Account/Upgrade/Action?action=accept&id=${accountApplyUpgrade.id}" role="button">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/Admin/Account/Upgrade/Action?action=reject&id=${accountApplyUpgrade.id}" role="button">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </jsp:body>
</t:main>
