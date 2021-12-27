<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/26/2021
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="listUserSeller" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>

<t:main>
    <jsp:attribute name="css">
        <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
        />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
        <script>
            function sleep(ms) {
                return new Promise(resolve => setTimeout(resolve, ms));
            }

            function checkProductExpried(sellerID) {
                $.getJSON('${pageContext.request.contextPath}/Admin/Account/ManageSeller/CheckProduct?sellerID=' + sellerID, function (data) {
                    if(data.status === 'error'){
                        let message = '<span class="text-danger">Tài khoản này còn 1 số sản phẩm đang còn hạn đấu giá:</span><br><br>';
                        for(var k in data.data) {
                            message += data.data[k].name + '<br>';
                        }
                        message += '<br><span class="text-danger">Không thể hạ cấp</span>';
                        bootbox.alert({
                            message: message,
                            size: 'large'
                        });
                        return;
                    } else {
                        $.getJSON('${pageContext.request.contextPath}/Admin/Account/ManageSeller/DownGrade?sellerID=' + sellerID, async function (dataDownGrade) {
                            if(dataDownGrade.status === 'success') {
                                bootbox.alert({
                                    message: 'Thành công',
                                    size: 'large'
                                });
                                await sleep(3000);
                                location.reload();
                                return;
                            } else {
                                bootbox.alert({
                                    message: 'Thất bại',
                                    size: 'large'
                                });
                                return;
                            }
                        });
                    }
                });
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Account Upgrade
            </h4>
            <div class="card-body">
                <h4 class="card-title">Danh sách tài khoản Seller</h4>
                <c:choose>
                    <c:when test="${listUserSeller.size() == 0}">
                        <p>Khong co du lieu</p>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên người dùng</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Hạ cấp</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listUserSeller}" var="userSeller">
                                <tr>
                                    <td>${userSeller.id}</td>
                                    <td>${userSeller.username}</td>
                                    <td>${userSeller.firstname} ${userSeller.lastname}</td>
                                    <td>${userSeller.email}</td>
                                    <td>${userSeller.phone}</td>
                                    <td>
                                        <button class="btn btn-outline-danger" onclick="checkProductExpried('${userSeller.id}')" role="button">
                                            <i class="fa fa-arrow-down" aria-hidden="true"></i>
                                        </button>
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
