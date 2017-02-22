<%@page import="model.FarmerBean"%>
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
model.dao.MemberDAOJdbc dao = new model.dao.MemberDAOJdbc();  
java.util.List<model.MemberBean> list = dao.select();

model.dao.FarmerDAOJdbc dao2 = new model.dao.FarmerDAOJdbc();
java.util.List<model.FarmerBean> list2 = dao2.select();

model.dao.MemberDAOJdbc dao3 = new model.dao.MemberDAOJdbc();  
java.util.List<model.MemberBean> list3 = dao3.selectByTypeId(4);

model.dao.MemberDAOJdbc dao4 = new model.dao.MemberDAOJdbc();  
java.util.Map<model.MemberBean, FarmerBean> list4 = dao3.selectByType(4);
%>
<%-- <h1><%=list %></h1> --%>
<%-- <h1><%=list2 %></h1> --%>
<h1><%=list3 %></h1>
<h1><%=list4 %></h1>
</body>
</html>