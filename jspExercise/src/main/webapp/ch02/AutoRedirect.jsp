<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自動轉址</title>
</head>
<body>
	<%
		int n = 5;
		response.setHeader("Refresh", n+";URL=http://www.google.com");
	%>
		本網頁將在 <%=n %> 秒後自動前往google
</body>
</html>