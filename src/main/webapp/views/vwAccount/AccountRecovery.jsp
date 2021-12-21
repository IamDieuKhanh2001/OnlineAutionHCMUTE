<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="isPost" scope="request"
             type="java.lang.Boolean" />

<jsp:useBean id="isExist" scope="request"
             type="java.lang.Boolean" />

<jsp:useBean id="emailPost" scope="request"
             type="java.lang.String" />

<html>
<head>
    <title>Account Recovery</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


    <style>
        .form-gap {
            padding-top: 70px;
        }
    </style>
</head>
<body>
<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Forgot Password?</h2>
                        <p>You can reset your password here.</p>
                        
                        <c:if test="${isPost == true}">
                            <c:if test="${isExist == true}">
                                <p class="text-success">Chúng tôi đã gửi email khôi phục đến ${emailPost}</p>
                            </c:if>
                            <c:if test="${isExist == false}">
                                <p class="text-danger">${emailPost} chưa được đăng ký tài khoản!</p>
                            </c:if>
                        </c:if>

                        <div class="panel-body">

                            <form id="recovery-form" role="form" autocomplete="off" class="form" method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                </div>

                                <input type="hidden" class="hide" name="token" id="token" value="">
                            </form>
                        </div>

                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Home" role="button">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            Home
                        </a>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Account/Login" role="button">
                            <i class="fa fa-key" aria-hidden="true"></i>
                            Back To Login
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
