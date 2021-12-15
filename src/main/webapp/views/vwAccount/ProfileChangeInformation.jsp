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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />

<jsp:useBean id="message" scope="request" type="java.lang.String" />


<t:profile>
    <jsp:attribute name="css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <%--        Sử dụng date time picker cho ô birthdate --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

        <script>
            // cai dat query date time picker
            $('#birthdate').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
                mask: true
            });

            //Kiem tra form validation
            $('#form-change-info').on('submit', function (e){
                e.preventDefault();


                const firstname = $('#firstname').val();
                if(firstname.length === 0){
                    alert("Invalid first name");
                    return;
                }
                const lastname = $('#lastname').val();
                if(lastname.length === 0){
                    alert("Invalid last name");
                    return;
                }

                const birthdate = $('#birthdate').val();
                if(birthdate.length === 0){
                    alert("Invalid birthdate");
                    return;
                }

                const address = $('#address').val();
                if(address.length === 0){
                    alert("Invalid address");
                    return;
                }

                const phone = $('#phone').val();
                if(phone.length === 0){
                    alert("Invalid phone number");
                    return;
                }

                $('#form-change-info').off('submit').submit()
            });
        </script>

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

                    <c:if test="${message != \"\"}">
                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-success text-center">${message}</p>
                            </div>
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-md-12">
                            <form id="form-change-info" method="POST" action="#">
                                <div class="form-group row">
                                    <label for="username" class="col-4 col-form-label">User Name</label>
                                    <div class="col-8">
                                        <input disabled="disabled" value="${authUser.username}" id="username" name="username" placeholder="Username" class="form-control here" required="required" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="firstname" class="col-4 col-form-label">First Name</label>
                                    <div class="col-8">
                                        <input value="${authUser.firstname}" id="firstname" name="firstname" placeholder="First Name" class="form-control here" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="lastname" class="col-4 col-form-label">Last Name</label>
                                    <div class="col-8">
                                        <input value="${authUser.lastname}" id="lastname" name="lastname" placeholder="Last Name" class="form-control here" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="col-4 col-form-label">Phone</label>
                                    <div class="col-8">
                                        <input value="${authUser.phone}" id="phone" name="phone" placeholder="Phone Number" class="form-control here" required="required" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-4 col-form-label">Email*</label>
                                    <div class="col-8">
                                        <input value="${authUser.email}" disabled="disabled" id="email" name="email" placeholder="Email" class="form-control here" required="required" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="birthdate" class="col-4 col-form-label">BirthDate</label>
                                    <div class="col-8">
                                        <input value="<fmt:formatDate pattern = "dd/MM/Y" value = "${authUser.birthdate}" />" id="birthdate" name="birthdate" class="form-control here" required="required" type="text">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="address" class="col-4 col-form-label">Address</label>
                                    <div class="col-8">
                                        <textarea id="address" name="address" cols="40" rows="4" class="form-control">${authUser.address}</textarea>
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
