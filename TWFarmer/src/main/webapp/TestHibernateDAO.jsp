<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Hibernate 版本 DAO 測試程式</h2><br />

<%
model.dao.JPFollowerDAOJdbc dao1 = new model.dao.JPFollowerDAOJdbc();
java.util.List<model.JPFollowerBean> list1 = dao1.select();

model.dao.JPFollowerDetailDAOJdbc dao2 = new model.dao.JPFollowerDetailDAOJdbc();
java.util.List<model.JPFollowerDetailBean> list2 = dao2.select();
%>
<h1><%=list1 %></h1>
<h1><%=list2 %></h1>
</body>
</html>