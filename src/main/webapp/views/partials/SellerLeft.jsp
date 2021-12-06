<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Left này chỉ dùng cho view admin--%>
<div class="card mb-3">
    <h4 class="card-header bg-dark text-light">
        Dashboard
        <i class="fa fa-list" aria-hidden="true"></i>
    </h4>
    <div class="list-group">
        <%--        category adjust--%>
        <a href="${pageContext.request.contextPath}/Seller/Product/Add" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-plus" aria-hidden="true"></i>
            Đăng bán sản phẩm
        </a>
            <%--        category adjust--%>
            <a href="#" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-product-hunt" aria-hidden="true"></i>
                Sản phẩm của tôi
            </a>
    </div>
</div>
