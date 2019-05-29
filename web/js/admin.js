$(function () {
    getUserTypesList();
    getModeratorList();
    $('#registerUser').click(function () {
        var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var password = $('#inputPassword').val();
        var username = $('#inputUsername').val();
        var confirmPassword = $('#confirmPassword').val();
        var userType = $('#userTypeSelect').val();
        if($('#userTypeSelect').val() == 3) {
            var moderatorId = $('#moderatorSelect').val();
        } else {
            var moderatorId = 0;
        }
        var data = {
            firstName:firstName,
            lastName:lastName,
            password:password,
            moderatorId:moderatorId,
            userType:userType,
            username:username
        };
        var checkedFields = checkFields(firstName,lastName,username,password,confirmPassword,moderatorId);
        if (checkedFields && confirmPassword == password){
                $.ajax({
                    url: 'http://localhost:8080/quiz/cs?action=addUser',
                    type: 'POST',
                    data: data,
                    dataType: 'text',
                    success: function (data) {
                        alert("User added successfully");
                        emptyAddedUserFields();
                    },
                    error: function () {
                        alert("ERROR");
                    }

                })

        }
        else {
            alert("Passwords don`t equals");
        }
    })
    $('#inputUsername').keyup(function () {
        var username = $('#inputUsername').val();
        var data = {
            username:username
        };
        $.ajax({
            url:'http://localhost:8080/quiz/cs?action=checkUsername',
            type:'GET',
            data:data,
            dataType:'text',
            success:function(response){
                if ($('#inputUsername').val() != "") {
                    if (response == "1") {
                        $('#inputUsername').removeClass().addClass('is-invalid form-control');
                        $('#validUsername').removeClass().addClass('invalid-feedback').text("This username exist");
                    } else if (response == "0") {
                        $('#inputUsername').removeClass().addClass('is-valid form-control');
                        $('#validUsername').removeClass().addClass('valid-feedback').text("This username does not exist").show();
                    }
                } else{
                    $('#validUsername').removeClass().empty();
                    $('#inputUsername').removeClass().addClass('form-control');
                }
            }
        })
    });
    getQuizList();
});
function getModeratorList(quizModeratorId){
    $.ajax({
        url:'http://localhost:8080/quiz/cs?action=getModeratorList',
        type:'GET',
        dataType:'html',
        success:function (data) {
            $('#moderatorSelect').html(data);
            $('#moderatorSelect').val(quizModeratorId).attr('selected',true);
        }
    });

}
function addQuizBtn() {

    getModeratorList();
    $(".saveQuiz").removeAttr("id").attr("id","addQuiz");
    $('#quiz-name').val('');
    $("#quizModal #addQuiz").click(function () {
        var quizName = $('#quiz-name').val();
        var quizModeratorId = $('#moderatorSelect').val();
        var data = {
            quizName:quizName,
            quizModeratorId:quizModeratorId,
            quizCategoryId:1
        }
        addQuiz(data);
    });

};
function getQuizList() {
    $.ajax({
        url:"http://localhost:8080/quiz/cs?action=getQuizList",
        type:'GET',
        dataType:'html',
        success:function (data) {
            $('#quizTable').html(data);
        }
    })
}
function checkFields(firstName,lastName,username,password,confirmPassword,moderatorId){
    var result = true;
    if(firstName == ''){
        if(!$("div").is("#invalidFirstName")){
        $('[for="firstName"]').after('<div id="invalidFirstName" class="invalid-feedback"> ' +
            'First name is empty' +
            '</div>');
        $('#firstName').addClass("is-invalid"); }
        result = false;
    } else{
        $('#firstName').removeClass("is-invalid").addClass("is-valid");
        $('#invalidFirstName').remove();
    }
    if(lastName == ''){
        if(!$("div").is("#invalidLastName")){
        $('[for="lastName"]').after('<div id="invalidLastName" class="invalid-feedback"> ' +
            'Last name is empty' +
            '</div>');
        $('#lastName').addClass("is-invalid");}
        result = false;
    } else{
        $('#lastName').removeClass("is-invalid").addClass("is-valid");
        $('#invalidLastName').remove();
    }
    if(username == ''){
        if(!$("div").is("#invalidUsername")){
        $('[for="inputUsername"]').after('<div id="invalidUsername" class="invalid-feedback"> ' +
            'Username is empty' +
            '</div>');
        $('#inputUsername').addClass("is-invalid");}
        result = false;
    } else{
        $('#inputUsername').removeClass("is-invalid").addClass("is-valid");
        $('#invalidUsername').remove();
    }
    if(password == ''){
        if(!$("div").is("#invalidPassword")){
        $('[for="inputPassword"]').after('<div id="invalidPassword" class="invalid-feedback"> ' +
            'Password is empty' +
            '</div>');
        $('#inputPassword').addClass("is-invalid");}
        result = false;
    } else{
        $('#inputPassword').removeClass("is-invalid").addClass("is-valid");
        $('#invalidPassword').remove();
    }
    if(confirmPassword == ''){
        if(!$("div").is("#invalidConfirmPassword")){
        $('[for="confirmPassword"]').after('<div id="invalidConfirmPassword" class="invalid-feedback"> ' +
            'Password is empty' +
            '</div>');
        $('#confirmPassword').addClass("is-invalid");}
        result = false;
    } else{
        $('#confirmPassword').removeClass("is-invalid").addClass("is-valid");
        $('#invalidConfirmPassword').remove();
    }
    if(!$('option').is('#moderatorSelect')){
    if(moderatorId == null){
        if(!$("div").is("#invalidModerator")){
        $('[id="moderatorSelect"]').after('<div id="invalidModerator" class="invalid-feedback"> ' +
            'Please select moderator' +
            '</div>');
        $('#moderatorSelect').addClass("is-invalid");}
        result = false;
    } else{
        $('#moderatorSelect').removeClass("is-invalid").addClass("is-valid");
        $('#invalidModerator').remove();
    }
    }
    return result;
};
$(".toggle-password").click(function() {

    $(this).toggleClass("fa-eye fa-eye-slash");
    var input = $($(this).attr("toggle"));
    if (input.attr("type") == "password") {
        input.attr("type", "text");
    } else {
        input.attr("type", "password");
    }
});

function deleteQuiz(quizId) {
    $.confirm({
        title: 'Delete Quiz',
        content: 'Are you sure?',
        buttons: {
            confirm: function () {
                deleteQuizById();
            },
            cancel: function () {

            },
        }
    });
    function deleteQuizById(){
        $.ajax({
            url:"http://localhost:8080/quiz/cs?action=deleteQuiz",
            type:"POST",
            data:"quizId="+quizId,
            dataType:'text',
            success:function (response) {
                if(response == "success") {
                    alert("Quiz successful deleted ");
                    getQuizList();
                }
            }
        })
    }
}
function restoreQuiz(quizId) {
    $.confirm({
        title: 'Restore Quiz',
        content: 'Are you sure?',
        buttons: {
            confirm: function () {
                restoreQuizById();
            },
            cancel: function () {

            },
        }
    });
    function restoreQuizById(){
        $.ajax({
            url:"http://localhost:8080/quiz/cs?action=restoreQuiz",
            type:"POST",
            data:"quizId="+quizId,
            dataType:'text',
            success:function (response) {
                if(response == "success") {
                    alert("Quiz successful restored ");
                    getQuizList();
                }
            }
        })
    }


}
function editQuiz(quizId,quizName,quizModeratorId,quizCategoryId) {
    $('#quiz-name').val(quizName);
    getModeratorList(quizModeratorId);
    $(".saveQuiz").removeAttr("id").attr("id","updateQuiz");

    $("#quizModal #updateQuiz").click(function () {
        var quizName = $('#quiz-name').val();
        var quizModeratorId = $('#moderatorSelect').val();
        var data = {
            quizId:quizId,
            quizName:quizName,
            quizModeratorId:quizModeratorId,
            quizCategoryId:quizCategoryId
        }
        updateQuiz(data);
    });

}
function updateQuiz(data) {

    $.ajax({
        url:"http://localhost:8080/quiz/cs?action=updateQuiz",
        type:"POST",
        data:data,
        dataType:'text',
        success:function (data) {
            $.alert("Quiz updated successfully");
            getQuizList();
            $('#closeModal').attr("data-dismiss","modal");
            $('#closeModal').click();
        },
        error:function () {
           $.alert("You have error!");
        }

    })
}
function addQuiz(data) {
    $.ajax({
        url:"http://localhost:8080/quiz/cs?action=addQuiz",
        type:"POST",
        data:data,
        dataType:'text',
        success:function (data) {
            $.alert("Quiz added successfully");
            getQuizList();
            $('#closeModal').attr("data-dismiss","modal");
            $('#closeModal').click();
        },
        error:function () {
            $.alert("You have error!");
        }

    })
}

var quizIdForAddQuestion = null;
function quizIdForAddQuestions(quizId){
    quizIdForAddQuestion = quizId;
    // $.ajax({
    //     url:"http://localhost:8080/quiz/cs?action=updateQuiz"
    // })
}
var count = 1;
$('#inputClick').click(function () {

    var input = document.createElement('INPUT');
    input.type = 'text';
    input.setAttribute("class", "inputClass");
    input.name = "value[]";
    document.querySelector('#divInput').appendChild(input);
    count++;
})
$('#outputClick').click(function () {
    // var data = [];
    // while($(".inputClass")!=null){
    //     data.push($(".inputClass").val());
    // }
    // console.log($("#divInput .inputClass").serializeArray())  работает
    var tasks = {};
    tasks.quizList = [];
    tasks.trueAnswers = [];
    tasks.falseAnswers = [];
    $('.inputClass').each(function(){
        tasks.quizList.push($(this).val());
    });
    $.ajax({
    url:"http://localhost:8080/quiz/cs?action=testQuiz",
        type:"POST",
        data:tasks,
        dataType:'text'
    })
    console.log(tasks)
})
$(function () {
    if($('#quizModal').hasClass('show')){
        console.log("something")
    }
})

// $('#quizModal').on('hidden.bs.modal', function (e) {
//
// })
$(function () {
    getUserList();
})

function getUserList() {
    $.ajax({
        url: 'http://localhost:8080/quiz/cs?action=getUserList',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
            $('#userTable').html(data);
        },
        error: function (data) {
            $.alert('Error in user list get process');
        }
    });
};

function deleteUser(userId) {
    var userId = userId;
    var data = {
        userId: userId
    };
    $.confirm({
        title: 'Warning',
        content: 'Are you sure you want to delete the user ?',
        buttons: {
            confirm: function () {
                $.ajax({
                    url: 'http://localhost:8080/quiz/cs?action=deleteUser',
                    type: 'POST',
                    data: data,
                    dataType: 'text',
                    success: function () {
                        $.alert('User successfully deleted');
                        getUserList();
                    },
                    error: function () {
                        $.alert('Action error');
                    }

                });
            },
            cancel: function () {
            }
        }
    });
}

function restoreUser(userId) {
    var userId = userId;
    var data = {
        userId: userId
    };
    $.confirm({
        title: 'Warning',
        content: 'Are you sure you want to restore the user ?',
        buttons: {
            confirm: function () {
                $.ajax({
                    url: 'http://localhost:8080/quiz/cs?action=restoreUser',
                    type: 'POST',
                    data: data,
                    dataType: 'text',
                    success: function () {
                        $.alert('User successfully restored');
                        getUserList();
                    },
                    error: function () {
                        $.alert('Action error');
                    }

                });
            },
            cancel: function () {
            }
        }
    });
};

function fillUserValue(userId, userName, userSurname, userUsername, userTypeId) {
    $('#userName').val(userName);
    $('#userSurname').val(userSurname);
    $('#userUsername').val(userUsername);
    getUserTypesList(userTypeId);
    $("#updateUser").click(function () {
        updateUser(userId);
    });

}


function getUserTypesList(userTypeId) {
    $.ajax({
        url: 'http://localhost:8080/quiz/cs?action=getTypesList',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
            $('#userTypeSelect').html(data);
            $('#userTypeSelect').val(userTypeId).attr("selected", true);
        },
        error: function (data) {
            $.alert('Error in user types list get process');
        }
    });

}

function updateUser(userId) {
    console.log("s");
    var id = userId;
    var name = $('#userName').val();
    var surname = $('#userSurname').val();
    var username = $('#userUsername').val();
    var typeId = $('#userTypeSelect').val();

    var isChecked = checkFieldsForUserUpdate(name,surname,username);

    if(isChecked){
        var data = {
            userId: id,
            userName: name,
            userSurname: surname,
            userUsername: username,
            userTypeId: typeId
        };

        $.ajax({
            url: 'http://localhost:8080/quiz/cs?action=updateUser',
            type: 'POST',
            data: data,
            dataType: 'text',
            success: function () {
                $.alert('User successfully updated');
                getUserList();
                $('#closeExampleModal').attr("data-dismiss", "modal");
                $("#closeExampleModal").click();

            },
            error: function () {
                $.alert('Error');
            }
        });
    }
}

function checkFieldsForUserUpdate(userName, userSurname, userUsername) {
    var result = true;
    if (userName.trim() == '') {
        if (!$("div").is("#invalidUserName")) {
            $('[id="userName"]').after('<div id="invalidUserName" class="invalid-feedback"> ' +
                'User name is empty' +
                '</div>');
            $('#userName').addClass("is-invalid");
            $('#invalidUserName').show();
        }
        result = false;
    } else {
        $('#userName').removeClass("is-invalid").addClass("is-valid");
        $('#invalidUserName').remove();
    }
    if (userSurname.trim() == '') {
        if (!$("div").is("#invalidSurname")) {
            $('[id="userSurname"]').after('<div id="invalidSurname" class="invalid-feedback"> ' +
                'User surname is empty' +
                '</div>');
            $('#userSurname').addClass("is-invalid");
        }
        result = false;
    } else {
        $('#userSurname').removeClass("is-invalid").addClass("is-valid");
        $('#invalidSurname').remove();
    }
    if (userUsername.trim() == '') {
        if (!$("div").is("#invalidUsername")) {
            $('[id="userUsername"]').after('<div id="invalidUsername" class="invalid-feedback"> ' +
                'Username is empty' +
                '</div>');
            $('#userUsername').addClass("is-invalid");
            $('#invalidUsername').show();
        }
        result = false;
    } else {
        $('#userUsername').removeClass("is-invalid").addClass("is-valid");
        $('#invalidUsername').remove();
        $('#invalidUsername').hide();
    }
    return result;
};
$(function () {
    $('#userRegistration #userTypeSelect').change(function () {

        if($('#userTypeSelect').val() == 3){
            if(!$('select').is('#moderatorSelect')){
                $('[id="moderatorSelectDiv"]').html('<label for="moderatorSelect">Moderator Name</label>  <select class="form-control" id="moderatorSelect" required> </select>');
                getModeratorList();
            }

        } else{
                $('[id="moderatorSelectDiv"]').empty();
        }
    })
})
function emptyAddedUserFields(){
    $('#firstName').val('');
    $('#lastName').val('');
    $('#inputPassword').val('');
    $('#inputUsername').val('');
    $('#confirmPassword').val('');
    $('#userTypeSelect').val(null);
    if($('select').is('#moderatorSelect')){
        $('#moderatorSelect').val(null);
        $('#moderatorSelect').removeClass().addClass('form-control');
        $('#invalidModerator').remove();
        $('[id="moderatorSelectDiv"]').empty();
    }
        $('#firstName').removeClass().addClass('form-control');
        $('#invalidFirstName').remove();

        $('#lastName').removeClass().addClass('form-control');
        $('#invalidLastName').remove();

        $('#inputUsername').removeClass().addClass('form-control');
        $('#invalidUsername').remove();

        $('#inputPassword').removeClass().addClass('form-control');
        $('#invalidPassword').remove();
        $('#confirmPassword').removeClass().addClass('form-control');
        $('#invalidConfirmPassword').remove();


}
// history.pushState(null,null,'login.jsp');
// window.addEventListener('popstate',function (event) {
//     history.pushState(null,null,'login.jsp');
// })
// window.onpopstate = function (event) {
//     console.log(document.location);
//     console.log("s");
//    if (window.location.pathname=='/login.jsp'){
//         window.location.reload();
//     }
//     //     if(document.location == ''){
//     // window.location.reload();
//     // }
//     addEventListener("popstate",function(e){
//         alert('yeees!');
//     },true);
// }
// history.pushState(null, null, './');
// window.addEventListener('popstate', function () {
//     history.pushState(null, null, 'login.jsp');
// });
// window.onpageshow = function (event) {
//     if (event.persisted) {
//         window.location.reload();
//     }
// };
// function changeHashOnLoad() {
//     window.location.href += "#";
//     setTimeout("changeHashAgain()", "50");
// }
//
// function changeHashAgain() {
//     window.location.href += "1";
// }
//
// var storedHash = window.location.hash;
// window.setInterval(function () {
//     if (window.location.hash != storedHash) {
//         window.location.hash = storedHash;
//     }
// }, 50);
// window.history.forward(1);
// var storedHash = window.location.hash;
// function changeHashOnLoad() {
//     window.location.href += "#";
//     setTimeout("changeHashAgain()", "50");
// }
//
// function changeHashAgain() {
//     window.location.href += "1";
// }
//
// function restoreHash() {
//     if (window.location.hash != storedHash) {
//         window.location.hash = storedHash;
//     }
// }
//
// if (window.addEventListener) {
//     window.addEventListener("hashchange", function () {
//         restoreHash();
//     }, false);
// }
// else if (window.attachEvent) {
//     window.attachEvent("onhashchange", function () {
//         restoreHash();
//     });
// }
// $(window).load(function () { changeHashOnLoad(); });
// history.pushState(null, null, $(location).attr('href'));
// window.addEventListener('popstate', function () {
//     history.pushState(null, null, $(location).attr('href'));
// });