<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報明牌</title>
</head>
<body>
	<h2>卜籤求明牌</h2>
	${visitName}，您好，
	<br>
	<hr>
	<%
		out.println(request.getAttribute("visitName") + "，您好，<br>");
	%>
	您的明牌為：${luckyNumber}
	<hr>
	<%
		out.println("您的明牌為：" + request.getAttribute("luckyNumber"));
	%>
</body>
</html>