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

<t:profile>
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
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-email" method="POST" action="#">
                                <div class="form-group row">
                                    <label for="email_current" class="col-4 col-form-label">Email hiện tại</label>
                                    <div class="col-6">
                                        <input value="${authUser.email}" disabled id="email_current" name="email_current" class="form-control here" required="required" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="code_confirm" class="col-4 col-form-label">Mã xác nhận</label>
                                    <div class="col-8">
                                        <input id="code_confirm" name="code_confirm" placeholder="Mã xác nhận" class="form-control here" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_new" class="col-4 col-form-label">Nhập email mới</label>
                                    <div class="col-8">
                                        <input id="email_new" name="email_new" placeholder="Nhập email mới" class="form-control here" type="text">
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
