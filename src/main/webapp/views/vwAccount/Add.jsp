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

<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Create new Account
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control" id="txtUsername" name="name" autofocus>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="txt">Password</label>--%>
<%--                        <input type="text" class="form-control" id="txtUsername" name="name" autofocus>--%>
<%--                    </div>--%>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Loại user</label>
                        </div>
                        <select class="custom-select" id="inputGroupSelect01" name="category_id">
                            <option value="aa">Bidder</option>
                            <option value="aa">Seller</option>
                        </select>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Account/" role="button">
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