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
<h2>商品頁面</h2>
	<form action="<c:url value="NewJointPurchaseServlet" />" method="POST"> 
		<table>
			<tr>
				<td>會員ID</td>
				<td><input type="text" name="memberId"></td>
			</tr>
			<tr>
				<td>商品ID</td>
				<td><input type="text" name="productId" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="確認"> </td>
			</tr>
		</table>
	</form>
</body>
</html>