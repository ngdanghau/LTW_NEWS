<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Insert</title>
<base href = "${pageContext.servletContext.contextPath}/">
</head>
<body>
    <form:form action="user/insert.htm" modelAttribute="user">
    ${message}
        <div>
            <label>Username</label>
            <form:input path="username"/>
        </div>
        <div>
            <label>Password</label>
            <form:input path="password"/>
        </div>
        <div>
            <label>Fullname</label>
            <form:input path="fullname"/>
        </div>
        <div>
            <button class="btn btn-default">Insert</button>
            
        </div>
    </form:form>
    <a href="user/index.htm">Index</a>
</body>
</html>
