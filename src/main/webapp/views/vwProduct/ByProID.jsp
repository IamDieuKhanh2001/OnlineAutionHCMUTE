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
    <jsp:attribute name="js">
        <script>
            //Kiem tra san pham duoc them vao watch list chua
                    $('.js-WatchListAlert').on('click', function (e){
                        const proID = $('#txtProID').val();
                        $.getJSON('${pageContext.request.contextPath}/Product/WatchList/IsAvailable?idProductAddingToWatchList=' + proID,function (data){
                            if(data === true){              //Sp khong ton tai trong watchlist
                                alert("Đã thêm sản phẩm thành công!!")
                            }else{
                                alert("Sản phẩm này đã có trong watch list của bạn!")
                            }
                        })
                    })
                </script>
    </jsp:attribute>

    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Product
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
                                        <img class="card-img-top"
                                             src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg"
                                             alt="${c.name}" title="${c.name}">
                                        <div class="card-body">
                                            <h4 class="card-title text-success">${c.name}</h4>
                                            <h5 class="card-title text-danger">
                                                Giá hiện tại:
                                                <fmt:formatNumber value="${c.price_current}" type="number"/>
                                            </h5>
                                            <c:forEach items="${sellerList}" var="s">
                                                <c:choose>
                                                    <c:when test="${s.id == c.user_id}">
                                                        <p class="card-text">Người bán: ${s.username} #${s.id}</p>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <p class="card-text">Giá mua ngay:
                                                <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                            </p>
                                            <p class="card-text">Ngày đăng: ${c.create_time}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/Detail?id=${c.id}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>

                                            <a class="btn btn-outline-danger watchListNoticePopover js-WatchListAlert"
                                               href="${pageContext.request.contextPath}/Product/AddWatchList?id=${c.id}"
                                               role="button">
                                                <i class="fa fa-heart" aria-hidden="true"></i>
                                                Add to watch list
                                            </a>
<%--                                            Input lưu id sản phẩm cho việc js lấy id sản phẩm và xử lí IsAvailable--%>
                                        <input id="txtProID" name="proID" value="${c.id}" class="d-none"/>
                                        </div>
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