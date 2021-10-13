<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Index Staff</title>
</head>
<body>
<table class="table table-hover">
    <tr>
        <th>Mã nhân viên</th>
        <th>Họ và tên</th>
        <th>Giới tính</th>
        <th>Phòng</th>
    </tr>
    <c:forEach var="u" items="${staffs}">
    <tr>
        <td>${u.id}</td>
        <td>${u.name}</td>
        <td>${u.gender == 0 ?'Nam':'Nữ'}</td>
        <td>${u.depart.name}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>