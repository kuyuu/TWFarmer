<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>臺灣小農-註冊會員</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
        altField : "#datepicker",
        altFormat : "yy-mm-dd",
        dateFormat : "yy-mm-dd"
      });
  } );
  </script>

</head>
<body>
<form action="<c:url value="/MemberSubmit/MemberSubmit.controller" />" method="post">
	<table>
		<thead>
			<tr><th>加入會員</th><tr>
		</thead>
		<tbody>
			<tr>
				<th>帳號</th>
				<td><input type="text" name="account" value="${param.account}"></td>
				<td>${errors.account}</td>
				<th>密碼</th>
				<td><input type="password" name="password" value="${param.password}"></td>
				<td>${errors.password}</td>
			</tr>
			<tr>
				<th>名字</th>
				<td><input type="text" name="name" value=""></td>
				<td>${errors.name}</td>
				<th>手機</th>
				<td><input type="text" name="phone" value=""></td>
				<td>${errors.phone}</td>
			</tr>
			<tr>
				<th>生日</th>
				<td><input type="text" id="datepicker" name="birthDate" value=""></td>
				<td>${errors.birthDate}</td>
				<th>性別</th>
				<td>
				<input type="radio" name="gender" value="M">男
				<input type="radio" name="gender" value="F">女
				</td>
				<td>${errors.gender}</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value=""></td>
				<td>${errors.email}</td>
				<th>身分證字號</th>
				<td><input type="text" name="idNumber" value=""></td>
				<td>${errors.idNumber}</td>
			</tr>
			<tr>
				<th rowspan="2">居住地址</th>
				<td colspan="3">
					郵遞區號 <input type="text" name="postalCode" value="">
					<span>${errors.postalCode}</span>
					<select name="district" value="">
					<option>請選擇縣市</option>
					<option>台北市</option>
					</select>
					<select name="district" value="">
					<option>請選擇地區</option>
					<option>大安區</option>
					</select>
				</td>			
				<td>${errors.district}</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="text" name="address" value="">
				</td>
				<td>${errors.address}</td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="submit" name="submit" value="submit">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>