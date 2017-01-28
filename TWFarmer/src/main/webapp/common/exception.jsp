<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"  isErrorPage="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"  %>
<%
  String expTypeFullName
    = exception.getClass().getName();
  String expTypeName
    = expTypeFullName.substring(expTypeFullName.lastIndexOf(".")+1);
  String request_uri
    = (String) request.getAttribute("javax.servlet.error.request_uri");
%>
<html>
<head>
<style>
	td {
		padding-top:10px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exception Page</title>
</head>
<body>

<table>
	<tr>
		<td><h2><%= expTypeName %></h2></td>
	</tr>
	<tr>
		<td><%= exception.getMessage() %></td>
	</tr>
	<tr>
		<td>This was the request URI:<br />
			<%= request_uri %>
			</td>
	</tr>
	<tr>
		<td>This is the complete backtrace of the exception:<br />
			<% 
				exception.printStackTrace(new PrintWriter(out)); 
			%>
			</td>
	</tr>
</table>
</body>
</html>