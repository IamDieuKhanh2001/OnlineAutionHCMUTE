<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Left này chỉ dùng cho view admin--%>
<div class="card mb-3">
    <h4 class="card-header bg-dark text-light">
        <i class="fa fa-balance-scale" aria-hidden="true"></i>
        Seller
    </h4>
    <div class="list-group">
        <%--        Đăng--%>
        <a href="${pageContext.request.contextPath}/Seller/Product/Add" type="button" class="btn btn-outline-secondary rounded-0 py-3">
            <i class="fa fa-plus" aria-hidden="true"></i>
            Đăng đấu giá sản phẩm
        </a>
            <%--      Xem tất cả sp seller--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/All" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-product-hunt" aria-hidden="true"></i>
                Sản phẩm đã đăng
            </a>

            <%--      Xem sản phẩm đang đăng và còn hạn--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/ProductPostExpired" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-clock-o" aria-hidden="true" ></i>
                Sản phẩm (còn hạn)
            </a>

            <%--      Xem sp có người thằng--%>
            <a href="${pageContext.request.contextPath}/Seller/Product/ProductWinner" type="button" class="btn btn-outline-secondary rounded-0 py-3">
                <i class="fa fa-product-hunt" aria-hidden="true"></i>
                Sản phẩm có người thắng
            </a>
    </div>
</div>
