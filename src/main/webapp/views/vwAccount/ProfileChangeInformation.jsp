<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />

<t:profile>
    <jsp:attribute name="css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">
    </jsp:attribute>
    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Your Profile</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-info" method="POST" action="#">
                                <div class="form-group row">
                                    <label for="username" class="col-4 col-form-label">User Name*</label>
                                    <div class="col-8">
                                        <input value="${authUser.username}" id="username" name="username" placeholder="Username" class="form-control here" required="required" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-4 col-form-label">First Name</label>
                                    <div class="col-8">
                                        <input value="${authUser.firstname}" id="name" name="name" placeholder="First Name" class="form-control here" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lastname" class="col-4 col-form-label">Last Name</label>
                                    <div class="col-8">
                                        <input value="${authUser.lastname}" id="lastname" name="lastname" placeholder="Last Name" class="form-control here" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="text" class="col-4 col-form-label">Nick Name*</label>
                                    <div class="col-8">
                                        <input value="${authUser.username}" id="text" name="text" placeholder="Nick Name" class="form-control here" required="required" type="text">
                                    </div>
                                </div>
<%--                                <div class="form-group row">--%>
<%--                                    <label for="select" class="col-4 col-form-label">Display Name public as</label>--%>
<%--                                    <div class="col-8">--%>
<%--                                        <select id="select" name="select" class="custom-select">--%>
<%--                                            <option value="admin">Admin</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group row">
                                    <label for="email" class="col-4 col-form-label">Email*</label>
                                    <div class="col-8">
                                        <input value="${authUser.email}" readonly id="email" name="email" placeholder="Email" class="form-control here" required="required" type="text">
                                    </div>
                                </div>
<%--                                <div class="form-group row">--%>
<%--                                    <label for="website" class="col-4 col-form-label">Website</label>--%>
<%--                                    <div class="col-8">--%>
<%--                                        <input id="website" name="website" placeholder="website" class="form-control here" type="text">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group row">
                                    <label for="publicinfo" class="col-4 col-form-label">Public Info</label>
                                    <div class="col-8">
                                        <textarea id="publicinfo" name="publicinfo" cols="40" rows="4" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-4 col-8">
                                        <button name="submit" type="submit" class="btn btn-primary">Cập nhật thông tin</button>
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
