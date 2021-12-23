<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/21/2021
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.onlineautionhcmute.beans.User" />

<t:profile>
    <jsp:attribute name="js">
        <script>
            function applyUpgradeAccount(){
                $.getJSON('${pageContext.request.contextPath}/Account/Profile/Upgrade/Apply', function (result) {
                    if(result === true) {
                        toastr["success"]("Bạn đã nộp đơn thành công!", "Action Success");
                        return true;
                    } else {
                        toastr["error"]("Nộp đơn thất bại!", "Action Failure");
                        return false;
                    }
                });
            }
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Xin lên Seller</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <button onclick="applyUpgradeAccount()" name="submit" type="submit" class="btn btn-primary">Nộp đơn</button>
                                </div>
                            </div>

                            <div class="form-group row">
                                <span class="ml-3">Lịch sử</span>
                            </div>

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>

                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </jsp:body>
</t:profile>
