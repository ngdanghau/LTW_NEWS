<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Report</title>
</head>
<body>
<table class="table table-hover">
    <tr>
        <th>Mã nhân viên</th>
        <th>Tổng thành tích</th>
        <th>Tổng kỹ luật</th>
        <th>Tổng kết</th>
    </tr>
    <c:forEach var="a" items="${arrays}">
    <tr>
        <td>${a[0]}</td>
        <td>${a[1]}</td>
        <td>${a[2]}</td>
        <td>${a[1] * a[2]}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>