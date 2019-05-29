var fileName;

$(".custom-file-input").on("change", function () {
    fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

$(function () {
    $('#addAnswer').click(function () {
        var result = true;
        $('.addingAnswer textarea').each(function () {
            if ($(this).val().trim() == '') {
                result = false;
                $(this).val('');
            }
        });
        if (result) {
            addAnswerField();
        } else {
            $.alert("Please fill answer field and after you can add a new answer");
        }
    })


    var saving_question = 0;
    $('#registerQuestion').click(function () {
        if (saving_question == 0) {
            saving_question = 1;
            var trueAnswerCount = 0;
            var tasks = {};
            tasks.answerList = [];
            tasks.trueAnswer = [];
            var result = true;
            $('.addingAnswer textarea').each(function () {
                if ($(this).val().trim() == '') {
                    result = false;
                    $(this).val('');
                }
            });
            if (!result) {
                $.alert("Please fill all answer fields!!!");
                saving_question = 0;
            } else {
                if ($('#questionField').val().trim() == '') {
                    saving_question = 0;
                    $.alert("Please fill question field!!!");
                } else {
                    tasks.question = $('#questionField').val();
                    $('.addingAnswer textarea').each(function () {
                        tasks.answerList.push($(this).val());
                    });
                    $('.addingAnswer select').each(function () {
                        tasks.trueAnswer.push($(this).val());
                        if ($(this).val() == 1) {
                            trueAnswerCount++;
                        }
                    })
                    if ($('#quizSelectList').val() != null) {
                        tasks.quizId = $('#quizSelectList').val();
                        if (tasks.answerList.length > 2) {
                            if (trueAnswerCount > 0) {
                                var data = uploadImage('questionImage');
                                var result = data.result;
                                var imagePath = data.imagePath;
                                tasks.imagePath = imagePath;
                                if (result || imagePath == 0) {
                                    if (imagePath == 0) {
                                        tasks.imagePath = null;
                                    }
                                    $.ajax({
                                        url: "http://localhost:8080/quiz/qz?action=addQuestionForQuiz",
                                        type: "POST",
                                        data: tasks,
                                        dataType: 'text',
                                        success: function (data) {
                                            $.alert("Question added successfully");
                                            $('#quizSelectList').val(null);
                                            $('#questionField').val('');
                                            $('#questionImage').val('');
                                            fileName = '';
                                            $(".custom-file-input").siblings(".custom-file-label").removeClass("selected").html(fileName);
                                            $('.addingAnswer').each(function () {
                                                $(this).remove();
                                            });
                                            addAnswerField();
                                            saving_question = 0;
                                        }
                                    })
                                } else {
                                    saving_question = 0;
                                }
                            } else {

                                $.alert("Please select true answer for your question!!! ")
                                saving_question = 0;
                            }
                        } else {

                            $.alert("3 a minimum number for answers count!!!")
                            saving_question = 0;
                        }
                    } else {
                        $.alert("Please select Quiz number!");
                        saving_question = 0;
                    }
                }
            }
        }
        else {
        }
    })

    var quizId = location.search.split('quizId=')[1];
    if (quizId != null) {
        quizSelectList(quizId);
    } else {
        quizSelectList();
    }
})

function quizSelectList(id) {
    $.ajax({
        url: "http://localhost:8080/quiz/qz?action=getQuizSelectList",
        type: 'GET',
        dataType: 'html',
        success: function (data) {
            $('#quizSelectList').html(data);
            $('#quizSelectList').val(id).attr('selected', true);
        }
    })
}

function addAnswerField() {
    $('#addAnswerGroup').before('       <div class="form-group addingAnswer">\n' +
        '                                  <label >Answer/Type</label>\n' +
        '                                <div class="form-row">\n' +
        '                                    <div class="col-md-9">\n' +
        '                                        <textarea class="form-control rounded-0"  placeholder="Answer" rows="2"></textarea>\n' +
        '                                    </div>\n' +
        '                                    <div class="col-md-3">\n' +
        '                                        <select class="form-control">\n' +
        '                                            <option value="0" selected>False</option>\n' +
        '                                            <option value="1">True</option>\n' +
        '                                        </select>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '\n' +
        '\n' +
        '                            </div>');
}

function getAnswerList(questionId) {
    $.ajax({
        url: "http://localhost:8080/quiz/qz?action=getQuestionById",
        type: "GET",
        data: "questionId=" + questionId,
        dataType: "text"
    });
    console.log(questionId);
    console.log("ql");
}