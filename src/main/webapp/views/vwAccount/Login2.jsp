<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 11/29/2021
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sign in</title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  <style>
    body{
      height: 100vh;
      background-image: url("https://tix.vn/app/assets/img/icons/bg2.jpg");
    }
  </style>
</head>
<body>
<div class="container">
  <br>
  <br>
  <br>
  <hr>
  <div class="row">
    <aside class="col-sm-4">
    </aside>
    <!-- col.// -->
    <aside class="col-sm-4">
      <div class="card">
        <article class="card-body">
          <a href="${pageContext.request.contextPath}/Account/Register" class="float-right btn btn-outline-primary">Sign up</a>
          <h4 class="card-title mb-4 mt-1">Sign in</h4>
          <p>
            <a href="" class="btn btn-block btn-outline-info"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
            <a href="" class="btn btn-block btn-outline-primary"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
          </p>
          <hr>
          <form>
            <div class="form-group">
              <input name="" class="form-control" placeholder="Email or login" type="email">
            </div>
            <!-- form-group// -->
            <div class="form-group">
              <input class="form-control" placeholder="******" type="password">
            </div>
            <!-- form-group// -->
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <button type="submit" class="btn btn-primary btn-block"> Login  </button>
                </div>
                <!-- form-group// -->
              </div>
              <div class="col-md-6 text-right">
                <a class="small" href="#">Forgot password?</a>
              </div>
            </div>
            <!-- .row// -->
          </form>
        </article>
      </div>
      <!-- card.// -->
    </aside>
    <!-- col.// -->

  </div>
  <!-- row.// -->
</div>
<!--container end.//-->
<br><br><br>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>
