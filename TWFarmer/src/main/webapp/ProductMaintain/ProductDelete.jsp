<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<a href="#" class="list-group-item active">管理商品</a> <a href="../BackStage/farmerCheckJpDetail.jsp"
						class="list-group-item">審核合購</a> <a href="#"
						class="list-group-item">管理賣場資料</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<!-- enctype="multipart/form-data" -->
					<!-- 上傳圖片的form表單，要增加enctype="multipart/form-data" -->
					<form
						action="<c:url value="/BackStage/DeleteTheProductServlet?productId=${productBean.productId}" />"
						method="POST" class="form-horizontal">

						<center>
							<h2>變更商品資料</h2>
							<br>
						</center>


						<!-- 					<tr> -->
						<!-- 						<td>商品編號：</td> -->
						<%-- 						<td>${productBean.productId}</td> --%>
						<!-- 					</tr> -->

						<!-- 					<tr> -->
						<!-- 						<td>賣家ID：</td> -->
						<%-- 						${範圍 . InsertProductServlet 第59行setAttributesetAttribute的key . ProductBean的變數} --%>
						<%-- 						<td>${sessionScope.product.sellerId}</td> --%>
						<!-- 					</tr> -->

						<div class="form-group">
							<label for="origin"
								class="col-sm-offset-2 col-sm-2 control-label" width=300>產地：</label>
							<%-- value=${productBean.name屬性值} --%>
							<div class="col-sm-4">
								<input id='origin' name="origin" value="${productBean.origin}"
									type="text" class="form-control">
								<%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
								<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div>
							</div>
						</div>

						<div class="form-group">
							<label for="productName"
								class="col-sm-offset-2 col-sm-2 control-label">商品名稱：</label>
							<div class="col-sm-4">
								<input id='productName' name="productName"
									value="${productBean.productName}" type="text"
									class="form-control">
								<div style="color: #FF0000; display: inline">${ErrorMsg.productName}</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inventory"
								class="col-sm-offset-2 col-sm-2 control-label">庫存：</label>
							<div class="col-sm-4">
								<input id='inventory' name="inventory"
									value="${productBean.inventory}" type="text"
									class="form-control">
							</div>
							<div style="color: #FF0000; display: inline">${ErrorMsg.inventory}</div>

						</div>

						<div class="form-group">
							<label for="price" class="col-sm-offset-2 col-sm-2 control-label">單位價格：</label>
							<div class="col-sm-4">
								<input id='price' name="price" value="${productBean.price}"
									type="text" class="form-control">
							</div>
							<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
						</div>

						<div class="form-group">
							<label for="unit" class="col-sm-offset-2 col-sm-2 control-label">單位：</label>
							<div class="col-sm-4">
								<input id='unit' name="unit" value="${productBean.unit}"
									type="text" class="form-control">
							</div>
							<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
						</div>

						<div class="form-group">
							<label for="productTypeName"
								class="col-sm-offset-2 col-sm-2 control-label">類別：</label>
							<div class="col-sm-4">
								<input id='productTypeName' name="productTypeName"
									value="${productBean.productTypeName}" type="text"
									class="form-control">
							</div>
							<div style="color: #FF0000; display: inline">${ErrorMsg.type}</div>
						</div>

						<div class="form-group">
							<label for="productIntro"
								class="col-sm-offset-2 col-sm-2 control-label">商品介紹：</label>
							<div class="col-sm-4">
								<textarea id='productIntro' name="productIntro"
									class="form-control" rows="3">${productBean.productIntro}</textarea>
								<p class="help-block">限制300字</p>
							</div>
						</div>

						<div class="form-group">
							<label for="freight"
								class="col-sm-offset-2 col-sm-2 control-label">運費：</label>
							<div class="col-sm-4">
								<input id='freight' name="freight"
									value="${productBean.freight}" type="text" class="form-control">
								<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
							</div>
						</div>

						<div class="form-group">
							<label for="addDate"
								class="col-sm-offset-2 col-sm-2 control-label">上架日期：</label>
							<div class="col-sm-4">
								<input id='addDate' name="addDate"
									value="${productBean.addDate}" type="text" class="form-control">
								<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
							</div>
						</div>

						<div class="form-group">
							<label for="removeEstDate"
								class="col-sm-offset-2 col-sm-2 control-label">預估下架日期：</label>
							<div class="col-sm-4">
								<input id='removeEstDate' name="removeEstDate"
									value="${productBean.removeEstDate}" type="text"
									class="form-control">
								<div style="color: #FF0000; display: inline">${ErrorMsg.removeEstDate}</div>
							</div>
						</div>

						<!-- 			<div class="form-group"> -->
						<!-- 				<label for="removeDate" class="col-sm-2 control-label">下架日期：</label> -->
						<!-- 				<strong>商品下架才填</strong> -->
						<!-- 			</div> -->

						<!-- 					<tr> -->
						<!-- 						<td>商品狀態：</td> -->
						<!-- 						<td><select id='productStatusName' name="productStatusName"> -->
						<!-- 								<option>上架</option> -->
						<!-- 								<option>下架</option> -->
						<!-- 								<option>封鎖</option> -->
						<!-- 						</select></td> -->

						<!-- 					</tr> -->
						<c:forEach items="${productDiscountList}" var="x">
							<div class="form-group">
								<label for="minThreshold"
									class="col-sm-offset-2 col-sm-2 control-label">最小件數：</label>
								<div class="col-sm-4">
									<input id='minThreshold' name="minThreshold"
										value="${x.minThreshold}" type="text" class="form-control">
									<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
								</div>
							</div>

							<div class="form-group">
								<label for="minThreshold"
									class="col-sm-offset-2 col-sm-2 control-label">最大件數：</label>
								<div class="col-sm-4">
									<input id='maxThreshold' name="maxThreshold"
										value="${x.maxThreshold}" type="text" class="form-control">
									<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
								</div>
							</div>

							<div class="form-group">
								<label for="minThreshold"
									class="col-sm-offset-2 col-sm-2 control-label">折扣後價格：</label>
								<div class="col-sm-4">
									<input id='discountPrice' name="discountPrice"
										value="${x.discountPrice}" type="text" class="form-control">
									<div style="color: #FF0000; display: inline">${ErrorMsg.discountPrice}</div>
								</div>
							</div>
						</c:forEach>

						<!-- 					<tr> -->
						<!-- 						<td>商品圖片：</td> -->
						<!-- 						<td>圖片1<input class='InputClass' type="file" name="picture1" /><br> -->
						<!-- 							圖片2<input class='InputClass' type="file" name="picture2" /><br> -->
						<!-- 							圖片3<input class='InputClass' type="file" name="picture3" /><br> -->
						<!-- 							圖片4<input class='InputClass' type="file" name="picture4" /><br> -->
						<!-- 							圖片5<input class='InputClass' type="file" name="picture5" /><br> -->
						<%-- 							<div style="color: #FF0000; display: inline">${ErrorMsg.picture}</div> --%>
						<!-- 					</tr> -->

						<!-- 					<tr> -->
						<!-- 						<td>商品圖片介紹：</td> -->
						<!-- 						<td>圖片1<input id='pictureIntro' name="pictureIntro1" -->
						<%-- 							value="${productPicBean.pictureIntro1}" type="text"><br> --%>
						<!-- 							圖片2<input id='pictureIntro' name="pictureIntro2" -->
						<%-- 							value="${productPicBean.pictureIntro2}" type="text"><br> --%>
						<!-- 							圖片3<input id='pictureIntro' name="pictureIntro3" -->
						<%-- 							value="${productPicBean.pictureIntro3}" type="text"><br> --%>
						<!-- 							圖片4<input id='pictureIntro' name="pictureIntro4" -->
						<%-- 							value="${productPicBean.pictureIntro4}" type="text"><br> --%>
						<!-- 							圖片5<input id='pictureIntro' name="pictureIntro5" -->
						<%-- 							value="${productPicBean.pictureIntro5}" type="text"><br> --%>
						<!-- 					</tr> -->

						<!-- 					<tr> -->
						<!-- 					<div class="form-group"> -->
						<!-- 						<label for="pictureIntro" class="col-sm-2 control-label">商品圖片：</label> -->
						<%-- 						<c:forEach items="${productPicList}" var="row"> --%>
						<%-- 							<img src="../img/${row.pictureName}" width="100" --%>
						<!-- 								height="100" class="img-rounded" /> -->
						<%-- 						</c:forEach> --%>
						<!-- 					</div> -->

						<!-- 					<div class="form-group"> -->
						<!-- 						<label for="pictureIntro" class="col-sm-2 control-label">商品介紹：</label> -->
						<%-- 						<c:forEach items="${productPicList}" var="y"> --%>
						<!-- 							<div class="col-sm-4"> -->
						<!-- 								<input id='pictureIntro' name="pictureIntro" -->
						<%-- 							value="${y.pictureIntro}" type="text" class="form-control"> --%>
						<!-- 							</div>			 -->
						<!-- 						<br> -->
						<%-- 						</c:forEach> --%>
						<!-- 					</div> -->

						<div class="form-group">
							<label for="picture"
								class="col-sm-offset-2 col-sm-2 control-label">商品圖片及介紹：</label>


							<div class="row col-md-offset-2">
								<c:forEach items="${productPicList}" var="row">
									<div class="col-md-4">
										<div class="thumbnail">
											<img src="../img/${row.pictureName}">
											<div class="caption">
												<h4>${row.pictureIntro}</h4>
												<input class='InputClass' type="file" name="picture1" />
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>


						<div class="form-group">
							<div class="col-sm-offset-5 col-sm-4">
								<p>
									<input class="btn btn-default" type="submit" value="修改"
										name="prodaction"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										class="btn btn-default" type="submit" value="刪除"
										name="prodaction">
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>

			<script src="../js/jquery.min.js"></script>
			<script src="../js/bootstrap.min.js"></script>
			<script src="../js/scripts.js"></script>
</body>
</body>
</html>