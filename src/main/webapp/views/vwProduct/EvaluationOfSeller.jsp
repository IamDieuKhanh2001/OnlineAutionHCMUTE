<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--<jsp:useBean id="productbidder" scope="request" type="java.lang.String"/>--%>
<%--<jsp:useBean id="productname" scope="request" type="java.lang.String"/>--%>
<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:attribute name="css">
        <%--        bootstrap file input--%>
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all"
              rel="stylesheet" type="text/css"/>
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
                allowedFileExtensions: ['jpg', 'png']
            });
            $('#fuImg1').fileinput({
                theme: 'fa',
                language: 'vi',
                dropZoneEnabled: false,
                allowedFileExtensions: ['jpg', 'png']
            });
            $('#fuImg2').fileinput({
                theme: 'fa',
                language: 'vi',
                dropZoneEnabled: false,
                allowedFileExtensions: ['jpg', 'png']
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="${pageContext.request.contextPath}/Seller/Product/ProductWinner/EvaluationOfSeller/DoneEvaluation" method="post" id="frmAddEvaluationOfSeller" accept-charset="UTF-8">
            <div class="card">
                <h4 class="card-header bg-dark text-light">
                    <i class="fa fa-list" aria-hidden="true"></i>
                    Đánh giá
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtnamebidder">Gửi đến:</label>
                        <input type="text" class="form-control" id="txtnamebidder" name="txtnamebidder"
                               value="${productbidder}" name="priceStart" readonly>
                    </div>
                    <div class="form-group">
                        <label for="txtnameproduct">Sản phẩm:</label>
                        <input type="text" class="form-control" id="txtnameproduct" name=txtnameproduct"
                               value="${productname}" name="PriceStep" readonly>
                    </div>
                    <div class="form-group">
                        <label for="txtcomment">Lời nhận xét:</label>
                        <textarea class="form-control" id="txtcomment" name="txtcomment" placeholder="Lời Nhận Xét..."
                                  rows="4"></textarea>
                    </div>
                    <input name="productid" value="${productid}" type="hidden">
                    <input name="bidderid" value="${bidderid}" type="hidden">
                    <input type="radio" id="like" name="fav_language" value="like" checked>
                    <label for="like"><i class="fa fa-thumbs-o-up fa-2x" aria-hidden="true"></i></label>
                    <input type="radio" id="dislike" name="fav_language" value="dislike" style="margin-left: 50px">
                    <label for="dislike"><i class="fa fa-thumbs-o-down fa-2x" aria-hidden="true"></i></label>
                    <br/>

                    <a role="button" class="btn btn-primary"
                       href="${pageContext.request.contextPath}/Seller/Product/ProductWinner">
                        Quay lại
                    </a>
                    <button type="submit" class="btn btn-success">
                        Gửi đánh giá
                    </button>

                    <a role="button" class="btn btn-primary"
                       href="${pageContext.request.contextPath}/Seller/Product/ProductWinner/DenyDeal?bidderid=${bidderid}&productid=${productid}">
                        Hủy Giao Dịch
                    </a>
                </div>
            </div>
        </form>
    </jsp:body>
</t:main>