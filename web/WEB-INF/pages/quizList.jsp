<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card-header">
    <div class="col-xl-3 col-sm-6 mb-3"><i class="fas fa-table"></i>
        Quiz List</div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#quizModal" onclick="addQuizBtn()">Add Quiz</button>
    </div>

</div>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Quiz Name</th>
                <th>Category Name</th>
                <th>Moderator Name</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="quizList" items="${quizList}">
                <tr>
                    <td>${quizList.name}</td>
                    <td>${quizList.quizCategory.name}</td>
                    <td>${quizList.moderatorName}</td>
                    <td>${quizList.status}</td>
                    <td><div class="btn-group">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Action
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button"  data-toggle="modal" data-target="#quizModal" onclick="editQuiz(${quizList.id},'${quizList.name}',${quizList.moderatorId},${quizList.quizCategory.id})">Edit</button>
                            <c:if test="${quizList.status.equals('Active')}">
                                <button class="dropdown-item" type="button" onclick="deleteQuiz(${quizList.id})">Delete</button>
                            </c:if>
                            <c:if test="${quizList.status.equals('Deleted')}">
                            <button class="dropdown-item" type="button" onclick="restoreQuiz(${quizList.id})">Restore</button>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/admin-panel/add-questions.jsp?quizId=${quizList.id}" class="dropdown-item btn" onclick="quizSelectList(${quizList.id})">Add questions</a>
                        </div>
                    </div></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>


<div class="modal fade" id="quizModal" tabindex="-1" role="dialog" aria-labelledby="quizModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="quizModalLabel">New message</h5>
                <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="quiz-name" class="col-form-label">Quiz name:</label>
                        <input type="text" class="form-control" id="quiz-name">
                    </div>
                    <div class="form-group">
                        <label for="categorySelect">Category Name</label>
                        <select class="form-control" id="categorySelect" required>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="moderatorSelect">Moderator Name</label>
                        <select class="form-control" id="moderatorSelect" required>

                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary saveQuiz">Save</button>
            </div>
        </div>
    </div>
</div>

<link href="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/admin-util/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/js/demo/datatables-demo.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/js/quiz.js"></script>
<script src="${pageContext.request.contextPath}/js/questionsUtil.js"></script>