<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/17/2021
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--Su dung JSTL formatnumber de format gia tien--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--Lay Du Lieu Tu Controller--%>
<jsp:useBean id="listProductCard" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.ProductWithCard>" />
<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />

<t:profile>

    <jsp:attribute name="js">

        <script>
            function danhGia(bidderID, sellerID, productID){

            }
        </script>

        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('seller-name') // Extract info from data-* attributes
                var sellerID = button.data('seller-id') // Extract info from data-* attributes
                var productName = button.data('product-name') // Extract info from data-* attributes
                var productID = button.data('product-id') // Extract info from data-* attributes

                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('.modal-title').text('Gửi đánh giá đến ' + recipient)
                modal.find('.modal-body input#seller-name').val(recipient)
                modal.find('.modal-body input#product-name').val(productName)
                modal.find('.modal-body input#seller-id').val(sellerID)
                modal.find('.modal-body input#product-id').val(productID)
                //modal.find('button#submit').attr('onclick', 'danhGia("'+ ${authUser.id} +'", "' + sellerID + '", "'+productID+'")')
            })
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="card">
            <h4 class="card-header bg-dark text-light">
                Sản Phẩm Chiến Thắng
            </h4>
            <div class="card-body">
                    <%--                đổ data vào đây--%>
                <h4 class="card-title">Các sản phẩm bạn đã chiến thắng</h4>

                <c:choose>
                    <c:when test="${listProductCard.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu</p>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${listProductCard}" var="c">
                                    <div class="col-sm-4 mb-3">
                                        <div class="card h-100">
                                            <img class="card-img-top" src="${pageContext.request.contextPath}/public/img/product/${c.id}/main.jpg" alt="${c.name}" title="${c.name}">
                                            <div class="card-body">
                                                <h4 class="card-title text-success">${c.name}</h4>
                                                <h5 class="card-title text-danger">
                                                    Giá hiện tại:
                                                    <fmt:formatNumber value="${c.price_current}" type="number"/>
                                                </h5>

                                                <p class="card-text">Người bán: ${c.firstname} ${c.lastname}</p>
                                                <p class="card-text">Giá mua ngay:
                                                    <fmt:formatNumber value="${c.price_buy_now}" type="number"/>
                                                </p>
                                                <p class="card-text">Ngày đăng: ${c.create_time}</p>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <a  href="${pageContext.request.contextPath}/Product/Detail?id=${c.id}" class="btn btn-outline-primary" role="button">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                    Details
                                                </a>
                                                <span>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                                                            data-seller-name="${c.firstname} ${c.lastname}" data-seller-id="${c.user_id}" data-product-name="${c.name}"
                                                            data-product-id="${c.id}">
                                                        Đánh giá
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="${pageContext.request.contextPath}/Account/Profile/Evaluation" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="d-none" name="seller-id" id="seller-id">
                                <input type="text" class="d-none" name="product-id" id="product-id">
                                <input type="text" class="d-none" name="URLCurrent" value="${pageContext.request.contextPath}/Account/Profile/ProductWin">
                            </div>
                            <div class="form-group">
                                <label for="seller-name" class="col-form-label">Người được đánh giá:</label>
                                <input type="text" class="form-control" id="seller-name" readonly>
                            </div>
                            <div class="form-group">
                                <label for="product-name" class="col-form-label">Sản phẩm:</label>
                                <input type="text" class="form-control" id="product-name" readonly>
                            </div>
                            <div class="form-group">
                                <input type="radio" id="like" name="radio_type" value="like" checked>
                                <label for="like"><i class="fa fa-thumbs-o-up fa-2x" aria-hidden="true"></i></label>
                                <input type="radio" id="dislike" name="radio_type" value="dislike" style="margin-left: 50px">
                                <label for="dislike"><i class="fa fa-thumbs-o-down fa-2x" aria-hidden="true"></i></label>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Lời nhận xét:</label>
                                <textarea class="form-control" id="message-text" name="message-text"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="submit" type="submit" class="btn btn-primary">Send message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:profile>
