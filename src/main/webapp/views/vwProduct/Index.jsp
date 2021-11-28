<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<%--<jsp:useBean id="category" scope="request" type="com.example.day10_javawebdemo3.beans.Category"></jsp:useBean>--%>
<%--<jsp:useBean id="products" scope="request"--%>
<%--             type="java.util.List<com.example.day10_javawebdemo3.beans.Product>"/>--%>

<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/AdminLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Product (Admin)
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/Add" role="button">
                    Add Product
                    <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </h4>
                    <div class="card-body">
                            <%--Hien thi attribute da nhan--%>
                            <%--               ${categorys.catID} - ${category.catName}--%>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Product</th>
                                <th>Description</th>
                                <th class="text-right">Price</th>
                                <th class="text-right">Quantity</th>
                            </tr>
                            </thead>
                            <tbody>
<%--                            Du lieu--%>
                            <tr>
                                <td>001</td>
                                <td>quan</td>
                                <td>aaaaaaa</td>
                                <td class="text-right">
                                    <fmt:formatNumber value="2000000" type="number"/>
                                </td>
                                <td class="text-right">3</td>
                                <td class="text-right">
                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${c.proID}" role="button">
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