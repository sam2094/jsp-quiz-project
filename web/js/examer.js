$('#updatePassword').click(function () {
    var examerId = $('#changePassword').attr('data-id');
    var currentPassword = $('#currentPassword').val();
    var password = $('#inputPassword').val().trim();
    var confirmPassword = $('#confirmPassword').val().trim();
    var data = {
        examerId:examerId,
        currentPassword:currentPassword,
        password: password,
        confirmPassword:confirmPassword,
    };
    if(password == confirmPassword) {
        $.ajax({
            url: "es?action=changePassword",
            type: "POST",
            data: data,
            dataType: "text",
            success: function (data) {
                if (data == "error") {
                    $.alert("Uncorrect current password");
                } else if(data == "different") {
                    $.alert("Passwords are not equals");
                } else if (data == "success") {
                    new PNotify({
                        title: 'Success',
                        text: 'Password was changed successful!',
                        type: 'success',
                        icon:'fa fa-check'
                    });
                    $('#currentPassword').val('');
                    $('#inputPassword').val('');
                    $('#confirmPassword').val('');
                }
            }
        })
    } else  {
        $.alert("Passwords are not equals")
    }
});