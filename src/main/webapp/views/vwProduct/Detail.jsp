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
            // Ngày cần đếm ngược
            var countDownDate = new Date("${product.end_time}").getTime();

            // Cập nhật đếm ngược sau mỗi 1 giây
            var x = setInterval(function() {

                // Lấy ngày và giờ hôm nay
                var now = new Date().getTime();

                // Tìm khoảng cách giữa bây giờ và ngày đếm ngược
                var distance = countDownDate - now;

                // Tính toán thời gian cho ngày, giờ, phút và giây
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Xuất kết quả trong phần tử có id = "countdown"
                document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
                    + minutes + "m " + seconds + "s ";

                // Nếu quá trình đếm ngược kết thúc, viết hết hạn ra
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("countdown").style.color = "red";
                    document.getElementById("countdown").innerHTML = "Đã hết hạn";
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

            function addToWatchList(proID, proName){
                $.getJSON('${pageContext.request.contextPath}/Product/WatchList/IsAvailable?idProductAddingToWatchList=' + proID,function (data){
                    if(data === true){              //Sp khong ton tai trong watchlist
                        $.getJSON('${pageContext.request.contextPath}/Product/WatchList/Add?productID=' + proID, function (result){
                            if(result === true) {
                                toastr["success"]("Đã thêm sản phẩm thành công!", "Action Success");
                                return true;
                            } else {
                                toastr["error"]("Thêm thất bại!", "Action Failure");
                                return false;
                            }
                        });
                    }else{
                        toastr["error"]("Sản phẩm này đã có trong watch list của bạn!", "Action Failure");
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
                    <%--                đổ data vào đây--%>
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
                                Người bán: ${seller.username}
                            </p>
                            <c:choose>
                                <c:when test="${userHighestBid.id == product.user_id_holding_price}">
                                    <p class="product-description">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        Người đang đặt giá cao nhất: ${userHighestBid.username}
                                    </p>
                                </c:when>
                                <c:when test="${userHighestBid.id == -1}">
                                    <p class="product-description">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        Người đang đặt giá cao nhất: sản phẩm chưa ai đặt
                                    </p>
                                </c:when>
                            </c:choose>

                            <h4 class="price">
                                <i class="fa fa-money" aria-hidden="true"></i>
                                Giá hiện tại: <span><fmt:formatNumber value="${product.price_current}"
                                                                      type="number"/> VND</span>
                            </h4>
                            <h4 class="price">Thời gian còn lại: <span id="countdown"></span></h4>
                            <div class="action">
<%--                                Ẩn nút đấu giá khi hết giờ --%>
                                <c:if test="${time_ended}">
                                    <button type="button" class="add-to-cart btn btn-default disabled" disabled
                                            data-toggle="modal" data-target="">
                                        Đặt giá ngay
                                    </button>
                                </c:if>
                                <c:if test="${time_ended == false}">
                                    <button type="button" class="add-to-cart btn btn-default"
                                            data-toggle="modal" data-target="#enterPriceAuction">
                                        Đặt giá ngay
                                    </button>
                                </c:if>
                                <span onclick="addToWatchList('${product.id}', '${product.name}')" class="like btn btn-outline-danger"
                                    role="button">
                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                    Thêm vào watch list
                                </span>

                                    <%--                                THong bao sp het han dau gia--%>
                                <c:if test="${time_ended}">
                                    <div class="alert alert-warning alert-dismissible fade show mt-3" role="alert">
                                        <strong>Sản phẩm đã kết thúc</strong>
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
                        Mô tả sản phẩm
                        <i class="fa fa-sort-desc" aria-hidden="true"></i>
                    </a>
                    <a class="add-to-cart btn btn-default" data-toggle="collapse" href="#price" role="button"
                       aria-expanded="false" aria-controls="des">
                        Chi tiết giá
                        <i class="fa fa-sort-desc" aria-hidden="true"></i>
                    </a>
                    <a class="add-to-cart btn btn-default" data-toggle="collapse" href="#history" role="button"
                       aria-expanded="false" aria-controls="history">
                        Lịch sử đấu giá
                        <i class="fa fa-list" aria-hidden="true"></i>
                    </a>
                </p>
                    <%--                        Lịch sử đấu giá nội dung--%>
                <div class="collapse" id="history">
                    <div class="card card-body border-0 border-bottom-1">
                        <h3 class="card-title">Lịch sử đấu giá</h3>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">First</th>
                                <th scope="col">Last</th>
                                <th scope="col">Handle</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                    <%--                        Mô tả sản phẩm nội dung--%>
                <div class="row shadow-lg">
                    <div class="col">
                        <div class="collapse multi-collapse" id="des">
                            <div class="card card-body border-0 border-right-1">
                                <h3 class="card-title">Mô tả sản phẩm</h3>
                                <p class="product-description">${product.description}</p>
                            </div>
                        </div>
                    </div>
                        <%--                    Chi tiết giá nội dung--%>
                    <div class="col">
                        <div class="collapse multi-collapse" id="price">
                            <div class="card card-body border-0">
                                <h3 class="card-title">Chi tiết giá</h3>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Giá khởi điểm: <span><fmt:formatNumber value="${product.price_start}"
                                                                           type="number"/></span>
                                </h4>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Giá hiện tại: <span><fmt:formatNumber value="${product.price_current}"
                                                                          type="number"/></span>
                                </h4>

                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Bước giá mỗi lần: <span><fmt:formatNumber value="${product.price_step}"
                                                                              type="number"/></span>
                                </h4>
                                <h4 class="price">
                                    <i class="fa fa-money" aria-hidden="true"></i>
                                    Giá mua ngay: <span><fmt:formatNumber value="${product.price_buy_now}"
                                                                          type="number"/></span>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--Hien thi đề xuất 5 sản phẩm tương tự--%>
                <div class="sameProductType my-3">
                    <h5 class="card-title">Các sản phẩm khác cùng chuyên mục</h5>
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
        <%--Form post so tien dat--%>

        <!-- Modal -->
        <div class="modal fade" id="enterPriceAuction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nhập số tiền cao nhất bạn có thể đấu giá</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="frmAuction" method="post"
                              action="${pageContext.request.contextPath}/Product/Auction?id=${product.id}">
                            <div class="input-group mb-3">
                                <input name="maxAuctionPrice" type="text" class="form-control" placeholder="Số tiền...">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="">VND</span>
                                </div>
                            </div>
                            <p class="card-text text-warning">
                                <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                                Lưu ý 
                                <br>Hệ thống sẽ tự động đấu giá sản phẩm với chi phí thấp nhất với chi phí bạn đặt ra!! Đặt giá và uống 1 tách trà đợi kết quả nhé
                                <br>Hệ thống sẽ phân định người sở hữu sản phẩm dựa trên giá đấu cao nhất khi hết thời gian
                            </p>
                        </form>
                    </div>
                    <div class="modal-footer d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay về</button>
                        <a class="btn btn-outline-success" href="javascript: $('#frmAuction').submit()">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Đồng ý
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
