<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/24/2021
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light d-flex justify-content-between">
                Category
                <a class="btn btn-success" href="${pageContext.request.contextPath}/Admin/Category/Add" role="button">
                    Add Category
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Category</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Quan ao</td>
                            <td class="text-right">
                                <a class="btn btn-success" href="" role="button">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Quan ao</td>
                            <td class="text-right">
                                <a class="btn btn-success" href="" role="button">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Quan ao</td>
                            <td class="text-right">
                                <a class="btn btn-success" href="" role="button">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </jsp:body>
</t:main>
