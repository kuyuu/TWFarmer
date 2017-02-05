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
model.dao.ProductDAOjdbc dao = new model.dao.ProductDAOjdbc();
java.util.List<model.ProductBean> list = dao.select();

model.dao.ProductDiscountDAOjdbc dao2 = new model.dao.ProductDiscountDAOjdbc();
java.util.List<model.ProductDiscountBean> list2 = dao2.select();

// model.dao.ProductStatusDAOjdbc dao3 = new model.dao.ProductStatusDAOjdbc();
// java.util.List<model.ProductStatusBean> list3 = dao3.select();

model.dao.ProductTypeDAOjdbc dao4 = new model.dao.ProductTypeDAOjdbc();
java.util.List<model.ProductTypeBean> list4 = dao4.select();

model.dao.ProductDAOjdbc dao5 = new model.dao.ProductDAOjdbc();
java.util.List<model.ProductBean> list5 = dao5.selectByType(2105);
%>

<h1><%=list %></h1>
<h1><%=list2 %></h1>
<%-- <h1><%=list3 %></h1> --%>
<h1><%=list4 %></h1>
<h1><%=list5 %></h1>

</body>
</html>