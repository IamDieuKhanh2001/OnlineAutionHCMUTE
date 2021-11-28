<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Left này chỉ dùng cho view admin--%>
<div class="card">
    <h4 class="card-header bg-dark text-light">
        Manage
        <i class="fa fa-cogs" aria-hidden="true"></i>
    </h4>
    <div class="list-group">
        <%--        category adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Category/Index" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Category
        </a>
        <%--       produc type adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Product/Type/Index" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Product type
        </a>
            <%--       account user adjust--%>
            <a href="${pageContext.request.contextPath}/Admin/Account/Manager" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-pencil" aria-hidden="true"></i>
                User Account
            </a>
            <%--       product adjust--%>
            <a href="#" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-pencil" aria-hidden="true"></i>
                Product remove
            </a>
    </div>
</div>
