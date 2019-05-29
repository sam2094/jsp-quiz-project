<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${empty user && empty admin && empty moderator}">
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <%--<%--%>
                <%--response.setHeader("Cache-Control", "no-cache");--%>
                <%--response.setHeader("Pragma", "no-cache");--%>
                <%--response.setDateHeader("Expires", 0);--%>
                <%--response.setDateHeader("max-age", 0);--%>
            <%--%>--%>
            <meta http-equiv='cache-control' content='no-cache'>
            <meta http-equiv='expires' content='0'>
            <meta http-equiv='pragma' content='no-cache'>

            <title>SB Admin - Login</title>

            <!-- Bootstrap core CSS-->
            <link href="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

            <!-- Custom fonts for this template-->
            <link href="${pageContext.request.contextPath}/admin-util/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

            <!-- Custom styles for this template-->
            <link href="${pageContext.request.contextPath}/admin-util/css/sb-admin.css" rel="stylesheet">
            <script type="text/javascript">
                // history.pushState(null,null,'login.jsp');
                // window.addEventListener('popstate',function (event) {
                //     history.pushState(null,null,'login.jsp');
                // })
                // if(performance.navigation.type > 1){
                //     location.reload(true);
                // }
                // window.history.pushState('', null, './');
                // $(window).on('popstate', function() {
                //     // history.pushState(null,null,'login.jsp');
                //     location.reload(true);
                // });
                // history.pushState(null, null, './');
                // window.addEventListener('popstate', function () {
                //     history.pushState(null, null, 'login.jsp');
                // });
                // window.onpageshow = function(event) {
                //     if (event.persisted) {
                //         window.location.reload()
                //     }
                // };
                // function changeHashOnLoad() {
                //     window.location.href += "#";
                //     setTimeout("changeHashAgain()", "50");
                // }
                //
                // function changeHashAgain() {
                //     window.location.href += "1";
                // }
                //
                // var storedHash = window.location.hash;
                // window.setInterval(function () {
                //     if (window.location.hash != storedHash) {
                //         window.location.hash = storedHash;
                //     }
                // }, 50);
                // window.history.forward(1);

                // window.location.hash="Again-no-back-button";//for google chrome
                // window.onhashchange=function(){window.onload;}
                // history.pushState(null, null, $(location).attr('href'));
                // window.addEventListener('popstate', function () {
                //     history.pushState(null, null, $(location).attr('href'));
                // });

                history.pushState(null, null, document.URL);
                window.addEventListener('popstate', function () {
                    history.pushState(null, null, document.URL);
                });
            </script>
        </head>

        <body class="bg-dark">

        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="login" method="post">
                        <div class="form-group">
                            <div class="form-label-group">
                                <input name="username" type="text" id="inputUsername" class="form-control" placeholder="Username" required="required" autofocus="autofocus">
                                <label for="inputUsername">Username</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" name="password">
                                <label for="inputPassword">Password</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me">
                                    Remember Password
                                </label>
                            </div>
                        </div>

                        <c:if test="${not empty invalid}">
                            <div class="alert alert-danger" role="alert">
                                <c:out value="${invalid}"/>
                            </div>
                        </c:if>

                        <input type="submit" class="btn btn-primary btn-block" value="Login">
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="admin-panel/register.jsp">Register an Account</a>
                        <a class="d-block small" href="admin-panel/forgot-password.jsp">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/admin-util/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/admin-util/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/chart.js"></script>
        </body>

        </html>

    </c:when>
    <c:when test="${not empty user}">
        <c:redirect url="index.jsp"/>
        <%--<script>--%>
            <%--history.go(-1);--%>
        <%--</script>--%>
    </c:when>
    <c:when test="${not empty admin}">
        <c:redirect url="/admin-panel/"/>
        <%--<script>--%>
            <%--history.go(-2);--%>
        <%--</script>--%>
    </c:when>
    <c:otherwise>
            <c:redirect url="admin-panel/index.jsp"/>
    </c:otherwise>
</c:choose>

