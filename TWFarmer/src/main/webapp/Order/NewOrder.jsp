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
<!-- 上方選單start -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="/TWFarmer/Order/OrderTemp.jsp">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">註冊</a></li>
						<li><a href="#">登入</a></li>
						<li><a href="/TWFarmer/Msg/MsgForm.jsp">站內信</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">

	<div class="row">
					<div class="col-md-2"></div>
					<div class="row">
						<div class="col-md-3">
							<div class="list-group">
									<a href="/TWFarmer/Order/NewOrder.jsp"class="list-group-item active">直接下單</a> 
									<a href="/TWFarmer/JointPurchase/newJp.jsp" class="list-group-item">發起合購</a>
									<a href="/TWFarmer/Order/ReportVio.jsp"class="list-group-item">檢舉違規</a>


							</div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>

					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 上方選單 End -->


<!-- NewOrderTemp Start -->>
		<center>
   <form action="<c:url value="InsertOrderServlet"/>" method="POST"> 
        <table border="0" width="35%" >
            <caption><h2>建立訂單</h2></caption>
        <%--     <tr>
				<td width="50%">賣家：</td>
				<td>${sessionScope.Order.SellerId}</td>
				<td></td>
			</tr>
 			<tr>
 				<td width="50%">買家：</td>
				<td>${sessionScope.Order.BuyerId}</td>
				<td></td>
			</tr>           
					 <tr>
				<td width="50%">賣家編號：</td>
				<td><input id='sellerId' value="${param.sellerId}" type="text" name="sellerId" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.sellerId}</div>
				</td>
			</tr>	
			 --%>
					 <tr>
				<td width="50%">買家編號：</td>
				<td><input id='buyerId' value="${param.buyerId}" type="text" name="buyerId" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.buyerId}</div>
				</td>
				<td></td>
			</tr>	
			<tr>
			
			<td width="50%">購買商品 ${test}</td>
			<td>
			<select name="selectedProduct" value="${param.selectedProduct}">
      <c:forEach items="${products}" var="product">
      	<option value="${product.productId}">${product.productName}</option>
      </c:forEach>
   </select>
		
		<!--	
			<select name="selectedProduct" value="${param.selectedProduct}">
      <option>Small0</option>
      <option>Small1</option>
      <option>Small2</option>
   </select>
   -->
   </td>
   <td></td>
   </tr>
			
			 <tr>
				<td width="50%">數量：</td>
				<td><input id='amount' value="${param.amount}" type="text" name="amount" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.amount}</div>
				</td>
				<td></td>
			</tr>	
			
			 <tr>
				<td width="50%">總運費：</td>
				<td><input id='totalFreight' value="${param.totalFreight}" type="text" name="totalFreight" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.totalFreight}</div>
				</td>
				<td></td>
			</tr>	
			<!-- 
    		<tr>
				<td width="50%">總金額：</td>
				<td><input id='totalPrice' value="${param.totalPrice}" type="text" name="totalPrice" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.totalPrice}</div>
				</td>
				<td></td>
			</tr>	
			-->
			 <tr>
				<td width="50%">訂購日期：</td>
				<td><input id='orderDate' value="${param.orderDate}" type="text" name="orderDate" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.orderDate}</div>
				</td>
				<td></td>
			</tr>	        
			<tr>
				<td width="50%">出貨日期：</td>
				<td><input id='shipDate' value="${param.shipDate}" type="text" name="shipDate" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.shipDate}</div>
				</td>
				<td></td>
			</tr>	
			<tr>
				<td width="50%">收件人：</td>
				<td><input id='shipName' value="${param.shipName}" type="text" name="shipName" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.shipName}</div>
				</td>
				<td></td>
			</tr>	
			<tr>
				<td width="50%">收件郵遞區號：</td>
				<td><input id='shipPostalCode' value="${param.shipPostalCode}" type="text" name="shipPostalCode" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.shipPostalCode}</div>
				</td>
				<td></td>
			</tr>	
			<tr>
				<td width="50%">收件地區：</td>
				<td><input id='shipDistrict' value="${param.shipDistrict}" type="text" name="shipDistrict" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.shipDistrict}</div>
				</td>
				<td></td>
			</tr>	
			 
			 <tr>
				<td width="50%">收件地址：</td>
				<td><input id='shipAddress' value="${param.shipAddress}" type="text" name="shipAddress" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.shipAddress}</div>
				</td>
				<td></td>
			</tr>	
			 

            <tr>
                <td colspan="2" align="center"><input type="submit" value="送出"/></td>
            </tr>
            
            
            
        </table>
         
    </form>
</center>

<!-- NewOrderTemp End -->

</body>
</html>