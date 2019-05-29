<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<option value="" disabled selected>Select Type</option>
<c:forEach items="${userTypesList}" var="utl">
    <option value="${utl.id}">${utl.name}</option>
</c:forEach>
