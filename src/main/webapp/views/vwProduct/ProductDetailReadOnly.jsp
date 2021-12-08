<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<jsp:useBean id="product" scope="request"
             type="com.ute.onlineautionhcmute.beans.Product"/>
<jsp:useBean id="sellerInfo" scope="request"
             type="com.ute.onlineautionhcmute.beans.User"/>
<jsp:useBean id="proType" scope="request"
             type="com.ute.onlineautionhcmute.beans.ProductType"/>
<%--View này Admin có quyền vào | view có form chứa product info chỉ đọc và không thể sửa--%>
<t:main>
    <jsp:attribute name="css">
        <style>
            .imgCarousel{
                width: 550px;
                height: 350px;
                overflow: hidden;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            $('.carousel').carousel({
                interval: 10000 //Chuyen slide img mỗi 10s
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                <i class="fa fa-info-circle" aria-hidden="true"></i>
                Thông tin sản phẩm ${product.name}
            </h4>
            <div class="card-body">
                    <%--        thong tin ng seller--%>
                <h4 class="card-title">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    Nguời bán: ${sellerInfo.username}
                </h4>
                <p class="card-text">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    Số điện thoại: ${sellerInfo.phone}
                </p>
                <p class="card-text">
                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    Email: ${sellerInfo.email}
                </p>
                    <%--        Carousel hinh anh--%>
                <div id="carousel" class="carousel slide imgCarousel"
                     data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel" data-slide-to="1"></li>
                        <li data-target="#carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active w-100 h-100">
                            <img class="d-block w-100 h-100"
                                 src="${pageContext.request.contextPath}/public/img/product/${product.id}/main.jpg"
                                 alt="${product.name}">
                        </div>
                        <div class="carousel-item w-100 h-100">
                            <img class="d-block w-100 h-100"
                                 src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg"
                                 alt="${product.name}">
                        </div>
                        <div class="carousel-item w-100 h-100">
                            <img class="d-block w-100 h-100"
                                 src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_2.jpg"
                                 alt="${product.name}">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                    <%--        end hinh anh--%>
                    <%--        thong tin--%>
                <div class="form-group">
                    <label for="txtPriceBuyNow">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        Giá mua ngay
                    </label>
                    <input type="text" class="form-control" id="txtPriceBuyNow"
                           value="<fmt:formatNumber value="${product.price_buy_now}" type="number"/>" readonly>
                </div>
                <div class="form-group">
                    <label for="txtPriceStart">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        Giá khởi đầu
                    </label>
                    <input type="text" class="form-control" id="txtPriceStart"
                           value="<fmt:formatNumber value="${product.price_start}" type="number"/>" readonly>
                </div>
                <div class="form-group">
                    <label for="txtPriceCurrent">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        Giá hiện tại
                    </label>
                    <input type="text" class="form-control" id="txtPriceCurrent"
                           value="<fmt:formatNumber value="${product.price_current}" type="number"/>" readonly>
                </div>
                <div class="form-group">
                    <label for="txtPriceStep">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        Bước giá
                    </label>
                    <input type="text" class="form-control" id="txtPriceStep"
                           value="<fmt:formatNumber value="${product.price_step}" type="number"/>" readonly>
                </div>
                <div class="form-group">
                    <label for="txtDes">
                        <i class="fa fa-audio-description" aria-hidden="true"></i>
                        Mô tả
                    </label>
                    <input type="text" class="form-control" id="txtDes" value="${product.description}" readonly>
                </div>
                <div class="form-group">
                    <label for="txtProductType">
                        <i class="fa fa-th-large" aria-hidden="true"></i>
                        Sản phẩm thuộc loại
                    </label>
                    <input type="text" class="form-control" id="txtProductType" value="${proType.name}" readonly>
                </div>
                <p class="text-secondary">
                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                    Tạo lúc: ${product.create_time}
                </p>
                <p class="text-secondary">
                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                    Lần cuối chỉnh sửa: ${product.modified_time}
                </p>
            </div>
            <div class="card-footer">
                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Index"
                   role="button">
                    <i class="fa fa-backward" aria-hidden="true"></i>
                    Back
                </a>
            </div>
        </div>


    </jsp:body>
</t:main>
