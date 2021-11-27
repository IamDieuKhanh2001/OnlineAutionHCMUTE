<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="categories" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Category>"/>
<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Product type
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtProductTypeName">Name</label>
                        <input type="text" class="form-control" id="txtProductTypeName" name="name" autofocus>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Chọn Category cần thêm danh mục con</label>
                        </div>
                        <select class="custom-select" id="inputGroupSelect01" name="category_id">
                            <c:forEach items="${categories}" var="c">
                                <option value="${c.id}">Category ID: ${c.id} - ${c.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Type/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-success">
                        Save <i class="fa fa-check" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>