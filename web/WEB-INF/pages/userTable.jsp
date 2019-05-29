<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/admin-util/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/admin-util/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
      type="text/css">
<link href="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/admin-util/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/admin-util/js/demo/datatables-demo.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">


<div class="card-header">
    <i class="fas fa-table"></i>
    User's List

</div>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Username</th>
                <th>Role</th>
                <th>Register Date</th>
                <th>Status</th>
                <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="ul">
                <tr>
                    <td>${ul.name}</td>
                    <td>${ul.surname}</td>
                    <td>${ul.username}</td>
                    <td>${ul.userType.name}</td>
                    <td>${ul.registerDate}</td>
                    <td>${ul.status}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Action
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item" type="button"  data-toggle="modal" data-target="#exampleModal" onclick="fillUserValue(${ul.id},'${ul.name}','${ul.surname}','${ul.username}',${ul.userType.id})">Edit</button>
                                <c:if test="${ul.status.equals('Active')}">
                                    <button class="dropdown-item" type="button" onclick="deleteUser(${ul.id})">Delete</button>
                                </c:if>
                                <c:if test="${ul.status.equals('Deleted')}">
                                    <button class="dropdown-item" type="button" onclick="restoreUser(${ul.id})">Restore</button>
                                </c:if>

                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <%--modal start--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Update user</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeExampleModal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userName" class="col-form-label">Name</label>
                        <input type="text" class="form-control" id="userName" required>
                    </div>
                    <div class="form-group">
                        <label for="userSurname" class="col-form-label">Surname</label>
                        <input type="text" class="form-control" id="userSurname" required>
                    </div>
                    <div class="form-group">
                        <label for="userUsername" class="col-form-label">Username</label>
                        <input type="text" class="form-control" id="userUsername" required>
                    </div>
                    <div id="userTypesList111" class="form-group">
                        <label for="userTypeSelect" class="col-form-label">Type</label>
                        <select id="userTypeSelect" class="form-control">
                            <c:forEach items="${userTypesList}" var="utl">
                                <option value="${utl.id}">${utl.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Close</button>
                    <button id="updateUser" type="button" class="btn btn-primary" >Update</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--modal end--%>
<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
<script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>

