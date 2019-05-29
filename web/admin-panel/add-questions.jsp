<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
    <c:when test="${not empty admin}">
        <jsp:include page="layout-head.jsp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
        <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">
        <body class="bg-dark" id="page-top">
        <jsp:include page="layout-nav.jsp"/>

        <div class="container">
            <div class="container-fluid mb-5 mt-3">
                <div class="card card-register mx-auto mt-5">
                    <div class="card-header">Add question</div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="quizSelectList">Quiz Number | Category Name</label>
                            <select class="form-control" id="quizSelectList" required>

                            </select>
                        </div>

                        <div class="form-group" class="addQuestion">
                            <div class="form-group">
                                <label>Question</label>
                                <textarea class="form-control rounded-0" placeholder="Question" rows="3"
                                          id="questionField"></textarea>
                            </div>
                        </div>
                        <div class="custom-file mb-3 form-group">
                            <input type="file" class="custom-file-input" id="questionImage" name="filename">
                            <label class="custom-file-label" for="questionImage">Choose file</label>
                        </div>
                        <div class="form-group addingAnswer">
                            <label>Answer/Type</label>
                            <div class="form-row">
                                <div class="col-md-9">
                                    <textarea class="form-control rounded-0" placeholder="Answer" rows="2"></textarea>
                                </div>
                                <div class="col-md-3">
                                    <select id="answerType" class="form-control">
                                        <option value="0" selected>False</option>
                                        <option value="1">True</option>
                                    </select>
                                </div>
                            </div>


                        </div>
                        <div class="form-group" id="addAnswerGroup">
                            <div class="form-label-group">
                                <button class="btn btn-info" id="addAnswer">Add answer</button>
                            </div>
                        </div>

                        <div class="form-group text-center">
                            <a class="btn btn-primary btn-block" id="registerQuestion">Add question</a>
                        </div>


                    </div>
                </div>
            </div>
                <jsp:include page="layout-footer.jsp"/>
            <script src="${pageContext.request.contextPath}/js/util.js"></script>
            <script src="${pageContext.request.contextPath}/js/questionsUtil.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
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