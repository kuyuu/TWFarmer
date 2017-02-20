<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>臺灣小農 - 直接下單</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!--   Date Picker for Ship Date
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker_ShipDate" ).datepicker({
        altField : "#datepicker",
        altFormat : "yy-mm-dd",
        dateFormat : "yy-mm-dd"
      });
  } );
  </script>
   -->


</head>
<body>
<jsp:include page="../common/menu.jsp" />
	<center>
		<form action="<c:url value="SaveOrderServlet"/>" method="POST">
			<table border="0" width="35%">
				<caption>
					<h2>建立訂單</h2>
				</caption>
				<tr>
					<td width="50%">賣家：</td>
					<td>${member.account}</td>
					<td></td>
				</tr>
				<tr>
					<td width="50%">買家：</td>
					<td>${sessionScope.LoginOK.account}</td>
					<td></td>
				</tr>

				<tr>
					<td width="50%">訂購日期：</td>
					<td>${currentDateTime}</td>
				</tr>

				<tr>
					<td width="50%">出貨日期：</td>
					<td>${shipDateTime}</td>
				</tr>

				<tr>
					<td width="50%">商品編號：</td>
					<td>${product.productId}</td>
				</tr>
				<tr>
					<td width="50%">商品名稱：</td>
					<td>${product.productName}</td>
				</tr>
				<tr>
					<td width="50%">商品單價：</td>
					<td>${product.price}</td>
				</tr>
				<tr>
					<td width="50%">商品單位：</td>
					<td>${product.unit}</td>
				</tr>
				<tr>
					<td width="50%">單價運費：</td>
					<td>${product.freight}</td>
				</tr>

				<tr>
					<td width="50%">收件人：</td>
					<td><input id='shipName'
						value="${sessionScope.LoginOK.name}" type="text"
						name="shipName" size="50" />
						<div style="color: #FF0000; display: inline">${errors.shipName}</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="50%">收件郵遞區號：</td>
					<td><input id='shipPostalCode'
						value="${sessionScope.LoginOK.postalCode}" type="text"
						name="shipPostalCode" size="50" />
						<div style="color: #FF0000; display: inline">${errors.shipPostalCode}</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="50%">收件地區：</td>
					<td><input id='shipDistrict'
						value="${sessionScope.LoginOK.district}" type="text"
						name="shipDistrict" size="50" />
						<div style="color: #FF0000; display: inline">${errors.shipDistrict}</div>
					</td>
					<td></td>
				</tr>

				<tr>
					<td width="50%">收件地址：</td>
					<td><input id='shipAddress'
						value="${sessionScope.LoginOK.address}" type="text"
						name="shipAddress" size="50" />
						<div style="color: #FF0000; display: inline">${errors.shipAddress}</div>
					</td>
					<td></td>
				</tr>


				<tr>
					<td width="50%">數量：</td>
					<td><input id='amount' value="" type="text" name="amount"
						size="50" />
						<div style="color: #FF0000; display: inline">${errors.amount}</div>
					</td>
					<td></td>
				</tr>


				<tr>
					<td align="center">
						<button type="submit" class="btn btn-primary">確認訂單</button>	
					</td>	
					<td>
						<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="../index.jsp" /> '">取消訂單</button>	
					</td>			
				</tr>
				
			</table>
			<input type="hidden" name="sellerID" value="${member.memberId}">
			<input type="hidden" name="buyerID" value="${sessionScope.LoginOK.memberId}">
			<input type="hidden" name="orderDate" value="${currentDateTime}">
			<input type="hidden" name="shipDateTime" value="${shipDateTime}">
			<input type="hidden" name="productID" value="${product.productId}">
			<input type="hidden" name="price" value="${product.price}"> 
			<input type="hidden" name="freight" value="${product.freight}">
			<input type="hidden" name="unit" value="${product.unit}">
		</form>
		
	</center>

	<!-- NewOrderTemp End -->
	<script>
		/*
			$('#amount').change(function (){
				var price = $('#price')
			})
		 */
	</script>
</body>
</html>