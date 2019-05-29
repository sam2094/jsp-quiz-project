var data = {};
data.imagePath = null;

function uploadImage(inputId) {
    data.result = true;
    data.imagePath = null;
    var file = $('#' + inputId).prop("files")[0];
    if (file===undefined) {
        data.imagePath = 0;
        data.result = false;
    } else {
        if (file.type == 'image/jpeg' || file.type == 'image/jpg' || file.type == 'image/png') {
            if (file.size <= 1024 * 1024 * 3) {
                var formData = new FormData();
                formData.append("file", file);
                $.ajax({
                    url: 'http://localhost:8080/quiz/uf',
                    type: 'POST',
                    data: formData,
                    cache: false,
                    async: false,
                    dataType: 'text',
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        if (response == 'error' || response == null) {
                            $.alert('Image download error');
                            data.result = false;
                        } else {
                            data.imagePath = response;
                        }
                    }
                });
            } else {
                $.alert('The maximum image size should not exceed 3 MB');
                data.result = false;
            }

        } else {
            $.alert('Incorrect image format');
            data.result = false;
        }
    }
    return data;
}