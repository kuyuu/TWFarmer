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
	<h2>開新合購</h2>
	<form action="<c:url value="CheckJointPurchaseServlet"/>" method="POST"> 
		<table border="1">
			<tr>
				<td>會員ID：</td>
				<td>${sessionScope.JointPurchase.initId}</td>
				<td></td>
			</tr>
			<tr>
				<td>商品ID：</td>
				<td>${sessionScope.JPDetail.productId}</td>
				<td></td>
			</tr>
			<tr>
				<td>合購介紹：</td>
				<td><textarea rows="2" cols="20" name="jpIntro"></textarea></td>
				<td></td>
			</tr>
			<tr>
				<td>開始日期：</td>
				<td><input type="text" name="initDate" value="${param.initDate}" /></select></td>
				<td>${errors.initDate}</td>
			</tr>
			<tr>
				<td>結束日期：</td>
				<td><input type="text" name="endDate" value="${param.endDate}" /></select></td>
				<td>${errors.endDate}</td>
			</tr>
			<tr>
				<td>合購地區：</td>
				<td><input type="text" name="jpLocation" value="${param.jpLocation}" /></select></td>
				<td>${errors.jpLocation}</td>
			</tr>
			<tr>
				<td>雜費收取方式：</td>
				<td><select name="miscViaWay" id="miscViaWay">
						<option value="4201">不收</option>
						<option value="4202">依人頭</option>
						<option value="4203">依比例</option>
					</select></td>
				<td>${errors.miscViaWay}</td>
			</tr>
			<tr>
				<td>雜費：</td>
				<td><input type="text" name="misc" value="${param.misc}" /></select></td>
				<td>${errors.misc}</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="確認"> </td>
			</tr>
		</table>
	</form>
</body>
</html>