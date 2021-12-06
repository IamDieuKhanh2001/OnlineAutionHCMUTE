<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<%--<jsp:useBean id="listUserType" scope="request"--%>
<%--             type="java.util.List<com.ute.onlineautionhcmute.beans.UserType>"/>--%>

<t:main>
    <jsp:attribute name="admin_left_navigation">
        <jsp:include page="../partials/SellerLeft.jsp"/>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/zffyhqb63rpsg5zlx2nauvwr1j9nu5aut726ehrd05jh0xqs/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#description',
                height: 450,
                plugins: 'paste image link autolink lists table media',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor'
                ],
                entity_encoding: 'raw',
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmAddProduct" accept-charset="UTF-8">
            <div class="card">
                <h4 class="card-header">
                    <i class="fa fa-list" aria-hidden="true"></i>
                    Đăng đấu giá sản phẩm
                </h4>
                <div class="card-body">
                    <h5>Thông tin sản phẩm</h5>
                    <div class="form-group">
                        <label for="txtname">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="txtname" name="name" autofocus>
                    </div>
                    <div class="form-group">
                            <label for="description">Mô tả</label>
                            <textarea id="description" name="description"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="txtProductTypeID">Loại sản phẩm</label>
                        <input type="text" class="form-control" id="txtProductTypeID" placeholder="Tên sản phẩm" name="Product_type_id" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="txtUserID">User ID</label>
                        <input type="text" class="form-control" id="txtUserID" placeholder="Tên sản phẩm" name="user_id" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="txtPriceStart">Giá khởi đầu</label>
                        <input type="text" class="form-control" id="txtPriceStart"
                               value="20000" name="priceStart">
                    </div>
                    <div class="form-group">
                        <label for="txtPriceCurrent">Giá hiện tại</label>
                        <input type="text" class="form-control" id="txtPriceCurrent"
                               value="15" name="priceCurrent">
                    </div>
                    <div class="form-group">
                        <label for="txtPriceStep">Bước giá</label>
                        <input type="text" class="form-control" id="txtPriceStep"
                               value="16" name="PriceStep">
                    </div>
                    <div class="form-group">
                        <label for="txtPriceBuyNow">Giá mua ngay:</label>
                        <input type="text" class="form-control" id="txtPriceBuyNow"
                               value="16" name="PriceBuyNow">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Account/"
                       role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-success">
                        Đăng sản phẩm <i class="fa fa-dollar" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>