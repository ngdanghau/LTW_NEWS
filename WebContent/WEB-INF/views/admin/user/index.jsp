<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Index</title>
<base href = "${pageContext.servletContext.contextPath}/">
</head>
<body>
<a href="user/insert.htm">Insert</a>
${message}
	<table class="table table-hover">
		<tr>
			<th>Username</th>
			<th>Password</th>
			<th>Fullname</th>
			<th></th>
		</tr>
		<c:forEach var="u" items="${users}">
			<tr>
				<td>${u.username}</td>
				<td>${u.password}</td>
				<td>${u.fullname}</td>
				<td><a href="user/update/${u.username}.htm">Update</a></td>
				<td><a href="user/delete/${u.username}.htm">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>