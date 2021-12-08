<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request" type="com.ute.onlineautionhcmute.beans.Product"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product_detail_style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.carousel.min.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.theme.default.min.css">
        <style>
            .hover__content{
                background-color: rgba(0,0,0,0.5);
                opacity: 0;
            }
            .otherProduct:hover .hover__content{
                opacity: 1;
                transition: 0.5s;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.carousel.min.js"></script>
        <script>
            var owl = $('.owl-carousel');
            owl.owlCarousel({
                loop:true,
                margin:10,
                responsive:{
                    0:{
                        items:1
                    },
                    600:{
                        items:2
                    },
                    960:{
                        items:3
                    },
                    1200:{
                        items:4
                    }
                }
            });
            owl.on('mousewheel', '.owl-stage', function (e) {
                if (e.deltaY>0) {
                    owl.trigger('next.owl');
                } else {
                    owl.trigger('prev.owl');
                }
                e.preventDefault();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                    ${product.name}
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <div class="card-slide">
                    <div class="container-fluid">
                        <div class="wrapper row">
                            <div class="preview col-6">
                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img
                                            src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg"/>
                                    </div>
                                    <div class="tab-pane" id="pic-2"><img
                                            src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_2.jpg"/>
                                    </div>
                                </div>
                                <ul class="preview-thumbnail nav nav-tabs">
                                    <li class="active"><a data-target="#pic-1" data-toggle="tab"><img
                                            src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg"/></a>
                                    </li>
                                    <li><a data-target="#pic-2" data-toggle="tab"><img
                                            src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_2.jpg"/></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="details col-6">
                                <h3 class="product-title">${product.name}</h3>
                                <p class="product-description">${product.description}</p>
                                <h4 class="price">Giá hiện tại: <span><fmt:formatNumber value="${product.price_current}"
                                                                                        type="number"/></span></h4>
                                <h4 class="price">Ngày hết hạn (Database thiếu ngày hết hạn): <span><fmt:formatDate
                                        value="${product.create_time}" type="date"/></span></h4>
                                <div class="action">
                                    <button class="add-to-cart btn btn-default" type="button">Đặt giá ngay</button>
                                    <a href="${pageContext.request.contextPath}/Product/AddWatchList?id=${product.id}"
                                       class="like btn btn-outline-danger" type="button">
                                        <span class="fa fa-heart"></span>
                                        Thêm vào watch list
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sameProductType">
                    <h5 class="card-title">Các sản phẩm khác cùng chuyên mục</h5>
                    <div class="owl-carousel">
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="otherProduct">
                            <div class="product__img position-relative">
                                <img src="${pageContext.request.contextPath}/public/img/product/3/main.jpg" alt="">
                            </div>
                            <div class="hover__content position-absolute sticky-top w-100 h-100">
                                <div class="d-flex justify-content-around align-items-center h-100">
                                    <h5 class="card-title text-danger">
                                        3000000 VND
                                    </h5>
                                    <a class="btn btn-success" href="#" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                        Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>
