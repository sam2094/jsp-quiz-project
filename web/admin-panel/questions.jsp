<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty admin}">
        <jsp:include page="layout-head.jsp"/>
        <body id="page-top">
        <jsp:include page="layout-nav.jsp"/>
            <%--use without ajax, just jsp--%>
            <%--<jsp:useBean id="userList" class="quiz.dao.implement.UserDaoImplement" scope="request" ></jsp:useBean>--%>
            <%--<% List<User> ul = userList.getUserList();%>--%>
        <div class="container-fluid mb-5 mt-3">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Quiz | Admin Panel</a>
                </li>
                <li class="breadcrumb-item active">Questions's List</li>
            </ol>

                <ul class="nav flex-column">
                    <li class="nav-item mb-3">
                            <span>Select Quiz Number | Category Name</span></a>
                    </li>
                    <li class="nav-item">

                        <select class="form-control col-sm-4 mb-4" id="quizSelectList" required>

                        </select>

                    </li>

                </ul>


            <!-- DataTables Example -->
            <div class="card mb-3" id="questionTable">
            </div>
            <p class="small text-center text-muted my-5">
                <em></em>
            </p>
        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <jsp:include page="layout-footer.jsp"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/questionsUtil.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/quizUtil.js"></script>
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