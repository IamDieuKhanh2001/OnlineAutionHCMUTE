<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/21/2021
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />
<jsp:useBean id="listHistory" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.AccountUpgrade>" />

<t:profile>
    <jsp:attribute name="js">
        <script>
            function applyUpgradeAccount(){
                $.getJSON('${pageContext.request.contextPath}/Account/Profile/Upgrade/Apply', function (result) {
                    if(result === true) {
                        toastr["success"]("Bạn đã nộp đơn thành công!", "Action Success");
                        return true;
                    } else {
                        toastr["error"]("Nộp đơn thất bại!", "Action Failure");
                        return false;
                    }
                });
            }
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Xin lên Seller</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <button onclick="applyUpgradeAccount()" name="submit" type="submit" class="btn btn-primary">Nộp đơn</button>
                                </div>
                            </div>

                            <div class="form-group row">
                                <span class="ml-3">Lịch sử</span>
                            </div>

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Ngày nộp đơn</th>
                                    <th scope="col">Trạng thái</th>
                                </tr>
                                </thead>
                                
                                <c:if test="${listHistory.size() > 0}">
                                    <c:forEach var="history" items="${listHistory}">
                                        <tbody>
                                        <tr>
                                            <th scope="row">${history.id}</th>
                                            <td>${history.create_time}</td>
                                            <c:choose>
                                                <c:when test="${history.status.toLowerCase() == \"pending\"}">
                                                    <td>Đang chờ</td>
                                                </c:when>
                                                <c:when test="${history.status.toLowerCase() == \"success\"}">
                                                    <td>Thành công</td>
                                                </c:when>
                                                <c:when test="${history.status.toLowerCase() == \"fail\"}">
                                                    <td>Từ chối</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Có lỗi</td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </c:if>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </jsp:body>
</t:profile>
