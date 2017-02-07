<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自動更新畫面</title>
</head>
<body>
	<%@ page import="java.util.Date"%>
	<%
		int n = 1;
		response.setHeader("Refresh", "" + n);
		Date d = new Date();
	%>
	本網頁將在 <%=n %> 後自動更新畫面<br />
	<%=d %>
</body>
</html>