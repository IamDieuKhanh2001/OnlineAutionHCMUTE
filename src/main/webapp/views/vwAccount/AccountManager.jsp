<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/27/2021
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Account manager
                <a class="btn btn-success" href="${pageContext.request.contextPath}/Admin/Category/Add" role="button">
                    Add account
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">Danh sách các tài khoản</h4>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên người dùng</th>
                                <th>Tên đăng nhập</th>
                                <th>Loại người dùng</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>1</td>
                                <td>
                                    <a class="btn btn-outline-primary" href="#" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger" href="#" role="button">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
            </div>
        </div>
    </jsp:body>
</t:main>
