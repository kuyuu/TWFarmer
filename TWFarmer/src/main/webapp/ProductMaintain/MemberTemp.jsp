<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color:#fcf5e0;
}
html {
    overflow-y:scroll;
}
</style>
</head>
<body>
	<h2>會員登入頁面</h2>
	<form action="<c:url value="InsertProductServlet" />" method="POST">
		<table>
			<tr>
				<td>會員ID</td>
				<td><input type="text" name="memberId"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="確認"></td>
			</tr>
		</table>
	</form>
</body>
</html>