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
model.dao.OrderDetailDAOJdbc dao = new model.dao.OrderDetailDAOJdbc();
java.util.List<model.OrderDetailBean> list = dao.select();

model.dao.OrdersDAOJdbc dao2 = new model.dao.OrdersDAOJdbc();
java.util.List<model.OrdersBean> list2 = dao2.select();

model.dao.OrderStatusDAOJdbc dao3 = new model.dao.OrderStatusDAOJdbc();
java.util.List<model.OrderStatusBean> list3 = dao3.select();

%>

<h1><%=list %></h1>
<h1><%=list2 %></h1>
<h1><%=list3 %></h1>

</body>
</html>