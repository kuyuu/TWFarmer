<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增會員資料</title>
</head>
<body>
	<h2>新增會員資料</h2>
	<form action="member.do" method="POST">
		<table>
			<tr>
				<td>帳號：</td>
				<td><input type="text" name="memberId" /></td>
				<td></td>
			</tr>
			<tr>
				<td>密碼：</td>
				<td><input type="password" name="password" /></td>
				<td></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="name" /></td>
				<td></td>
			</tr>
			<tr>
				<td>住址：</td>
				<td><input type="text" name="address" /></td>
				<td></td>
			</tr>
			<tr>
				<td>手機：</td>
				<td><input type="text" name="phone" /></td>
				<td></td>
			</tr>
			<tr>
				<td>生日：</td>
				<td><input type="text" name="birthday" /></td>
				<td></td>
			</tr>
			<tr>
				<td>體重：</td>
				<td><input type="text" name="weight" /></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="送出" /></td>
			</tr>
		</table>
	</form>
</body>
</html>