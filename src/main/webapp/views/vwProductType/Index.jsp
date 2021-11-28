<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 11/27/2021
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="productTypeList" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.ProductType>"/>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light d-flex justify-content-between">
                Product type
                <a class="btn btn-success" href="${pageContext.request.contextPath}/Admin/Product/Type/Add"
                   role="button">
                    Add Product Type
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <c:choose>
                    <c:when test="${productTypeList.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Khong co du lieu</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                                <%--Hien thi attribute da nhan--%>
                                <%--               ${categorys.catID} - ${category.catName}--%>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Category ID</th>
                                    <th>Product type name</th>
                                    <th>Create time</th>
                                    <th>Modify time</th>

                                    <th>&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${productTypeList}" var="c">
                                    <tr>
                                        <td>${c.category_id}</td>
                                        <td>${c.name}</td>
                                        <td>${c.create_time}</td>
                                        <td>${c.modified_time}</td>

                                        <td class="text-right">
                                            <a class="btn btn-success"
                                               href="${pageContext.request.contextPath}/Admin/Product/Type/Edit?id=${c.id}"
                                               role="button">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
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
