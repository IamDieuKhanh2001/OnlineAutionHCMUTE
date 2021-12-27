<%--
  Created by IntelliJ IDEA.
  User: TrungPC
  Date: 12/7/2021
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="User" scope="request" type="com.ute.onlineautionhcmute.beans.User" />
<jsp:useBean id="percentLike" scope="request" type="java.lang.Float" />
<jsp:useBean id="percentDislike" scope="request" type="java.lang.Float" />
<jsp:useBean id="likeEvaluation" scope="request" type="java.lang.Integer" />
<jsp:useBean id="dislikeEvaluation" scope="request" type="java.lang.Integer" />
<jsp:useBean id="listEvaluationHistory" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.Evaluation.HistoryEvaluation>" />



<t:main>
    <jsp:attribute name="css">
        <style>
          body{
            margin-top:20px;
            color: #1a202c;
            text-align: left;
            background-color: #e2e8f0;
          }
          .main-body {
            padding: 15px;
          }
          .card {
            box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
          }

          .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: .25rem;
          }

          .card-body {
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1rem;
          }

          .gutters-sm {
            margin-right: -8px;
            margin-left: -8px;
          }

          .gutters-sm>.col, .gutters-sm>[class*=col-] {
            padding-right: 8px;
            padding-left: 8px;
          }
          .mb-3, .my-3 {
            margin-bottom: 1rem!important;
          }

          .bg-gray-300 {
            background-color: #e2e8f0;
          }
          .h-100 {
            height: 100%!important;
          }
          .shadow-none {
            box-shadow: none!important;
          }
        </style>
      <%--        bootstrap file input--%>
      <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>

  <jsp:attribute name="js">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--        Bootstrap file input--%>
    <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
        <script>
          $('#InputAvatar').fileinput({
            theme: 'fa',
            language: 'vi',
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg','png']
          });
        </script>
    </jsp:attribute>
  <jsp:body>

    <div class="main-body">
      <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
          <div class="card">
            <div class="card-body">
              <div class="d-flex flex-column align-items-center text-center">
                  <%--                                    https://bootdey.com/img/Content/avatar/avatar7.png--%>
                <img src="${pageContext.request.contextPath}/public/img/Avatar/${User.id}/userAvatar.jpg" onerror="this.src='${pageContext.request.contextPath}/public/img/Avatar/user.jpg'" alt="${User.username}" class="rounded-circle" width="150" height="150">
                <div class="mt-3">
                  <h4>${User.firstname} ${User.lastname}</h4>
                </div>
              </div>
            </div>
          </div>
          <div class="card mt-3">
            <ul class="list-group list-group-flush">
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe mr-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
                <span class="text-secondary">https://ute.com</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                <span class="text-secondary">utex</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter mr-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                <span class="text-secondary">utex</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                <span class="text-secondary">utex</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                <span class="text-secondary">utex</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Full Name</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    ${User.firstname} ${User.lastname}
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Email</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    ${User.email}
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Phone</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    ${User.phone}
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Mobile</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    ${User.phone}
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Address</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    ${User.address}
                </div>
              </div>
              <hr>
            </div>
          </div>

          <div class="row gutters-sm">
            <div class="col-sm-6 mb-3">
              <div class="card h-100">
                <div class="card-body">
                  <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Có ${likeEvaluation} lượt like</i></h6>
                  <small>Tỷ lệ Like <span class="text-danger">${percentLike}%</span></small>
                  <div class="progress mb-3" style="height: 5px">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: ${percentLike}%" aria-valuenow="${percentLike}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
                <div class="card-body">
                  <p>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse-like-history" aria-expanded="false" aria-controls="collapseExample">
                      View Like History
                    </button>
                  </p>
                  <div class="collapse" id="collapse-like-history">
                    <c:choose>
                      <c:when test="${listEvaluationHistory.size() == 0}">
                        <div class="card card-body">
                          Không có dữ liệu
                        </div>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="EvaluationHistory" items="${listEvaluationHistory}">
                          <c:if test="${EvaluationHistory.type == \"like\"}">
                            <div class="card card-body">
                              <span class="text-danger">${EvaluationHistory.firstname_assessor} ${EvaluationHistory.lastname_assessor}: </span>${EvaluationHistory.comment}
                            </div>
                          </c:if>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6 mb-3">
              <div class="card h-100">
                <div class="card-body">
                  <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Có ${dislikeEvaluation} lượt dislike</i></h6>
                  <small>Tỷ lệ Dislike <span class="text-danger">${percentDislike}%</span></small>
                  <div class="progress mb-3" style="height: 5px">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: ${percentDislike}%" aria-valuenow="${percentDislike}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
                <div class="card-body">
                  <p>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse-dislike-history" aria-expanded="false" aria-controls="collapseExample">
                      View Dislike History
                    </button>
                  </p>
                  <div class="collapse" id="collapse-dislike-history">
                    <c:choose>
                      <c:when test="${listEvaluationHistory.size() == 0}">
                        <div class="card card-body">
                          Không có dữ liệu
                        </div>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="EvaluationHistory" items="${listEvaluationHistory}">
                          <c:if test="${EvaluationHistory.type == \"dislike\"}">
                            <div class="card card-body">
                              <span class="text-danger">${EvaluationHistory.firstname_assessor} ${EvaluationHistory.lastname_assessor}: </span>${EvaluationHistory.comment}
                            </div>
                          </c:if>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Home"
         role="button">
        <i class="fa fa-backward" aria-hidden="true"></i>
        Back
      </a>
    </div>

  </jsp:body>
</t:main>