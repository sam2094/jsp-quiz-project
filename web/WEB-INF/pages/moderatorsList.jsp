<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <option value="" disabled selected>Select Moderator</option>
    <c:forEach var="userList" items="${userList}">
        <option value="${userList.id}">${userList.name} ${userList.surname}</option>
    </c:forEach>
