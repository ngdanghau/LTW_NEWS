<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Insert</title>
<base href="${pageContext.servletContext.contextPath }/">
</head>
<body>
<a href="record/insert.htm">Insert</a>
	<table class="table table-hover">
		<tr>
			<th>Nhân viên</th>
			<th>Loại</th>
			<th>Lý do</th>
			<th></th>
		</tr>
		<c:forEach var="r" items="${records}">
			<tr>
				<td>${r.staff.id}</td>
				<td>${r.type = "true" ?'Khen Thưởng':'Kỷ Luật'}</td>
				<td>${r.reason}</td>
				<td><a href="record/update/${r.id}.htm">Update</a></td>
				<td><a href="record/delete/${r.id}.htm">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>