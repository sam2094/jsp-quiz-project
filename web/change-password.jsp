<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty user}">
        <html>
        <head>
            <title>Index</title>
            <link href="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/admin-util/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.css"
                  rel="stylesheet">
                <%--<link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">--%>
            <link href="${pageContext.request.contextPath}/admin-util/css/sb-admin.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" >
            <link href="${pageContext.request.contextPath}/admin-util/pnotify/pnotify.custom.css" rel="stylesheet">

        </head>
        <body class="quiz-background">
        <jsp:include page="WEB-INF/pages/examer/layout-nav.jsp"/>
        <div class="container-fluid">
            <div class="card card-register mx-auto mt-5 mb-2">
                <div class="card-header">Change password</div>
                <div class="card-body">
                    <form id="changePasswordForm">
                        <div class="form-group">
                            <div class="form-label-group pass_show">
                                <input type="password" id="currentPassword" class="form-control" placeholder="Current password"
                                       required>
                                <label for="currentPassword">Current password</label>
                            </div>
                            <span toggle="#currentPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group pass_show">
                                <input type="password" id="inputPassword" class="form-control" placeholder="Password"
                                       required>
                                <label for="inputPassword">Password</label>
                            </div>
                            <span toggle="#inputPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group pass_show">
                                <input type="password" id="confirmPassword" class="form-control"
                                       placeholder="Confirm password" required>
                                <label for="confirmPassword">Confirm password</label>
                            </div>
                            <span toggle="#confirmPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <a class="btn btn-primary btn-block" id="updatePassword">Submit</a>

                    </form>

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
        <script src="${pageContext.request.contextPath}/admin-util/pnotify/pnotify.custom.js"></script>
        <script src="admin-util/vendor/bootstrap/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/examer.js"></script>
        <script src="${pageContext.request.contextPath}/js/mainUtils.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
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