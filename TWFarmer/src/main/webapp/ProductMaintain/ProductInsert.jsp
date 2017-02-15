<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
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
					<a class="navbar-brand" href="../index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="../ProductSelect/ProductSelect.jsp">購買蔬果</a></li>
						<li><a href="../PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
						<li><a href="../shoppingCart/shoppingCart.jsp">購物車</a></li>
					</ul>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a>
								</li>
								<li><a href="/TWFarmer/Login.jsp">登入</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/Msg/MsgCheckingServlet">站內信</a></li>
								<li><a href="#">會員專區</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">搜尋</button>
					</form>
				</div>

				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item active">管理商品</a> <a
						href="../BackStage/farmerCheckJpDetail.jsp"
						class="list-group-item">審核合購</a> <a href="#"
						class="list-group-item">管理賣場資料</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<center>
						<!-- 上傳圖片的form表單，要增加enctype="multipart/form-data" -->
						<form action="<c:url value="ProcessProductServlet" />"
							method="POST" enctype="multipart/form-data">
							<center>
							<table>
								<thead>
<%-- 									<center> --%>
										<h2>新增商品資料</h2>
										<br>
<%-- 									</center> --%>
								</thead>
								<tbody>
									<!-- 					<tr> -->
									<!-- 						<td>商品編號：<br>*商品資料填寫完會產生，無需填寫</td> -->
									<%-- 						<td>${productBean.productId}</td> --%>
									<!-- 					</tr> -->

<!-- 									<tr height=60> -->
<!-- 										<td>賣家ID：</td> -->
<%-- 										${範圍 . InsertProductServlet 第59行setAttributesetAttribute的key . ProductBean的變數} --%>
<%-- 										<td>${sessionScope.product.sellerId}</td> --%>
<!-- 									</tr> -->

									<tr height=60>
										<td><strong>產地</strong></td>
										<%-- value=${param.name屬性值} --%>
										<td><input id='origin' name="origin"
											value="${param.origin}" type="text" class="form-control"> <%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
											<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div></div>
									</tr>

									<tr height=60>
										<td><strong>商品名稱</strong></td>
										<td><input id='productName' name="productName"
											value="${param.productName}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.productName}</div>
									</tr>

									<tr height=60>
										<td><strong>庫存</strong></td>
										<td><input id='inventory' name="inventory"
											value="${param.inventory}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.inventory}</div>
									</tr>

									<tr height=60>
										<td><strong>單位價格</strong></td>
										<td><input id='price' name="price" value="${param.price}"
											type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
									</tr>

									<tr height=60>
										<td><strong>單位</strong></td>
										<td><select class="form-control" id='unit' name="unit">
												<option>箱</option>
												<option>顆</option>
												<option>斤</option>
												<option>公斤</option>
										</select>
											<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
									</tr>

									<tr height=60>
										<td><strong>類別</strong></td>
										<td><select class="form-control" id="productTypeName" name="productTypeName">
												<option>仁果類</option>
												<option>核果類</option>
												<option>堅果類</option>
												<option>漿果類</option>
												<option>柑橘類</option>
												<option>瓜類</option>
												<option>根菜類</option>
												<option>莖菜類</option>
												<option>花菜類</option>
												<option>果菜類</option>
												<option>葉菜類</option>
												<option>香辛類</option>
												<option>菌藻類</option>
												<option>豆類</option>
										</select>
											<div style="color: #FF0000; display: inline">${ErrorMsg.type}</div>
									</tr>

									<tr height=60>
										<td><strong>商品介紹</strong></td>
										<td><textarea class="form-control" id='productIntro' name="productIntro"
												cols="50" rows="8">${param.productIntro}</textarea>
									</tr>

									<tr height=60>
										<td><strong>運費</strong></td>
										<td><input id='freight' name="freight"
											value="${param.freight}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
									</tr>

									<tr height=60>
										<td><strong>上架日期</strong></td>
										<td><input id='addDate' name="addDate"
											value="${param.addDate}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
									</tr>

									<tr height=60>
										<td><strong>預估下架日期</strong></td>
										<td><input id='removeEstDate' name="removeEstDate"
											value="${param.removeEstDate}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.removeEstDate}</div>
									</tr>

<!-- 									<tr> -->
<!-- 										<td>下架日期：</td> -->
<!-- 										<td>商品下架才填</td> -->
<!-- 									</tr> -->

									<tr height=60>
										<td><strong>商品狀態</strong></td>
										<td><select class="form-control" id='productStatusName'
											name="productStatusName">
												<option>上架</option>
												<option>下架</option>
												<option>封鎖</option>
										</select></td>

									</tr>

									<!-- 					<tr> -->
									<!-- 						<td>折扣編號：<br>*商品資料填寫完會產生，無需填寫 -->
									<!-- 						</td> -->
									<%-- 						<td>${productDiscountBean.discountId}</td> --%>

									<!-- 					</tr> -->

									<tr height=60>
										<td><strong>最小件數</strong></td>
										<td><input class="form-control" id='minThreshold' name="minThreshold"
											value="${param.minThreshold}" type="text">
											<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
									</tr>

									<tr height=60>
										<td><strong>最大件數</strong></td>
										<td><input class="form-control" id='maxThreshold' name="maxThreshold"
											value="${param.maxThreshold}" type="text">
											<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
									</tr>

									<tr height=60>
										<td width=140><strong>折扣後價格</strong></td>
										<td><input class="form-control" id='discountPrice' name="discountPrice"
											value="${param.discountPrice}" type="text">
											<div style="color: #FF0000; display: inline">${ErrorMsg.discountPrice}</div>
									</tr>

									<!-- 					<tr> -->
									<!-- 						<td>商品圖片編號：<br>*商品資料填寫完會產生，無需填寫 -->
									<!-- 						</td> -->
									<%-- 						<td>圖片1：${productPicBean.productPicId}<br> --%>
									<%-- 						圖片2：${productPicBean.productPicId}<br> --%>
									<%-- 						圖片3：${productPicBean.productPicId}<br> --%>
									<%-- 						圖片4：${productPicBean.productPicId}<br> --%>
									<%-- 						圖片5：${productPicBean.productPicId}<br> --%>
									<!-- 						</td> -->
									<!-- 					</tr> -->

									<tr height=60>
										<td><strong>商品圖片</strong></td>
										<td><br>圖片1<input class='InputClass' type="file"
											name="picture1" /><br> 圖片2<input class='InputClass'
											type="file" name="picture2" /><br> 圖片3<input
											class='InputClass' type="file" name="picture3" /><br>
											圖片4<input class='InputClass' type="file" name="picture4" /><br>
											圖片5<input class='InputClass' type="file" name="picture5" /><br>
											<div style="color: #FF0000; display: inline">${ErrorMsg.picture}</div>
									</tr>

									<tr height=60>
										<td><strong>商品圖片介紹</strong></td>
										<td><br>圖片1<input id='pictureIntro' name="pictureIntro1"
											value="${param.pictureIntro1}" type="text" class="form-control"><br>
											圖片2<input id='pictureIntro' name="pictureIntro2"
											value="${param.pictureIntro2}" type="text" class="form-control"><br>
											圖片3<input id='pictureIntro' name="pictureIntro3"
											value="${param.pictureIntro3}" type="text" class="form-control"><br>
											圖片4<input id='pictureIntro' name="pictureIntro4"
											value="${param.pictureIntro4}" type="text" class="form-control"><br>
											圖片5<input id='pictureIntro' name="pictureIntro5"
											value="${param.pictureIntro5}" type="text" class="form-control"><br>
									</tr>

									<tr>
										<td height="100" colspan="2" align="center">
<!-- 										<input type="submit" name="Submit" value="新增" /> -->
										<input class="btn btn-default" type="submit" value="新增"
										name="Submit">
										</td>
									</tr>
								</tbody>
							</table>
							</center>
						</form>
					</center>
					<script src="../js/jquery.min.js"></script>
					<script src="../js/bootstrap.min.js"></script>
					<script src="../js/scripts.js"></script>
</body>
</html>