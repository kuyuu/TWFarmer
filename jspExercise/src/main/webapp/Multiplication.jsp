<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>九九乘法表</title>
</head>
<body>

	<c:forEach var='t' begin='1' end='9' varStatus='vs' step='1'>
		<c:if test='${vs.first}'>
			<c:out value="<table border='1'>" escapeXml='false' />
			<tr>
				<th colspan='13'>九九乘法表</th>
			</tr>
		</c:if>
		<c:set var='color' value='#D3FF93' />
		<c:if test='${vs.count % 2== 0}'>
			<c:set var='color' value='#C4E1FF' />
		</c:if>
		<tr bgcolor='${color}'>
			<c:forEach var='a' begin='1' end='9'>
				<td>${a}X${t}=${t*a}</td>
			</c:forEach>
			<td>${vs.first}</td>
			<td>${vs.last}</td>
			<td>${vs.index}</td>
			<td>${vs.count}</td>
		</tr>
		<c:if test='${vs.last}'>
			<c:out value='</table>' escapeXml='false' />

		</c:if>
	</c:forEach>

</body>
</html>