<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="answerList" tabindex="-1" role="dialog" aria-labelledby="answerListLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="answerListModal">Answer List</h5>
                <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <%--<c:forEach items="questionById" var="questionById">--%>
                            <%--<label for="quiz-name" class="col-form-label">Quiz name:</label>--%>
                            <%--<input type="text" class="form-control" id="quiz-name" value="${questionById.quiz.content}">--%>
                        <%--</c:forEach>--%>

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