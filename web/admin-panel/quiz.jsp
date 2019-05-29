<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty admin}">
        <jsp:include page="layout-head.jsp"/>

        <body id="page-top">

        <jsp:include page="layout-nav.jsp"/>
        <div class="container-fluid mb-5">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.jsp">Quiz</a>
                </li>
                <li class="breadcrumb-item active">Quiz List</li>
            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3" id="quizTable">

            </div>

            <p class="small text-center text-muted my-5">
                <em>More table examples coming soon...</em>
            </p>

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
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