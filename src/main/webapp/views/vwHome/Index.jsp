<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.Category>" />


<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Index page
                ${categories.size()}
            </h4>
            <div class="card-body">
                <div class="row">
                        <%--                đổ data vào đây--%>
                    <div class="col-sm-4">
                        <div class="card h-100">
                            <img class="card-img" src="${pageContext.request.contextPath}/public/img/Home/TopFiveImg.png" />
                            <div class="card-body">
                                <h4 class="card-title">Top 5 sản phẩm gần kết thúc</h4>
                                <p class="card-text">Text</p>
                            </div>
                            <div class="card-footer text-muted">
                                <a class="btn btn-outline-success" href="#" role="button">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Xem ngay
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card h-100">
                            <img class="card-img" src="${pageContext.request.contextPath}/public/img/Home/TopFiveImg.png" />
                            <div class="card-body">
                                <h4 class="card-title">Top 5 sản phẩm có lượt ra giá nhiều nhất</h4>
                                <p class="card-text">Text</p>
                            </div>
                            <div class="card-footer text-muted">
                                <a class="btn btn-outline-success" href="#" role="button">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Xem ngay
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card h-100">
                            <img class="card-img" src="${pageContext.request.contextPath}/public/img/Home/TopFiveImg.png" />
                            <div class="card-body">
                                <h4 class="card-title">Top 5 sản phẩm có giá cao nhất</h4>
                                <p class="card-text">Text</p>
                            </div>
                            <div class="card-footer text-muted">
                                <a class="btn btn-outline-success" href="#" role="button">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Xem ngay
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>