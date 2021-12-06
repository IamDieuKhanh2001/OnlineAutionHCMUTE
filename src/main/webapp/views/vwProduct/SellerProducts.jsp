<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/SellerLeft.jsp"/>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Sản phẩm của tôi
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>

            </div>
        </div>
    </jsp:body>
</t:main>
