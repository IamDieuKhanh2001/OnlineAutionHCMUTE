<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<%--<jsp:useBean id="category" scope="request" type="com.example.day10_javawebdemo3.beans.Category"></jsp:useBean>--%>
<jsp:useBean id="products" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.Product>"/>
<jsp:useBean id="sellerList" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.User>"/>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    </jsp:attribute>

    <jsp:attribute name="js">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

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
                                toastr["success"]("???? th??m s???n ph???m th??nh c??ng!", "Action Success");
                                return true;
                            } else {
                                toastr["error"]("Th??m th???t b???i!", "Action Failure");
                                return false;
                            }
                        });
                    }else{
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
                S???n ph???m ???? c?? ng?????i th???ng
            </h4>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Khong co du lieu</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${products}" var="c">
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img style="height: 222px" class="card-img-top"
                                             src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg"
                                             alt="${c.name}" title="${c.name}">
                                        <form method="post" action="${pageContext.request.contextPath}/Seller/Product/ProductWinner/EvaluationOfSeller">
                                        <div class="card-body">
                                            <h4 class="card-title text-success" >${c.name}</h4>
                                            <input name="productname" value="${c.name}" type="hidden">
                                            <input name="productid" value="${c.id}" type="hidden">
                                            <h5 class="card-title text-danger">
                                                Gi?? hi???n t???i:
                                                <fmt:formatNumber value="${c.price_current}" type="number"/>
                                            </h5>
                                            <c:forEach items="${sellerList}" var="s">
                                                <c:choose>
                                                    <c:when test="${s.id == c.user_id_holding_price}">
                                                        <p class="card-text" >Ng?????i th???ng: ${s.firstname}</p>
                                                        <input name="productbidder" value="${s.firstname}" type="hidden">
                                                        <input name="bidderid" value="${s.id}" type="hidden">
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <p class="card-text">Gi?? mua ngay:
                                                <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                            </p>
                                            <p class="card-text">Ng??y ????ng: ${c.create_time}</p>
                                            <p class="card-text">Th???i h???n: ${c.end_time}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/Detail?id=${c.id}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>
                                            <button type="submit" class="btn btn-success">
                                                ????nh gi??
                                            </button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>


    </jsp:body>
</t:main>