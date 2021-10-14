<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Update</title>
<base href = "${pageContext.servletContext.contextPath}/">
</head>
<body>
	<form:form action="user/update/${username}.htm" modelAttribute="user">
    ${message}
		<div>
			<label>Username</label>
			<form:input path="username" name="user"/>
		</div>
		<div>
			<label>Password</label>
			<form:input path="password" name="pass"/>
		</div>
		<div>
			<label>Fullname</label>
			<form:input path="fullname" name="full"/>
		</div>
		<div>
			<button class="btn btn-default">Update</button>

		</div>
	</form:form>
	<a href="user/index.htm">Index</a>
</body>
</html>
