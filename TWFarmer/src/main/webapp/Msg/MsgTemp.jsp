<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>請輸入寄件人與收件人</h2>
	<form action="<c:url value="MsgCreatingServlet" />" method="POST"> 
		<table>
			<tr>
				<td>我是：</td>
				<td><input type="text" name="msgWriterId"></td>
			</tr>
			<tr>
				<td>我要寫信給：</td>
				<td><input type="text" name="msgReaderId" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="確認"> </td>
			</tr>
		</table>
	</form>
</body>
</html>