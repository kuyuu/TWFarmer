<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
合購申請已送出....<br>
您的申請資料：<br>
<table>
	<tr>
		<td>合購ID:</td>
		<td>${jpBean.jpId}</td>
	</tr>
	<tr>
		<td>主購ID:</td>
		<td>${jpBean.initId}</td>
	</tr>
	<tr>
		<td>合購介紹:</td>
		<td>${jpBean.jpIntro}</td>
	</tr>
	<tr>
		<td>開始日期:</td>
		<td>${jpBean.initDate}</td>
	</tr>
	<tr>
		<td>結束日期:</td>
		<td>${jpBean.endDate}</td>
	</tr>
</table>
</body>
</html>