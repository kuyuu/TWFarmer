<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  
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
			</tr>   --%>         
					 <tr>
				<td width="50%">賣家編號：</td>
				<td><input id='sellerId' value="${param.sellerId}" type="text" name="sellerId" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.sellerId}</div>
				</td>
				<td></td>
			</tr>	
					 <tr>
				<td width="50%">買家編號：</td>
				<td><input id='buyerId' value="${param.buyerId}" type="text" name="buyerId" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.buyerId}</div>
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
    		<tr>
				<td width="50%">總金額：</td>
				<td><input id='totalPrice' value="${param.totalPrice}" type="text" name="totalPrice" size="50"/>
				<div style="color:#FF0000; display:inline">${errors.totalPrice}</div>
				</td>
				<td></td>
			</tr>	
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
</body>
</html>