<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<option value="" disabled selected>Select Quiz</option>
<c:forEach var="quizList" items="${quizSelectList}">
    <option value="${quizList.id}">${quizList.name} | ${quizList.quizCategory.name}</option>
</c:forEach>
