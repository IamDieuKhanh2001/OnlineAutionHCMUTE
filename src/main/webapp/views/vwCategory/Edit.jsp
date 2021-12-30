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

<jsp:useBean id="category" scope="request" type="com.ute.onlineautionhcmute.beans.Category" />
<t:main>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
        <script>
            function checkCategoryContainProductType(categoryID, e) {
                e.preventDefault();
                $.getJSON('${pageContext.request.contextPath}/Admin/Category/CheckCategoryContainProductType?categoryID=' + categoryID, function (result) {
                    if(result.status === 'error') {
                        let message = '<span class="text-danger">Danh mục này chứa các loại sản phẩm:</span><br><br>';
                        for(var k in result.data) {
                            message += result.data[k].name + '<br>';
                        }
                        message += '<br><span class="text-danger">Không thể xóa</span>';
                        bootbox.alert({
                            message: message,
                            size: 'large'
                        });
                        return;
                    }
                    else if(result.status === 'success') {
                        $('#form-action').attr('action', '${pageContext.request.contextPath}/Admin/Category/Delete');
                        $('#form-action').submit();
                        return;
                    }
                    else {
                        bootbox.alert({
                            message: 'Có lỗi xảy ra chưa rõ nguyên nhân.',
                            size: 'large'
                        });
                        return;
                    }
                });
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="form-action">
            <div class="card">
                <h4 class="card-header">
                    Category edit
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatID">#</label>
                        <input type="text" class="form-control" id="txtCatID" name="id" readonly value="${category.id}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Category name</label>
                        <input type="text" class="form-control" id="txtCatName" name="name" autofocus value="${category.name}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatCreatedTime">Create time</label>
                        <input type="text" class="form-control" id="txtCatCreatedTime" name="create_time" readonly value="${category.create_time}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatModifyTime">Modify time</label>
                        <input type="text" class="form-control" id="txtCatModifyTime" name="modified_time" readonly value="${category.modified_time}">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Back
                    </a>
                    <button onclick="checkCategoryContainProductType('${category.id}', event)" type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        Delete <i class="fa fa-trash-o" aria-hidden="true"></i>
                    </button>
                    <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/Admin/Category/Update">
                        Save <i class="fa fa-check" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>
</t:main>