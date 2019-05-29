
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
session.removeAttribute("admin");
session.removeAttribute("user");
session.invalidate();
response.sendRedirect("login.jsp");

%>
<script>
    history.pushState(null, null, $(location).attr('href'));
    window.addEventListener('popstate', function () {
        history.pushState(null, null, $(location).attr('href'));
    });
</script>