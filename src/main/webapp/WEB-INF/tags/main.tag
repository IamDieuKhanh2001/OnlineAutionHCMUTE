<%@ tag pageEncoding="utf-8" %>
<%--Ki thuật tạo fragment, tạo 2 lỗ đưa css js vào tag--%>
<%@ attribute name="css" fragment="true" required="false" %>
<%@ attribute name="js" fragment="true" required="false" %>
<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--lỗ chứa giao diện của riêng admin view--%>
<%@ attribute name="admin_left_navigation" fragment="true" required="false" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online auction HCMUTE</title>
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
<div style="height: 60px">
    <%--        Vùng trống chứa vị trí nav bar đứng tránh nav chồng lên element khác--%>
</div>
<jsp:include page="../../views/partials/nav.jsp"/>

<div class="container-fluid mt-2 mb-3">
    <%--search--%>
    <form method="post" action="${pageContext.request.contextPath}/Home/Search">
    <div class="container-fluid py-3 mt-2 bg-light">
        <%--    dropdown buttton sort --%>
        <div class="sort d-flex justify-content-between">
            <div class="input-group mr-3 " style="width: 20%  " >
                <select name ="Time" class="custom-select" id="inputGroupSelect01" >
                    <option value="0" selected>Thời gian đấu giá</option>
                    <option value="1">Lower End Time</option>
                </select>
            </div>
            <div class="input-group mr-3" style="width: 20%">
                <select name="Price"  class="custom-select" id="inputGroupSelect02">
                    <option value="0"selected>Giá tiền</option>
                    <option value="1">Higher Price</option>
                </select>
            </div>
<%--                <button class="btn btn-outline-secondary mr-2" type="button" id="sortPrice" name="sortTime" value="Time" >--%>
<%--                    Lower End Time--%>
<%--                </button>--%>
            <%--        search bar --%>
            <input name="txtsearch" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </div>
    </div>
    </form>

    <div class="row">
        <div class="col-2">
            <jsp:invoke fragment="admin_left_navigation"/>
            <c:choose>
                <c:when test="${authUser.user_type_id == 1}">
                    <jsp:include page="../../views/partials/AdminLeft.jsp"/>
                </c:when>
                <c:when test="${authUser.user_type_id == 2}">
                    <jsp:include page="../../views/partials/SellerLeft.jsp"/>
                </c:when>
            </c:choose>
            <jsp:include page="../../views/partials/left.jsp"/>
        </div>
        <div class="col-10">
            <jsp:doBody/>
        </div>
    </div>
</div>
<footer>
        <jsp:include page="../../views/partials/footer.jsp" />
</footer>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


<script>
<%--  Active Menu  --%>
let listMenu = document.querySelectorAll('a[name="item-menu"]');
const urlCurrent = document.location.href

listMenu.forEach((menu)=>{
    let menuHref = menu.getAttribute('href');
    if(urlCurrent.includes(menuHref)) {
        menu.classList.add('active');
        let parentElement = menu.parentElement;
        let parentElement2 = parentElement.parentElement;
        parentElement2.setAttribute('class', 'collapse show');
        return;
    }
})

</script>

<jsp:invoke fragment="js"/>
</body>
</html>
