<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${not empty questionList}">
        <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">
        <div class="col-md-12 text-center">
            <h4 class="text-dark">Question ${questionId+1} of ${questionList.size()} in ${questionList.get(questionId).quiz.quizCategory.name} category</h4>
        </div>
        <div class="col-md-6">
            <ul class="list-group">
                <li class="list-group-item active ">
                    <h4 class="questionId" data-id="${questionList.get(questionId).id}"><span class="badge badge-success">${questionId+1}</span> ${questionList.get(questionId).content}</h4>
                </li>
                <% int count = 0;%>
                <c:forEach var="answers" items="${questionList.get(questionId).answerList}">
                    <li class="list-group-item">
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input question-answer" data-id="${answers.id}" id="${answers.id}">
                            <label class="form-check-label h5 ml-2" for="${answers.id}">${answers.content}</label>
                        </div>
                    </li>
                    <c:if test="${answers.trueAnswer == 1}">
                        <% count++;%>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-6">
            <c:if test="${empty questionList.get(questionId).answerList}">
                <img src="..." class="img-fluid" alt="Responsive image">
            </c:if>
        </div>
        <div class="col-md-3 mt-3">
            <h4>True answer count is <span class="badge badge-info"><%=count%></span></h4>
        </div>
        <div class="col-md-9 mt-3">
        </div>
        <c:if test="${questionId<questionList.size()-1}">
            <div class="col-md-3 mt-3">
                <button type="button" id="nextQuestion" class="btn btn-primary">
                    Next Question
                </button>
            </div>
        </c:if>
        <c:if test="${questionId==questionList.size()-1}">
            <div class="col-md-3 mt-3">
                <button type="button" id="submitQuiz" class="btn btn-primary" data-examer="${user.id}">
                    Submit
                </button>
            </div>
        </c:if>
        <script type="text/javascript">
            $('#nextQuestion').click(function () {
                data.answer = [];
                data.checkedAnswer = [];
                var checkedAnswerCount = 0;
                $('.question-answer:checked').each(function () {
                    checkedAnswerCount++;
                });
                if (checkedAnswerCount == 0 ){
                    $.alert("Please select answer");
                } else {
                    var qId = $('.questionId').attr("data-id");
                    $('li label').each(function () {
                        data.answer.push($(this).text());
                    })
                    $('.question-answer:checked').each(function () {
                        data.checkedAnswer.push($(this).attr("data-id"));
                    });
                    data.quiz.push(qId,data.checkedAnswer);

                    getQuestion(id);
                    id++;
                }

                console.log("++++" + data.quiz + "++" + data.checkedAnswer);
            })
            $('#submitQuiz').click(function () {
                clock.stop();
                data.answer = [];
                data.checkedAnswer = [];
                data.timer = date;
                var checkedAnswerCount = 0;
                $('.question-answer:checked').each(function () {
                    checkedAnswerCount++;
                });
                if (checkedAnswerCount == 0 ){
                    $.alert("Please select answer");
                } else {
                    var qId = $('.questionId').attr("data-id");
                    var examerId = $('#submitQuiz').attr("data-examer");
                    $('li label').each(function () {
                        data.answer.push($(this).text());
                    })
                    $('.question-answer:checked').each(function () {
                        data.checkedAnswer.push($(this).attr("data-id"));
                    });
                    data.quiz.push(qId,data.checkedAnswer);
                }
                data.examerId = examerId;
                $.ajax({
                    url:'qz?action=submitQuizByStudent',
                    type:'POST',
                    data:data,
                    dataType:'text',
                    success:function () {
                        $.alert({
                            title:"Information",
                            content:"You have successfully passed the test" ,
                            buttons:{
                                submit:{
                                    text: 'Submit',
                                    btnClass: 'btn-blue',
                                    action: function () {
                                        $(location).attr('href',"logout.jsp");
                                    }
                                }
                            }



                        })
                    }

                })
            })
        </script>
        <script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
    </c:when>
    <c:otherwise>
        <div class="col-md-12">
            <div class="alert alert-danger" role="alert">
                You already passed this quiz, please wait for new quiz.
            </div>
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
        </div>
    </c:otherwise>
</c:choose>
