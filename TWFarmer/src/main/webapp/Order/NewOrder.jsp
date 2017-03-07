<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:if test="${empty LoginOK}">  --%>
<%--    <c:set var="target" value="${pageContext.request.servletPath}" scope="session" /> --%>
<%--    <c:redirect url="../Login.jsp" /> --%>
<%-- </c:if> --%>

<%-- <c:if test="${empty LoginOK}"> --%>
<%-- 	<c:set var="target" --%>
<%-- 		value="/ProductServlet?productId=${productBean.productId}" --%>
<%-- 		scope="session" /> --%>
<%-- 	<c:redirect url="../Login.jsp" />	 --%>
<%-- </c:if> --%>

<c:if test="${empty LoginOK}">
	<c:set var="target" value="/Order/NewOrderServlet?productId=${productBean.productId}&sellerId=${productBean.sellerId}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農 - 直接下單</title>
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
	overflow-y: scroll;
}

#backPic{
  position:fixed;
  top:0;
  z-index: -1;
  opacity: 0.4;
  height:100%;
  width: 100%;
 }


</style>


</head>
<body>

<img src="../img/bg/demobg3.jpg" id="backPic">

	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div style="padding: 5% 10% 10% 10%;">
					<div
						style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">建立訂單</div>

					<form action="<c:url value="SaveOrderServlet"/>" method="POST"
						role="form">

						<div class="col-md-6">
							<div class="form-group">
								<label>賣家：</label> ${member.account}
							</div>

							<div class="form-group">
								<label>買家：</label> ${sessionScope.LoginOK.account}
							</div>

							<div class="form-group">
								<label>訂購日期：</label> ${currentDateTime}
							</div>

							<div class="form-group">
								<label>出貨日期：</label> ${shipDateTime}
							</div>						
						</div>
						
						
						<div class="col-md-6">
							<div class="form-group">
								<label>商品編號：</label> ${product.productId}
							</div>

							<div class="form-group">
								<label>商品名稱：</label> ${product.productName}
							</div>
	
							<div class="form-group">
								<label>商品單價：</label> ${product.price}
							</div>
	
							<div class="form-group">
								<label>商品單位：</label> ${product.unit}
							</div>
	
							<div class="form-group">
								<label>單價運費：</label> ${product.freight}
							</div>
						</div>
						
						
						
							<div class="form-group">
							<label>收件人：</label> <input id='shipName'
								value="${sessionScope.LoginOK.name}" type="text" name="shipName"
								class="form-control" />
							<div style="color: #FF0000; display: inline">${errors.shipName}</div>
							</div>

							<div class="form-group">
								<label>收件郵遞區號：</label> <input id='shipPostalCode'
									value="${sessionScope.LoginOK.postalCode}" type="text"
									name="shipPostalCode" class="form-control" />
								<div style="color: #FF0000; display: inline">${errors.shipPostalCode}</div>
							</div>
	
							<div class="form-group">
								<label>收件地區：</label> <input id='shipDistrict'
									value="${sessionScope.LoginOK.district}" type="text"
									name="shipDistrict" class="form-control" />
								<div style="color: #FF0000; display: inline">${errors.shipDistrict}</div>
							</div>
	
							<div class="form-group">
								<label>收件地址：</label> <input id='shipAddress'
									value="${sessionScope.LoginOK.address}" type="text"
									name="shipAddress" class="form-control" />
								<div style="color: #FF0000; display: inline">${errors.shipAddress}</div>
							</div>
	
							<div class="form-group">
								<label for="spinner">購買數量：</label> 
								<input id='spinner' value="" type="text"
									name="amount" class="form-control" />
								<div style="color: #FF0000; display: inline">${errors.amount}</div>
							</div>						
								
						
							<div class="form-group" style="float:center;">
								<button id='button' type="submit" class="btn btn-primary">確認訂單</button>
							
								<button id='button' type="button" class="btn btn-primary"
									onclick="location.href='<c:url value="../index.jsp" /> '">取消訂單</button>
							</div>	
						
						

						<input type="hidden" name="sellerID" value="${member.memberId}">
						<input type="hidden" name="buyerID"
							value="${sessionScope.LoginOK.memberId}"> <input
							type="hidden" name="orderDate" value="${currentDateTime}">
						<input type="hidden" name="shipDateTime" value="${shipDateTime}">
						<input type="hidden" name="productID" value="${product.productId}">
						<input type="hidden" name="price" value="${product.price}">
						<input type="hidden" name="freight" value="${product.freight}">
						<input type="hidden" name="unit" value="${product.unit}">
					</form>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</div>
	</div>

	<!-- NewOrderTemp End -->
	<script>
		/*
			$('#amount').change(function (){
				var price = $('#price')
			})
		 */
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
	<script>
	 $( function() {
		    var spinner = $( "#spinner" ).spinner();
		 
		   
		 
		    $( "#button" ).button();
		  } );
    
  </script>



</body>
</html>