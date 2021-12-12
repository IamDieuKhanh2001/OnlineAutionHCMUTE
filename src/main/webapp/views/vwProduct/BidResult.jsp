<%--
  Created by IntelliJ IDEA.
  User: Dieu Khanh
  Date: 12/12/2021
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request" type="com.ute.onlineautionhcmute.beans.Product"/>
<jsp:useBean id="result" scope="request" type="java.lang.Boolean"/>

<t:main>
  <jsp:body>
    <div class="card">
      <h4 class="card-header bg-dark text-light">
        Kết quả đấu giá
      </h4>
      <div class="card-body">
          <%--                đổ data vào đây--%>
        <h4 class="card-title">Sản phẩm ${product.name}</h4>
        <c:choose>
          <c:when test="${result}">
            <p class="card-text">Bạn đã đặt giá thành công cho sản phẩm!! vui lòng kiểm tra lịch sử đấu giá tại sản phẩm</p>
          </c:when>
          <c:otherwise>
            <p class="card-text">Sản phẩm đã có người đặt giá cao hơn!! vui lòng kiểm tra lịch sử đấu giá tại sản phẩm</p>
          </c:otherwise>
        </c:choose>
        <div class="card-footer">
          <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Home/" role="button">
            <i class="fa fa-backward" aria-hidden="true"></i>
            Trở về
          </a>
        </div>
      </div>
    </div>
  </jsp:body>
</t:main>