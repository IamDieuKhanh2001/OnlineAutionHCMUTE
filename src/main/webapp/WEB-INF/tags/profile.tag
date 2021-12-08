<%@ tag pageEncoding="utf-8" %>
<%--Ki thuật tạo fragment, tạo 2 lỗ đưa css js vào tag--%>
<%@ attribute name="css" fragment="true" required="false" %>
<%@ attribute name="js" fragment="true" required="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web app</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            overflow-y: scroll;
        }
    </style>
    <jsp:invoke fragment="css"/>
</head>
<body>
<jsp:include page="../../views/partials/nav.jsp"/>
<div class="container-fluid mt-2 mb-3">
    <div class="row">
        <div class="col-2">
            <jsp:include page="../../views/partials/left_profile.jsp"/>
        </div>
        <div class="col-10">
            <jsp:doBody/>
        </div>
    </div>
</div>
<footer>
    <%--        <jsp:include page="../../views/partials/footer.jsp" />--%>
</footer>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<jsp:invoke fragment="js"/>
</body>
</html>