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
<jsp:useBean id="seller" scope="request" type="com.ute.onlineautionhcmute.beans.User"/>
<jsp:useBean id="userHighestBid" scope="request" type="com.ute.onlineautionhcmute.beans.User"/>
<jsp:useBean id="similarProduct" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.Product>"/>
<jsp:useBean id="allowBidding" scope="request" type="java.lang.Boolean"/>

<jsp:useBean id="listProduct_history" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.ProductHistory>"/>
<jsp:useBean id="user" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product_detail_style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.carousel.min.css">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.theme.default.min.css">
        <style>
            .hover__content {
                background-color: rgba(0, 0, 0, 0.5);
                opacity: 0;
            }

            .otherProduct {
                width: 291px;
                height: 163px;
            }

            .otherProduct:hover .hover__content {
                opacity: 1;
                transition: 0.5s;
            }
        </style>
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script src="${pageContext.request.contextPath}/public/lib/owlCarousel/owl.carousel.min.js"></script>
        <script>
            var owl = $('.owl-carousel');
            owl.owlCarousel({
                margin: 10,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    960: {
                        items: 3
                    },
                    1200: {
                        items: 4
                    }
                }
            });
            owl.on('mousewheel', '.owl-stage', function (e) {
                if (e.deltaY > 0) {
                    owl.trigger('next.owl');
                } else {
                    owl.trigger('prev.owl');
                }
                e.preventDefault();
            });
        </script>

        <%--CountDown Timer--%>
        <script>
            // Ng??y c???n ?????m ng?????c
            var countDownDate = new Date("${product.end_time}").getTime();

            // C???p nh???t ?????m ng?????c sau m???i 1 gi??y
            var x = setInterval(function () {

                // L???y ng??y v?? gi??? h??m nay
                var now = new Date().getTime();

                // T??m kho???ng c??ch gi???a b??y gi??? v?? ng??y ?????m ng?????c
                var distance = countDownDate - now;

                // T??nh to??n th???i gian cho ng??y, gi???, ph??t v?? gi??y
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Xu???t k???t qu??? trong ph???n t??? c?? id = "countdown"
                document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
                    + minutes + "m " + seconds + "s ";

                // N???u qu?? tr??nh ?????m ng?????c k???t th??c, vi???t h???t h???n ra
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("countdown").style.color = "red";
                    document.getElementById("countdown").innerHTML = "???? h???t h???n";
                }
            }, 1000);
        </script>

        <%--Add To Watch List--%>
        <script>
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "3000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }

            function addToWatchList(proID, proName) {
                $.getJSON('${pageContext.request.contextPath}/Product/WatchList/IsAvailable?idProductAddingToWatchList=' + proID, function (data) {
                    if (data === true) {              //Sp khong ton tai trong watchlist
                        $.getJSON('${pageContext.request.contextPath}/Product/WatchList/Add?productID=' + proID, function (result) {
                            if (result === true) {
                                toastr["success"]("???? th??m s???n ph???m th??nh c??ng!", "Action Success");
                                return true;
                            } else {
                                toastr["error"]("Vui l??ng ????ng nh???p ????? s??? d???ng ch???c n??ng n??y!", "Action Failure");
                                return false;
                            }
                        });
                    } else {
                        toastr["error"]("S???n ph???m n??y ???? c?? trong watch list c???a b???n!", "Action Failure");
                        return false;
                    }
                })
            }
        </script>

    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                    ${product.name}
            </h4>
            <div class="card-body">
                    <%--                ????? data v??o ????y--%>
                <div class="card-slide">
                    <div class="wrapper row">
                        <div class="preview col-6">
                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img
                                        src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg"
                                        alt="" title=""/>
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
                            <p class="product-description">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                Ng?????i b??n: <a href="${pageContext.request.contextPath}/Account/Profile/User?userid=${seller.id}">${seller.username}</a>
                            </p>
                            <c:choose>
                                <c:when test="${userHighestBid.id == product.user_id_holding_price}">
                                    <p class="product-description">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        Ng?????i ??ang ?????t gi?? cao nh???t: ${userHighestBid.username}
                                    </p>
                                </c:when>
                                <c:when test="${userHighestBid.id == -1}">
                                    <p class="product-description">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        Ng?????i ??ang ?????t gi?? cao nh???t: s???n ph???m ch??a ai ?????t
                                    </p>
                                </c:when>
                            </c:choose>

                            <h4 class="price">
                                <i class="fa fa-money" aria-hidden="true"></i>
                                Gi?? hi???n t???i: <span><fmt:formatNumber value="${product.price_current}"
                                                                      type="number"/> VND</span>
                            </h4>
                            <h4 class="price">Th???i gian c??n l???i: <span id="countdown"></span></h4>
                            <div class="action">
                                    <%--                                ???n n??t ?????u gi?? khi h???t gi??? --%>
                                <c:if test="${time_ended}">
                                    <button type="button" class="add-to-cart btn btn-default disabled" disabled
                                            data-toggle="modal" data-target="">
                                        ?????t gi?? ngay
                                    </button>
                                </c:if>
                                <c:if test="${time_ended == false}">
                                    <button type="button" class="add-to-cart btn btn-default"
                                            data-toggle="modal" data-target="#enterPriceAuction">
                                        ?????t gi?? ngay
                                    </button>
                                </c:if>
                                <span onclick="addToWatchList('${product.id}', '${product.name}')"
                                      class="like btn btn-outline-danger"
                                      role="button">
                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                    Th??m v??o watch list
                                </span>

                                    <%--                                THong bao sp het han dau gia--%>
                                <c:if test="${time_ended}">
                                    <div class="alert alert-warning alert-dismissible fade show mt-3" role="alert">
                                        <strong>S???n ph???m ???? k???t th??c</strong>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--description--%>
                <p>
                    <a class="add-to-cart btn btn-default" data-toggle="collapse" href="#des" role="button"
                       aria-expanded="false" aria-controls="des">
                        M?? t??? s???n ph???m
                        <i class="fa fa-sort-desc" aria-hidden="true"></i>
                    </a>
                    <a class="add-to-cart btn btn-default" data-toggle="collapse" href="#price" role="button"
                       aria-expanded="false" aria-controls="des">
                        Chi ti???t gi??
                        <i class="fa fa-sort-desc" aria-hidden="true"></i>
                    </a>
                    <a class="add-to-cart btn btn-default" data-toggle="collapse" href="#history" role="button"
                       aria-expanded="false" aria-controls="history">
                        L???ch s??? ?????u gi??
                        <i class="fa fa-list" aria-hidden="true"></i>
                    </a>
                </p>
                    <%--                        L???ch s??? ?????u gi?? n???i dung--%>
                <div class="collapse" id="history">
                    <div class="card card-body border-0 border-bottom-1">
                        <h3 class="card-title">L???ch s??? ?????u gi??</h3>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Th???i ??i???m</th>
                                <th scope="col">Ng?????i mua</th>
                                <th scope="col">Gi??</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listProduct_history}" var="c">
                                <tr>
                                    <td>${c.create_time}</td>
                                        <%--Tim va Hien thi ten quyen cua user--%>
                                    <c:forEach items="${user}" var="t">
                                        <c:choose>
                                            <c:when test="${t.id == c.user_id_holding}">
                                                <td>
                                                    *****${t.firstname}
                                                </td>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <td>
                                        <fmt:formatNumber value="${c.price_bidding}" type="number"/>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                    <%--                        M?? t??? s???n ph???m n???i dung--%>
                <div class="row shadow-lg">
                    <div class="col">
                        <div class="collapse multi-collapse" id="des">
                            <div class="card card-body border-0 border-right-1">
                                <h3 class="card-title">M?? t??? s???n ph???m</h3>
                                <p class="product-description">${product.description}</p>
                            </div>
                        </div>
                    </div>
                        <%--                    Chi ti???t gi?? n???i dung--%>
                    <div class="col">
                        <div class="collapse multi-collapse" id="price">
                            <div class="card card-body border-0">
                                <h3 class="card-title">Chi ti???t gi??</h3>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Gi?? kh???i ??i???m: <span><fmt:formatNumber value="${product.price_start}"
                                                                           type="number"/></span>
                                </h4>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Gi?? hi???n t???i: <span><fmt:formatNumber value="${product.price_current}"
                                                                          type="number"/></span>
                                </h4>

                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    B?????c gi?? m???i l???n: <span><fmt:formatNumber value="${product.price_step}"
                                                                              type="number"/></span>
                                </h4>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Gi?? mua ngay: <span><fmt:formatNumber value="${product.price_buy_now}"
                                                                          type="number"/></span>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--Hien thi ????? xu???t 5 s???n ph???m t????ng t???--%>
                <div class="sameProductType my-3">
                    <h5 class="card-title">C??c s???n ph???m kh??c c??ng chuy??n m???c</h5>
                    <div class="owl-carousel">
                        <c:forEach items="${similarProduct}" var="c">
                            <div class="otherProduct">
                                <div class="product__img position-relative h-100">
                                    <img class="h-100"
                                         src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg"
                                         alt="">
                                </div>
                                <div class="hover__content h-100 position-absolute sticky-top w-100 h-100">
                                    <div class="d-flex justify-content-around align-items-center h-100">
                                        <h5 class="card-title text-light">
                                                ${c.name}
                                        </h5>
                                        <a class="btn btn-success"
                                           href="${pageContext.request.contextPath}/Product/Detail?id=${c.id}"
                                           role="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                            Detail
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="card-footer text-muted">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Home/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                </div>
            </div>
        </div>
        <%--Form post y??u c???u ?????u gi?? chi ch??a ?????t 80% like--%>
        <form id="frmRequest" method="post"
              action="${pageContext.request.contextPath}/Product/Request">
            <input class="d-none" type="text" readonly name="productID" value="${product.id}">
        </form>
        <!-- Modal -->
        <div class="modal fade" id="enterPriceAuction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nh???p s??? ti???n cao nh???t b???n c?? th??? ?????u gi??</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="frmAuction" method="post"
                              action="${pageContext.request.contextPath}/Product/Auction?id=${product.id}">
                            <div class="input-group mb-3">
                                <input name="maxAuctionPrice" type="text" class="form-control" placeholder="S??? ti???n...">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="">VND</span>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${auth == false}">
                                    <p class="card-text text-danger">
                                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                                        L??u ??
                                        <br>
                                        B???n ch??a ????ng nh???p, vui l??ng ????ng nh???p ????? s??? d???ng ch???c n??ng n??y!!
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${allowBidding == false}">
                                        <p class="card-text text-danger">
                                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                                            L??u ??
                                            <br>
                                            B???n kh??ng ????? ??i???u ki???n ????? ?????u gi?? s???n ph???m n??y do b???n ch??a c?? l?????t ????nh gi??
                                            like tr??n 80%
                                            <br>
                                            ????? c?? th??? ?????u gi?? s???n ph???m n??y b???n c???n g???i y??u c???u ?????n ng?????i b??n
                                            <br>
                                            <a href="javascript: $('#frmRequest').submit()">G???i y??u c???u</a>
                                        </p>
                                    </c:if>
                                    <c:if test="${allowBidding == true}">
                                        <p class="card-text text-success">
                                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                                            L??u ??
                                            <br>
                                            ?????t cho b???n m???t gi?? tr??? cao nh???t th??ch h???p m?? b???n c?? th??? chi tr???
                                            <br>
                                            Gi?? Khuy???n ngh???:
                                            <fmt:formatNumber value="${product.price_current + product.price_step}" type="number"/>

                                            <br>
                                            C???m ??n b???n ???? tham gia!!
                                        </p>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                    <div class="modal-footer d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay v???</button>
                        <c:if test="${allowBidding == true}">
                            <a class="btn btn-outline-success" href="javascript: $('#frmAuction').submit()">
                                <i class="fa fa-check" aria-hidden="true"></i>
                                ?????t gi??
                            </a>
                        </c:if>
                        <c:if test="${allowBidding == false}">
                            <button class="btn btn-outline-success disabled" disabled>
                                <i class="fa fa-check" aria-hidden="true"></i>
                                ?????t gi??
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
