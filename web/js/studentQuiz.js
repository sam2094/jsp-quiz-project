
function getQuestionForStudent(userId) {
    console.log(userId)
    $.ajax({
    url:"qz?action=getQuizById",
    type:"POST",
    data:"userId="+userId,
    dataType:"text",
    success:function (data) {
        // $('#quizContent').html(data);
        if(data == 'success'){
            $("#startQuiz").removeClass("d-none");

            $('.container-fluid').prepend('<div class="row">\n' +
                '        <div class="col-md-12 text-center mt-2" >\n' +
                '          <div id="quizTimer"></div>\n' +
                '        </div>\n' +
                '      </div>');
            clock = $('#quizTimer').FlipClock({
                clockFace: 'MinuteCounter',
                autoStart:false,
                callbacks: {
                    start: function () {
                        timeStarted = new Date().getTime();
                    }
                    ,
                    stop: function () {
                        var timeStopped = new Date().getTime();
                        date = (timeStopped - timeStarted)/1000;
                        console.log("start = " + timeStarted);
                        console.log("end = " + timeStopped);
                        console.log("secs = " + date/1000);
                    }


                },

            });
        } else {
            getQuestion(0);
        }
    }
    })
}

var data = {};
data.quiz = [];
data.answer = [];
data.checkedAnswer = [];
var savingAnswer = 0;
var id = 1;
function getQuestion(questionId) {
    $.ajax({
        url:'qz?action=getQuestionById',
        type:'GET',
        data:'questionId='+questionId,
        dataType:'text',
        success:function (data) {
            $('#quizContent').html(data);
        }
    })
}
function getExamerInfo(examerId) {
    $.ajax({
        url:"es?action=editExamer",
        type:"POST",
        data:"examerId="+examerId,
        dataType:"text",
        success:function (data) {
            $('#editExamerForm').html(data);
        }
    });
}


