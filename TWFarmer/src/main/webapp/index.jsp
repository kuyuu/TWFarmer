<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
TEST
<%

model.dao.ChatRoomDAOJdbc dao = new model.dao.ChatRoomDAOJdbc();
java.util.List<model.ChatRoomBean> list = dao.select();
%>
<h1><%=list %></h1>
</body>
</html>