<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty admin}">
        <jsp:include page="layout-head.jsp"/>

        <body id="page-top">

        <jsp:include page="layout-nav.jsp"/>
        <div id="content-wrapper">
        <div class="container-fluid mb-5">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Statistic</li>
            </ol>
                        <div class="col-md-12">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar"></i>
                                    Number of registrations by month
                                </div>
                                <div class="card-body">
                                    <canvas id="myBarChart" width="100%" height="30"></canvas>
                                </div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>




                </div>

        </div>

        <!-- /.container-fluid -->

        <jsp:include page="layout-footer.jsp"/>
        <script src="${pageContext.request.contextPath}/admin-util/js/demo/chart-area-demo.js"></script>
            <%--<script src="${pageContext.request.contextPath}/admin-util/js/demo/chart-bar-demo.js"></script>--%>
        <script src="${pageContext.request.contextPath}/admin-util/js/demo/chart-pie-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/chart.js"></script>
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