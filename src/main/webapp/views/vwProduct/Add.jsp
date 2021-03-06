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
<jsp:useBean id="productTypeList" scope="request"
             type="java.util.List<com.ute.onlineautionhcmute.beans.ProductType>"/>

<%--Nhan view model tu controler tra ve r ta hien thi ra view (JSP EL)--%>
<%--<jsp:useBean id="listUserType" scope="request"--%>
<%--             type="java.util.List<com.ute.onlineautionhcmute.beans.UserType>"/>--%>

<t:main>
    <jsp:attribute name="css">
        <%--        bootstrap file input--%>
    <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
  </jsp:attribute>
    <jsp:attribute name="js">
<%--        Tiny MCE--%>
        <script src="https://cdn.tiny.cloud/1/zffyhqb63rpsg5zlx2nauvwr1j9nu5aut726ehrd05jh0xqs/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#description',
                height: 450,
                plugins: 'paste image link autolink lists table media',
                menubar: false,
                branding: false,
                elementpath: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor'
                ],
                entity_encoding: 'raw',
            });
        </script>

        <%--        bootstrap file input--%>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
        <script>
        $('#fuImg').fileinput({
            theme: 'fa',
            language: 'vi',
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg','png']
        });
        $('#fuImg1').fileinput({
            theme: 'fa',
            language: 'vi',
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg','png']
        });
        $('#fuImg2').fileinput({
            theme: 'fa',
            language: 'vi',
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg','png']
        });
    </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmAddProduct" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="card">
                <h4 class="card-header bg-dark text-light">
                    <i class="fa fa-list" aria-hidden="true"></i>
                    ????ng ?????u gi?? s???n ph???m
                </h4>
                <div class="card-body">
                    <h5 class="card-title">B?????c 1: Th??ng tin s???n ph???m</h5>
                    <div class="form-group">
                        <label for="txtname">T??n s???n ph???m</label>
                        <input type="text" class="form-control" id="txtname" placeholder="T??n s???n ph???m" name="name"
                               autofocus>
                    </div>
                    <div class="form-group">
                        <label for="description">M?? t???</label>
                        <textarea id="description" name="description" placeholder="M?? t??? s???n ph???m"></textarea>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Ch???n lo???i s???n ph???m</label>
                        </div>
                        <select class="custom-select" id="inputGroupSelect01" name="Product_type_id">
                            <c:forEach items="${productTypeList}" var="c">
                                <option value="${c.id}">ID: ${c.id} - ${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="end_time">Th???i gian ?????u gi??</label>
                        </div>
                        <select class="custom-select" id="end_time" name="end_time">
                                <option value="1">1 ng??y</option>
                                <option value="2">2 ng??y</option>
                                <option value="3">3 ng??y</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtPriceStart">Gi?? kh???i ?????u</label>
                        <input type="text" class="form-control" id="txtPriceStart"
                               value="" name="priceStart">
                    </div>
                    <div class="form-group">
                        <label for="txtPriceStep">B?????c gi??</label>
                        <input type="text" class="form-control" id="txtPriceStep"
                               value="" name="PriceStep">
                    </div>
                    <div class="form-group">
                        <label for="txtPriceBuyNow">Gi?? mua ngay:</label>
                        <input type="text" class="form-control" id="txtPriceBuyNow"
                               value="" name="PriceBuyNow">
                    </div>
                    <h5 class="card-title">B?????c 2: Th??m h??nh ???nh</h5>
                    <div class="form-group">
                        <label for="fuImg">H??nh ???nh ch??nh</label>
                        <input id="fuImg" name="mainImg" type="file"/>
                    </div>
                    <div class="form-group">
                        <label for="fuImg1">H??nh ???nh ph??? (2 ???nh)</label>
                        <input id="fuImg1" name="thumps_1" type="file"/>
                    </div>
                    <div class="form-group">
                        <input id="fuImg2" name="thumps_2" type="file"/>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/"
                       role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button type="submit" class="btn btn-success">
                        ????ng s???n ph???m <i class="fa fa-dollar" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>