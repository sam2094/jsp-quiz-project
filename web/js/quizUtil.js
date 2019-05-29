$(function () {
    $('#quizSelectList').change(function () {
        var quizId = $('#quizSelectList').val();
        $.ajax({
            url:'http://localhost:8080/quiz/qz?action=getQuestionListByQuiz',
            type:'GET',
            data:'quizId='+quizId,
            dataType:'text',
            success:function (data) {
                $('#questionTable').html(data);
            }
        })
    })
})