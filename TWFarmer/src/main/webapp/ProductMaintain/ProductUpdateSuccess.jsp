<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>臺灣小農-修改商品</title>
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
						<h2>商品修改成功</h2>
						<br> <br>
						<center>
							<table class="table">

								<tr>
									<td width=300><strong>商品編號</strong></td>
									<td>${productBean.productId}</td>
								</tr>

								<tr>
									<td><strong>產地</strong></td>
									<td>${productBean.origin}</td>
								</tr>

								<tr>
									<td><strong>商品名稱</strong></td>
									<td>${productBean.productName}</td>
								</tr>

								<tr>
									<td><strong>庫存</strong></td>
									<td>${productBean.inventory}</td>
								</tr>

								<tr>
									<td><strong>單位價格</strong></td>
									<td>${productBean.price}</td>
								</tr>

								<tr>
									<td><strong>單位</strong></td>
									<td>${productBean.unit}</td>
								</tr>

								<tr>
									<td><strong>類別</strong></td>
									<td>${productBean.productTypeName}</td>
								</tr>

								<tr>
									<td><strong>商品介紹</strong></td>
									<td>${productBean.productIntro}</td>
								</tr>

								<tr>
									<td><strong>運費</strong></td>
									<td>${productBean.freight}</td>
								</tr>

								<tr>
									<td><strong>上架日期</strong></td>
									<td>${productBean.addDate}</td>
								</tr>

								<tr>
									<td><strong>預估下架日期</strong></td>
									<td>${productBean.removeEstDate}</td>
								</tr>

								<!-- 			<tr> -->
								<!-- 				<td>下架日期:</td> -->
								<%-- 				<td>${productBean.removeDate}</td> --%>
								<!-- 			</tr> -->

								<tr>
									<td><strong>商品狀態</strong></td>
									<td>${productBean.productStatusName}</td>
								</tr>

								<!-- 			<tr> -->
								<!-- 				<td>商品圖片及介紹：</td> -->
								<%-- 				<c:forEach items="${productPicList}" var="row"> --%>
								<%-- 					<td>商品圖片： <img src="../img/${row.pictureName}" width="100" --%>
								<%-- 						height="100" /><br>商品介紹：${row.pictureIntro}</td> --%>
								<%-- <%-- 					<td>商品介紹：${row.pictureIntro}</td> --%>
								<!-- 					<br> -->
								<%-- 				</c:forEach> --%>
								<!-- 			</tr> -->

								<tr>
									<td><strong>商品圖片及介紹</strong></td>


									<td width=140><c:forEach items="${productPicList}"
											var="row">
											<div class="col-md-8">
												<div class="thumbnail">
													<img src="../img/${row.pictureName}">
													<div class="caption">
														<h4>${row.pictureIntro}</h4>
														<input class='InputClass' type="file" name="picture1" />
													</div>
												</div>
											</div>
										</c:forEach></td>
								</tr>
							</table>
						</center>
					</center>
					<script src="../js/jquery.min.js"></script>
					<script src="../js/bootstrap.min.js"></script>
					<script src="../js/scripts.js"></script>
</body>
</html>