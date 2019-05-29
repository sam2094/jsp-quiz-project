<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty admin}">
<jsp:include page="layout-head.jsp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<body class="bg-dark" id="page-top">
<jsp:include page="layout-nav.jsp"/>

<div class="container">
    <div class="container-fluid mb-5">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Register an Account</div>
        <div class="card-body">
            <form id="userRegistration">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <div class="form-label-group">
                                <input type="text" id="firstName" class="form-control" placeholder="First name"
                                       required autofocus="autofocus">
                                <label for="firstName">First name</label>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-label-group">
                                <input type="text" id="lastName" class="form-control" placeholder="Last name"
                                       required>
                                <label for="lastName">Last name</label>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input type="text" id="inputUsername" class="form-control" placeholder="Email address"
                               required>
                        <label for="inputUsername">Username</label>

                            <div id="validUsername">

                            </div>
                    </div>
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
                <div id="userTypesList111" class="form-group">
                    <label for="userTypeSelect" class="col-form-label">Type</label>
                    <select id="userTypeSelect" class="form-control">

                    </select>
                </div>
                <div class="form-group" id="moderatorSelectDiv">
                    <%--<label for="moderatorSelect">Moderator Name</label>--%>
                        <%--<select class="form-control" id="moderatorSelect" required>--%>

                        <%--</select>--%>
                </div>
                <a class="btn btn-primary btn-block" id="registerUser">Register</a>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="../login.jsp">Login Page</a>
                <a class="d-block small" href="forgot-password.jsp">Forgot Password?</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="layout-footer.jsp"/>
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
</c:when>
<c:when test="${not empty user}">
    <c:redirect url="../index.jsp"/>
</c:when>
<c:otherwise>
    <c:redirect url="../login.jsp"/>
</c:otherwise>

</c:choose>