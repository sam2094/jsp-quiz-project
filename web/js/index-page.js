var clock;
var timeStarted = null;
var date = null;

$(function () {
    examerId = $('#changePassword').attr('data-id');
    $('nav').addClass('d-none');
    setTimeout(function () {
        getQuestionForStudent(examerId);
        $('body').removeAttr("id");
        $('#loader').removeAttr("id");
        $('#quizContent').removeClass("d-none");
        $('nav').removeClass("d-none");
    },1500)
});

$('#startQuiz').click(function () {
    clock.start();
    getQuestion(0);
})