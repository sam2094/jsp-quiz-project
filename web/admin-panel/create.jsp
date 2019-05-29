<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="layout-head.jsp"/>

<body>
<jsp:include page="layout-nav.jsp"/>
<div class="container-fluid">
    <div class="limiter">
        <div class="container-login100">
            <div style="width:1100px" class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
                <form class="login100-form validate-form flex-sb flex-w" method="post" enctype="multipart/form-data">
                    <span class="login100-form-title p-b-32">
                        Add News
                    </span>

                    <span class="txt1 p-b-11">
                        Title
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="Title is required">
                        <input class="input100" type="text" name="Title">
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        Content
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="Content is required">
                        <textarea style="height:350px" class="input100" type="text" name="Content"></textarea>
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        First Content
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="First Content is required">
                        <textarea style="height:350px" class="input100" type="text" name="First_Content"></textarea>
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        Second Content
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="Second Content is required">
                        <textarea style="height:350px" class="input100" type="text" name="Second_Content"></textarea>
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        State
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="State is required">
                        <input class="input100" type="text" name="States">
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        Date
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="Date is required">
                        <input class="input100" type="date" name="Dates">
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        Category
                    </span>
                    <div class="wrap-input100 validate-input m-b-36" data-validate="Category is required">
                        <select class="input100" type="text" name="Category">
                            <option value=""></option>
                        </select>
                        <span class="focus-input100"></span>
                    </div>

                    <span class="txt1 p-b-11">
                        Image
                    </span>
                    <div class="wrap-input100 validate-input m-b-12" data-validate="Image is required">
                        <span class="btn-show-pass">
                        </span>
                        <input class=" input100" type="file" name="Image" style="height:27px; padding:0px">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="container-login100-form-btn" style="margin-top:25px">
                        <button class="login100-form-btn">
                            Add News
                        </button>
                    </div>
                </form>
                <br/>
                <br/>

                <div class="alert alert-warning"
                     style="height:20px; background-color:transparent;border-color:transparent">
                    <h2>Error</h2>
                </div>
            </div>
        </div>
    </div>

    <div id="dropDownSelect1"></div>


    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/admin-util/util/images/icons/favicon.ico"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/util/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/util/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin-util/util/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin-util/util/css/main.css">
    <script src="${pageContext.request.contextPath}/admin-util/vendor/animsition/js/animsition.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/vendor/select2/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/vendor/countdowntime/countdowntime.js"></script>
    <script src="${pageContext.request.contextPath}/admin-util/util/js/main.js"></script>
    <jsp:include page="layout-footer.jsp"/>
</body>

</html>