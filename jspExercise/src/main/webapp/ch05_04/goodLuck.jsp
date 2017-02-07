<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myBean" class="ch05_04.LotteryBean" scope="page">
	<jsp:setProperty name="myBean" property="lowerBound" value="1" />
	<jsp:setProperty name="myBean" property="upperBound" value="49" />
	<jsp:setProperty name="myBean" property="ballNumber" value="6" />
</jsp:useBean>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報明牌</title>
</head>
<body>
	<h2>卜籤求明牌</h2>
	${param.visitor}，您好，
	<br>
	您的明牌為：<jsp:getProperty name="myBean" property="luckyNumbers" /><br>

</body>
</html>