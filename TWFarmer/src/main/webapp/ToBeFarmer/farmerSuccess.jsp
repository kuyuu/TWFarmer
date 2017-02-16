<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>臺灣小農 - 升級小農</title>
</head>
<body>
<center><h1 size="+4">申請完成<br></h1>
			<!-- 	日後需進行Session Scope的研究以便通過登入驗證後直接帶入 而非手動輸入 -->		
						
						<h3 size="+1">以下是您的申請資料</h3></center>
<table>
	<tr>
		<td>農民證號:</td>
		<td>${insert.farmerId}</td>
	</tr>
	<tr>
		<td>會員銀行代碼:</td>
		<td>${insert.bank}</td>
	</tr>
	<tr>
		<td>會員銀行帳號:</td>
		<td>${insert.bankAccount}</td>
	</tr>
	<tr>
		<td>賣場介紹:</td>
		<td>${insert.farmerIntro}</td>
	</tr>
</table>
<center><h2 size="+2">請耐心等候管理員審核<br>祝您有美好的一天</h2></center>


</body>
</html>