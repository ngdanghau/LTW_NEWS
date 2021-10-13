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
	${message }
	<form:form action="record/insert.htm" modelAttribute="record">
		<div>
			<label>Nhân viên</label>
			<form:select path="staff.id"
						items="${staffs}" itemValue="id" itemLabel="name"/>
		</div>
		<div>
			<label>Loại</label>
			<form:radiobutton path="type" value="true" label="Thành tích"/>
			<form:radiobutton path="type" value="false" label="Kỷ luật"/>
		</div>
		<div>
			<label>Lý do</label>
			<form:textarea path="reason" rows="3"/>
		</div>
		<div>
			<button>Insert</button>
		</div>
	</form:form>
	<a href="record/index.htm">Index</a>
</body>
</html>