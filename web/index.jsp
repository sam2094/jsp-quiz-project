<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
  <c:when test="${not empty user}">
<html>
  <head>
    <title>Index</title>
    <link href="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin-util/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.css"
          rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">--%>
    <link href="${pageContext.request.contextPath}/admin-util/css/sb-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin-util/css/flipclock.css" rel="stylesheet">
    <script>
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });

    </script>

  </head>
  <body class="quiz-background" id="preloader">
  <jsp:include page="WEB-INF/pages/examer/layout-nav.jsp"/>
  <div class="container-fluid" id="loader">
    <div class="row mt-3 d-none" id="quizContent">
        <div class="col-md-12 text-center">
            <button id="startQuiz" class="btn btn-danger d-none">Start Quiz</button>
        </div>
    </div>
  </div>
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session, but you didn't complete your test.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/admin-util/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/admin-util/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="admin-util/vendor/bootstrap/js/bootstrap.js"></script>
  <script src="js/studentQuiz.js"></script>
  <script src="${pageContext.request.contextPath}/admin-util/js/flipclock.js"></script>
  <script src="${pageContext.request.contextPath}/js/index-page.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  </body>
</html>
  </c:when>
  <c:when test="${not empty admin}">
    <c:redirect url="admin-panel/index.jsp"/>
  </c:when>
  <c:otherwise>
    <c:redirect url="login.jsp"/>
  </c:otherwise>
</c:choose>