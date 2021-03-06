<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="isError" scope="request" type="java.lang.Boolean" />
<jsp:useBean id="errorMessage" scope="request" type="java.lang.String" />
<jsp:useBean id="message" scope="request" type="java.lang.String" />

<t:profile>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
        <script>
            $('#form-change-password').on('submit', function (e) {
                e.preventDefault();
                const password1 = $('#password_new').val();
                const password2 = $('#password_new2').val();
                if(password1 === "" || password2 === "")
                {
                    bootbox.alert({
                        message: 'Password is not empty',
                        size: 'large'
                    });
                    return;
                }
                if(password1.length <= 5)
                {
                    bootbox.alert({
                        message: 'Password is min length 6',
                        size: 'large'
                    });
                    return;
                }
                if(password1 !== password2)
                {
                    bootbox.alert({
                        message: 'Password Not Match',
                        size: 'large'
                    });
                    return;
                }
                $('#form-change-password').off('submit').submit();
            });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>?????i m???t kh???u</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-password" method="post">

                                <c:if test="${isError}" >
                                    <p class="text-danger text-center">${errorMessage}</p>
                                </c:if>

                                <c:if test="${message != \"\"}" >
                                    <p class="text-success text-center">${message}</p>
                                </c:if>

                                <div class="form-group row">
                                    <label for="password_current" class="col-4 col-form-label">Nh???p m???t kh???u hi???n t???i</label>
                                    <div class="col-8">
                                        <input id="password_current" name="password_current" placeholder="Nh???p m???t kh???u hi???n t???i" class="form-control here" required="required" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password_new" class="col-4 col-form-label">Nh???p m???t kh???u m???i</label>
                                    <div class="col-8">
                                        <input id="password_new" name="password_new" placeholder="Nh???p m???t kh???u m???i" class="form-control here" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password_new2" class="col-4 col-form-label">Nh???p l???i m???t kh???u m???i</label>
                                    <div class="col-8">
                                        <input id="password_new2" name="password_new2" placeholder="Nh???p l???i m???t kh???u m???i" class="form-control here" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-4 col-8">
                                        <button name="submit" type="submit" class="btn btn-primary">?????i m???t kh???u</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </jsp:body>
</t:profile>