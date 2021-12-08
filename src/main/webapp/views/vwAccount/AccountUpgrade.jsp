<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/27/2021
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Account Upgrade
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">Danh sách tài khoản xin upgrade bidder lên seller</h4>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên người dùng</th>
                                <th>Tên đăng nhập</th>
                                <th>Loại người dùng</th>
                                <th>Đồng ý</th>
                                <th>Hủy bỏ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>1</td>
                                <td>
                                    <a class="btn btn-outline-success" href="#" role="button">
                                        <i class="fa fa-check" aria-hidden="true"></i>
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
