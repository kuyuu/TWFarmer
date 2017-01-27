<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
model.dao.F2FDetailDAOjdbc dao = new model.dao.F2FDetailDAOjdbc();
java.util.List<model.F2FDetailBean> list = dao.select();

model.dao.JointPurchaseDAOjdbc dao2 = new model.dao.JointPurchaseDAOjdbc();
java.util.List<model.JointPurchaseBean> list2 = dao2.select();

model.dao.JPDetailDAOjdbc dao3 = new model.dao.JPDetailDAOjdbc();
java.util.List<model.JPDetailBean> list3 = dao3.select();

model.dao.JPStatusDAOjdbc dao4 = new model.dao.JPStatusDAOjdbc();
java.util.List<model.JPStatusBean> list4 = dao4.select();

model.dao.MiscViaDAOjdbc dao5 = new model.dao.MiscViaDAOjdbc();
java.util.List<model.MiscViaBean> list5 = dao5.select();
%>
<h1><%=list %></h1>
<h1><%=list2 %></h1>
<h1><%=list3 %></h1>
<h1><%=list4 %></h1>
<h1><%=list5 %></h1>
</body>
</html>