<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 3, from LayoutIt!</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable" id="tabs-505350">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-397163" data-toggle="tab">收件信</a></li>
						<li><a href="#panel-142235" data-toggle="tab">寄件信</a></li>
						<li><a href="#panel-142236" data-toggle="tab">我的訂單</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-397163">
							<form
								action="<c:url value="/Msg/MsgCheckingServlet.controller" />"
								method="get" class="">
								<c:choose>
									<c:when test="${not empty dao.messages}">
        留給${LoginOK.custId}的訊息<br>
										<br>
										<c:forEach var='mb' items='${dao.messages}' varStatus='vs'>
											<c:if test="${vs.first}">
												<%--       <c:out value="<table border='1' style='width:960px;'>" escapeXml='false' /> --%>
												<tr>
													<th style="width: 80px">信件流水號:</th>
													<th style="width: 80px">寄件者:</th>
													<th style="width: 180px">標題:</th>
													<th style="width: 250px">寄送時間：</th>
													<th style="width: 250px">內文:</th>
												</tr>
											</c:if>

											<tr>
												<td style="width: 80px">${msgBean.msgId}</td>
												<td style="width: 80px">${msgBean.msgWriterId}</td>
												<td style="width: 180px">${msgBean.msgTitle}</td>
												<td style="width: 250px; text-align: left">&nbsp;${msgBean.msgTime}</td>
												<td style="width: 250px; text-align: left">${msgBean.msgContent}</td>
											</tr>
											<c:if test="${vs.last}">
												<c:out value="</table>" escapeXml='false' />
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<center>沒有留言給您</center>
									</c:otherwise>
								</c:choose>
							</form>






						</div>
						<div class="tab-pane" id="panel-142235">


							<div style="padding: 5% 10% 10% 10%;">
								<div
									style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">寄送站內信</div>
								<form action="<c:url value="MsgCreatingServlet"/>" method="POST">
									<table border="0" width="35%" align="center">
										<caption>
											<h2>貼心提醒：文長不可超過500字</h2>
										</caption>
										<%-- <tr>
				<td width="50%">寄件人：</td>
				<td>${sessionScope.Msg.msgWriterId}</td>
				<td></td>
			</tr> --%>
										<tr>
											<td width="50%">寄件人</td>
											<td><input id='msgWriterId' value="${param.msgWriterId}"
												type="text" name="msgWriterId" size="50" />
												<div style="color: #FF0000; display: inline">
													<center>${errors.msgWriterId}</center>
												</div></td>
										</tr>
										<tr>
										<tr>
											<td width="50%">收件人</td>
											<td><input id='msgReaderId' value="${param.msgReaderId}"
												type="text" name="msgReaderId" size="50" />
												<div style="color: #FF0000; display: inline">
													<center>${errors.msgReaderId}</center>
												</div></td>
										</tr>
										<tr>
											<td>標題</td>
											<td><input id='msgTitle' value="${param.msgTitle}"
												type="text" name="msgTitle" size="50" />
												<div style="color: #FF0000; display: inline">
													<center>${errors.msgTitle}</center>
												</div></td>
										</tr>
										<tr>
											<td>內文</td>
											<td><textarea rows="10" cols="40" name="msgContent">${param.msgContent}</textarea>
												<div style="color: #FF0000; display: inline">
													<center>${errors.msgContent}</center>
												</div></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="submit"
												value="送出" /></td>
										</tr>



									</table>

								</form>
							</div>

						</div>

						<div class="tab-pane" id="panel-142236">
							<form
								action="<c:url value="/ProductSelect/ProductSelect.controller" />"
								method="get" class="">
								<c:if test="${not empty selectBy}">
									<table class="table-bordered">
										<thead>
											<tr>
												<th>訂單編號</th>
												<th>產品編號</th>
												<th>訂購時間</th>
												<th>產品單位</th>
												<th>單位/價格</th>
												<th>單位/運費</th>
												<th>總金額</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row1" items="${selectBy}">
												<tr>
													<td><a href="${path}">${row1.orderId}</a></td>
													<td>${row1.productId}</td>
													<td>${row1.orderDate}</td>
													<td>${row1.unitId}</td>
													<td>${row1.unitPrice}</td>
													<td>${row1.unitFreight}</td>
													<td>${row1.totalPrice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>


