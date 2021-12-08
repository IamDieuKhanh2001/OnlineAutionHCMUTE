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

<jsp:useBean id="authUser1" scope="session" type="com.ute.onlineautionhcmute.beans.User" />

<t:profile>
    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Đổi mật khẩu</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-password" method="POST" action="#">
                                <div class="form-group row">
                                    <label for="password_current" class="col-4 col-form-label">Nhập mật khẩu hiện tại</label>
                                    <div class="col-8">
                                        <input id="password_current" name="password_current" placeholder="Nhập mật khẩu hiện tại" class="form-control here" required="required" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password_new" class="col-4 col-form-label">Nhập mật khẩu mới</label>
                                    <div class="col-8">
                                        <input id="password_new" name="password_new" placeholder="Nhập mật khẩu mới" class="form-control here" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password_new2" class="col-4 col-form-label">Nhập lại mật khẩu mới</label>
                                    <div class="col-8">
                                        <input id="password_new2" name="password_new2" placeholder="Nhập lại mật khẩu mới" class="form-control here" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-4 col-8">
                                        <button name="submit" type="submit" class="btn btn-primary">Đổi mật khẩu</button>
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