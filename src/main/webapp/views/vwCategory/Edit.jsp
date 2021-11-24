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

<%--<jsp:useBean id="category" scope="request" type="com.example.day10_javawebdemo3.beans.Category" />--%>
<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Category edit
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatID">#</label>
                        <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="">
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Category name</label>
                        <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus value="">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        Delete <i class="fa fa-trash-o" aria-hidden="true"></i>
                    </button>
                    <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/Admin/Category/Update">
                        Save <i class="fa fa-check" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>