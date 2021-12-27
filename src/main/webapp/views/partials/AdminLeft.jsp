<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Left này chỉ dùng cho view admin--%>
<div class="card mb-3">
    <h4 class="card-header bg-dark text-light">
        Manage
        <i class="fa fa-cogs" aria-hidden="true"></i>
    </h4>
    <div class="list-group">
        <%--        category adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Category/Index" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Danh mục
        </a>
        <%--       produc type adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Product/Type/Index" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Loại sản phẩm
        </a>
        <%--       account user adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Account/Manage" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Người dùng
        </a>
        <%--       account user upgrade adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Account/Upgrade" type="button" class="text-danger btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Danh sách yêu cầu Upgrade Seller
        </a>
        <%--       account user downgrade adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Account/ManageSeller" type="button" class="text-danger btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Danh sách Seller
        </a>
        <%--       product adjust--%>
        <a href="${pageContext.request.contextPath}/Admin/Product/Index" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            Xóa sản phẩm
        </a>
    </div>
</div>
