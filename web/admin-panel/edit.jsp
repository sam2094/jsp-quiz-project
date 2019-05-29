<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/util/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/util/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin-util/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin-util/util/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin-util/util/css/main.css"/>
<div class="limiter">
    <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
        <form class="login100-form validate-form flex-sb flex-w" method="post">
            <span class="login100-form-title p-b-32">
                Admin Edit
            </span>

            <span class="txt1 p-b-11">
                User Name
            </span>
            <div class="wrap-input100 validate-input m-b-36" data-validate="Username is required">
                <input class="input100" type="text" name="Fullname" value="">
                <span class="focus-input100"></span>
            </div>

            <span class="txt1 p-b-11">
                Current Password
            </span>
            <div class="wrap-input100 validate-input m-b-12" data-validate="Password is required">
                <span class="btn-show-pass">
                    <i class="fa fa-eye"></i>
                </span>
                <input class="input100" type="password" name="CurrentPassword">
                <span class="focus-input100"></span>
            </div>

            <span class="txt1 p-b-11">
                New Password
            </span>
            <div class="wrap-input100 validate-input m-b-12" data-validate="Password is required">
                <span class="btn-show-pass">
                    <i class="fa fa-eye"></i>
                </span>
                <input class="input100" type="password" name="Password">
                <span class="focus-input100"></span>
            </div>

            <span class="txt1 p-b-11">
                Confirm Password
            </span>
            <div class="wrap-input100 validate-input m-b-12" data-validate="Password is required">
                <span class="btn-show-pass">
                    <i class="fa fa-eye"></i>
                </span>
                <input class="input100" type="password" name="ConfirmPassword">
                <span class="focus-input100"></span>
            </div>

            <div class="flex-sb-m w-full p-b-48">
                <div>
                    <a href="#" class="txt3">
                    </a>
                </div>
            </div>
            <div class="container-login100-form-btn">
                <button class="login100-form-btn" type="submit">
                    Edit
                </button>
            </div>
        </form>
        <br/>
        <br/>

        <div class="alert alert-warning" style="height:20px; background-color:transparent; border-color:transparent;">
            <h4>Error</h4>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>
<script src="${pageContext.request.contextPath}/admin-util/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/countdowntime/countdowntime.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/util/js/main.js"></script>
</c:when>
<c:when test="${not empty user}">
    <c:redirect url="../index.jsp"/>
</c:when>
<c:otherwise>
    <c:redirect url="../login.jsp"/>
</c:otherwise>

</c:choose>