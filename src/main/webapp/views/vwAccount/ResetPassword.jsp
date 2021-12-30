<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="userID" scope="request" type="java.lang.String" />
<jsp:useBean id="code" scope="request" type="java.lang.String" />

<html>
<head>
    <title>Reset Password</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h1>Reset Password</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3">
        <p class="text-center">Use the form below to change your password. Your password cannot be the same as your username.</p>
        <form method="post" id="passwordForm" action="${pageContext.request.contextPath}/Account/ResetPassword">
          <input name="userID" value="${userID}" style="display: none" type="text">
          <input name="code" value="${code}" style="display: none" type="text">

          <input type="password" class="input-lg form-control" name="password1" id="password1" placeholder="New Password" autocomplete="off">
          <div class="row">
            <div class="col-sm-6">
              <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 8 Characters Long<br>
              <span id="ucase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Uppercase Letter
            </div>
            <div class="col-sm-6">
              <span id="lcase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Lowercase Letter<br>
              <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Number
            </div>
          </div>
          <input type="password" class="input-lg form-control" name="password2" id="password2" placeholder="Repeat Password" autocomplete="off">
          <div class="row">
            <div class="col-sm-12">
              <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
            </div>
          </div>
          <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change Password">
        </form>
      </div><!--/col-sm-6-->
    </div><!--/row-->
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
  <script>
    $('#passwordForm').on('submit', function (e) {
      e.preventDefault();

      const password1 = $('#password1').val();
      const password2 = $('#password2').val();

      if(password1 === "" || password2 === "")
      {
        bootbox.alert({
          message: 'Password is not empty',
          size: 'large'
        });
        return;
      }
      if(password1 != password2)
      {
        bootbox.alert({
          message: 'Password Not Match',
          size: 'large'
        });
        return;
      }

      if($('#password1').hasClass("glyphicon-remove")
              || $('#8char').hasClass("glyphicon-remove")
              || $('#ucase').hasClass("glyphicon-remove")
              || $('#lcase').hasClass("glyphicon-remove")
              || $('#pwmatch').hasClass("glyphicon-remove"))
      {
        bootbox.alert({
          message: 'Password Validate Error',
          size: 'large'
        });
        return;
      }

      $('#passwordForm').off('submit').submit();

    });

    $("input[type=password]").keyup(function(){
      var ucase = new RegExp("[A-Z]+");
      var lcase = new RegExp("[a-z]+");
      var num = new RegExp("[0-9]+");

      if($("#password1").val().length >= 8){
        $("#8char").removeClass("glyphicon-remove");
        $("#8char").addClass("glyphicon-ok");
        $("#8char").css("color","#00A41E");
      }else{
        $("#8char").removeClass("glyphicon-ok");
        $("#8char").addClass("glyphicon-remove");
        $("#8char").css("color","#FF0004");
      }

      if(ucase.test($("#password1").val())){
        $("#ucase").removeClass("glyphicon-remove");
        $("#ucase").addClass("glyphicon-ok");
        $("#ucase").css("color","#00A41E");
      }else{
        $("#ucase").removeClass("glyphicon-ok");
        $("#ucase").addClass("glyphicon-remove");
        $("#ucase").css("color","#FF0004");
      }

      if(lcase.test($("#password1").val())){
        $("#lcase").removeClass("glyphicon-remove");
        $("#lcase").addClass("glyphicon-ok");
        $("#lcase").css("color","#00A41E");
      }else{
        $("#lcase").removeClass("glyphicon-ok");
        $("#lcase").addClass("glyphicon-remove");
        $("#lcase").css("color","#FF0004");
      }

      if(num.test($("#password1").val())){
        $("#num").removeClass("glyphicon-remove");
        $("#num").addClass("glyphicon-ok");
        $("#num").css("color","#00A41E");
      }else{
        $("#num").removeClass("glyphicon-ok");
        $("#num").addClass("glyphicon-remove");
        $("#num").css("color","#FF0004");
      }

      if($("#password1").val() == $("#password2").val()){
        $("#pwmatch").removeClass("glyphicon-remove");
        $("#pwmatch").addClass("glyphicon-ok");
        $("#pwmatch").css("color","#00A41E");
      }else{
        $("#pwmatch").removeClass("glyphicon-ok");
        $("#pwmatch").addClass("glyphicon-remove");
        $("#pwmatch").css("color","#FF0004");
      }
    });
  </script>
</body>
</html>
