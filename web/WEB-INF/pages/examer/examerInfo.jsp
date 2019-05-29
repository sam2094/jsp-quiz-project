<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-util/inputmask/css/inputmask.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<div class="form-group">
    <label for="userName" class="col-form-label">Name</label>
    <input type="text" value="${examer.name}" class="form-control" id="userName" readonly>
</div>
<div class="form-group">
    <label for="userSurname" class="col-form-label">Surname</label>
    <input type="text" value="${examer.surname}" class="form-control" id="userSurname" readonly>
</div>
<div class="form-group">
    <label for="descriptionField" class="col-form-label">Description</label>
    <textarea class="form-control rounded-1"  placeholder="Description" rows="3" id="descriptionField">${examer.description}</textarea>
</div>
<div class="form-group">
    <label class="col-form-label" for="phoneField" >Phone number <small class="text-muted">+994 99 999 999</small></label>
    <input type="text" class="form-control international-inputmask" id="phoneField" placeholder="">
</div>
<div class="form-group">
    <label for="datepicker" class="col-form-label">Birth date</label>
    <div class="input-group date">
        <input type="text" id="datepicker" placeholder="YYYY-MM-DD" class="form-control clsDatePicker"> <span class="input-group-addon"><i id="calIconTourDateDetails" class="glyphicon glyphicon-th"></i></span>
    </div>
</div>

<a class="btn btn-primary btn-block" id="updateExamer">Update</a>

            <%--<div class="modal-footer">--%>
                <%--<button type="button" id="closeModal" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Close</button>--%>
                <%--<button id="updateUser" type="button" class="btn btn-primary" >Update</button>--%>
            <%--</div>--%>
<script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/inputmask/js/jquery.inputmask.bundle.js"></script>
<script>

$('#updateExamer').click(function () {
   var examerId = ${user.id};
   var description = $('#descriptionField').val().trim();
   var phoneNumber = $('#phoneField').val();
   var birthdate = $('#datepicker').val();
   var data = {
        examerId:examerId,
        description:description,
        phoneNumber:phoneNumber,
        birthdate:birthdate
    };
   if(birthdate != '') {
       $.ajax({
           url: "es?action=updateExamer",
           type: "POST",
           data: data,
           dataType: "text",
           success: function (data) {
               if (data == "success") {
                   $.alert("Information updated successfully");
               } else {
                   $.alert("Error!")
               }
           }
       })
   } else  {
       $.alert("Please select date of your Birthday!");
   }
});
$(".international-inputmask").inputmask("+999 (99) 999-99-99");


</script>
<script>
    $('#datepicker').datepicker();
</script>

