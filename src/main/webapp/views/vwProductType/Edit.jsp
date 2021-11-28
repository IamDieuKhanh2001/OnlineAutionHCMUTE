<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="productType" scope="request" type="com.ute.onlineautionhcmute.beans.ProductType" />

<%--Su dung attribute categories de hien thi select--%>
<jsp:useBean id="categories" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Category>"/>

<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Product type edit
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtProductTypeID">#</label>
                        <input type="text" class="form-control" id="txtProductTypeID" name="id" readonly value="${productType.id}">
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect_Cat_id">Category ID</label>
                            </div>
                            <select class="custom-select" id="inputGroupSelect_Cat_id" name="category_id">
                                <option selected value="${productType.category_id}">
                                    Category ID: ${productType.category_id}
                                </option>
                                <c:forEach items="${categories}" var="c">
                                    <option value="${c.id}">Category ID: ${c.id} - ${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Tên danh mục con</label>
                        <input type="text" class="form-control" id="txtCatName" name="name" autofocus value="${productType.name}">
                    </div>
<%--                    Hien thi thoi gian chinh sua--%>
                    <p class="text-warning">Tạo lúc: ${productType.create_time}</p>
                    <p class="text-danger">Lần cuối chỉnh sửa: ${productType.modified_time}</p>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Type/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Product/Type/Delete">
                        Delete <i class="fa fa-trash-o" aria-hidden="true"></i>
                    </button>
                    <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/Admin/Product/Type/Update">
                        Save <i class="fa fa-check" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>