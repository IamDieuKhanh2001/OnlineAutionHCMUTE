<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />
<jsp:useBean id="status" scope="request" type="java.lang.String" />
<jsp:useBean id="message" scope="request" type="java.lang.String" />



<t:profile>

    <jsp:attribute name="js">
        <script>
            //Kiem tra form validation
            $('#form-change-email').on('submit', function (e){
                e.preventDefault();

                const emailNew = $('#email_new').val();
                if(emailNew.length === 0){
                    alert("Invalid new email");
                    return;
                }
                const passwordCurrent = $('#password_current').val();
                if(passwordCurrent.length === 0){
                    alert("Invalid password");
                    return;
                }
                $('#form-change-email').off('submit').submit()
            });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Đổi email</h4>
                            <hr>
                        </div>
                    </div>

                    <c:if test="${status == \"success\"}">
                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-success text-center">${message}</p>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${status == \"error\"}">
                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-danger text-center">${message}</p>
                            </div>
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-email" method="POST" action="#">
                                <div class="form-group row">
                                    <label for="email_current" class="col-4 col-form-label">Email hiện tại</label>
                                    <div class="col-8">
                                        <input value="${authUser.email}" disabled id="email_current" name="email_current" class="form-control here" required="required" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_new" class="col-4 col-form-label">Nhập email mới</label>
                                    <div class="col-8">
                                        <input id="email_new" name="email_new" placeholder="Nhập email mới" class="form-control here" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password_current" class="col-4 col-form-label">Mật khẩu của bạn</label>
                                    <div class="col-8">
                                        <input id="password_current" name="password_current" placeholder="Mật khẩu của bạn" class="form-control here" type="password">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="offset-4 col-8">
                                        <button name="submit" type="submit" class="btn btn-primary">Đổi email</button>
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
