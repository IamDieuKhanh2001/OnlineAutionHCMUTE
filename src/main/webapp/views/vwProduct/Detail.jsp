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

<jsp:useBean id="product" scope="request" type="com.ute.onlineautionhcmute.beans.Product" />

<t:main>
    <jsp:body>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product_detail_style.css">
        <div class="container">
            <div class="card">
                <div class="container-fluid">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg" /></div>
                                <div class="tab-pane" id="pic-2"><img src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_2.jpg" /></div>
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">
                                <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_1.jpg" /></a></li>
                                <li><a data-target="#pic-2" data-toggle="tab"><img src="${pageContext.request.contextPath}/public/img/product/${product.id}/thumps_2.jpg" /></a></li>
                            </ul>
                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title">${product.name}</h3>
                            <p class="product-description">${product.description}</p>
                            <h4 class="price">Giá hiện tại: <span><fmt:formatNumber value="${product.price_current}" type="number" /></span></h4>
                            <h4 class="price">Ngày hết hạn: <span><fmt:formatDate value="${product.create_time}" type="date" /></span></h4>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button">Đặt giá ngay</button>
                                <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
