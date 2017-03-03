<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/BackStage/SelectAllProductMaintainServlet"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-新增商品</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
</style>
</head>
<body>
	
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../BackStage/backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<center>
						<!-- 上傳圖片的form表單，要增加enctype="multipart/form-data" -->
						<h2>新增商品資料</h2>
						<br>
						<form action="<c:url value="ProcessProductServlet" />"
							method="POST" enctype="multipart/form-data">
							<center>
								<table>
									<thead>
										<%-- 									<center> --%>

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
												value="${param.origin}" type="text" class="form-control">
												<%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
												<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div>
											</td>
										</tr>

										<tr height=60>
											<td><strong>商品名稱</strong></td>
											<td><input id='productName' name="productName"
												value="${param.productName}" type="text"
												class="form-control">
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
											<td><input id='price' name="price"
												value="${param.price}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
										</tr>

										<tr height=60>
											<td><strong>單位</strong></td>
											<td><select class="form-control" id='unit' name="unit">
													<option>請選擇單位</option>
													<option>箱</option>
													<option>顆</option>
													<option>斤</option>
													<option>公斤</option>
											</select>
												<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
										</tr>

										<tr height=60>
											<td><strong>類別</strong></td>
											<td><select class="form-control" id="productTypeName"
												name="productTypeName">
													<option>請選擇類別</option>
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
											<td><textarea class="form-control" id='productIntro'
													name="productIntro" cols="50" rows="8">${param.productIntro}</textarea>
										</tr>

										<tr height=60>
											<td><strong>運費</strong></td>
											<td><input id='freight' name="freight"
												value="${param.freight}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
										</tr>

										<tr height=60>
											<td><strong>上架日期</strong></td>
											<td><input id="datepicker" name="addDate"
												value="${param.addDate}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
										</tr>

										<tr height=60>
											<td><strong>預估下架日期</strong></td>
											<td><input id="datepicker2" name="removeEstDate"
												value="${param.removeEstDate}" type="text"
												class="form-control">
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
													<option>請選擇商品狀態</option>
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
											<td><input class="form-control" id='minThreshold'
												name="minThreshold" value="${param.minThreshold}"
												type="text">
												<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
										</tr>

										<tr height=60>
											<td><strong>最大件數</strong></td>
											<td><input class="form-control" id='maxThreshold'
												name="maxThreshold" value="${param.maxThreshold}"
												type="text">
												<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
										</tr>

										<tr height=60>
											<td width=140><strong>折扣後價格</strong></td>
											<td><input class="form-control" id='discountPrice'
												name="discountPrice" value="${param.discountPrice}"
												type="text">
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
												name="picture1" /><br>
												<div>
													<img class="preview"
														style="max-width: 150px; max-height: 150px;">
													<div class="size"></div>
												</div> 圖片2<input class='InputClass' type="file" name="picture2" /><br>
												<div>
													<img class="preview"
														style="max-width: 150px; max-height: 150px;">
													<div class="size"></div>
												</div>圖片3<input class='InputClass' type="file" name="picture3" /><br>
												<div>
													<img class="preview"
														style="max-width: 150px; max-height: 150px;">
													<div class="size"></div>
												</div>圖片4<input class='InputClass' type="file" name="picture4" /><br>
												<div>
													<img class="preview"
														style="max-width: 150px; max-height: 150px;">
													<div class="size"></div>
												</div>圖片5<input class='InputClass' type="file" name="picture5" /><br>
												<div>
													<img class="preview"
														style="max-width: 150px; max-height: 150px;">
													<div class="size"></div>
												</div>
												<div style="color: #FF0000; display: inline">${ErrorMsg.picture}</div>
										</tr>

										<tr height=60>
											<td><strong>商品圖片介紹</strong></td>
											<td><br>圖片1<input id='pictureIntro'
												name="pictureIntro1" value="${param.pictureIntro1}"
												type="text" class="form-control"> <br>圖片2<input
												id='pictureIntro' name="pictureIntro2"
												value="${param.pictureIntro2}" type="text"
												class="form-control"><br> 圖片3<input
												id='pictureIntro' name="pictureIntro3"
												value="${param.pictureIntro3}" type="text"
												class="form-control"><br> 圖片4<input
												id='pictureIntro' name="pictureIntro4"
												value="${param.pictureIntro4}" type="text"
												class="form-control"><br> 圖片5<input
												id='pictureIntro' name="pictureIntro5"
												value="${param.pictureIntro5}" type="text"
												class="form-control"><br>
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
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
		$(function() {
			$("#collapseOne").removeClass("panel-collapse collapse in")
					.addClass("panel-collapse collapse")
			$("#collapseTwo").removeClass("panel-collapse collapse").addClass(
					"panel-collapse collapse in")
			$("#collapseTwo>ul>li:eq(0)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-info")
		})
	</script>

	<script>
		$(function() {
			$("#datepicker").datepicker({
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});

		$(function() {
			$("#datepicker2").datepicker({
				altField : "#datepicker2",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});
	</script>
	<script>
		//顯示預覽圖
		$(function() {
			function format_float(num, pos) {
				var size = Math.pow(10, pos);
				return Math.round(num * size) / size;
			}

			function preview(input, p, s) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						p.attr('src', e.target.result);

						var KB = format_float(e.total / 1024, 2);
						s.text("檔案大小：" + KB + " KB");
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$("body").on("change", ".InputClass", function() {
				var pre = $(this).next().next().children();
				var siz = $(this).next().next().children().next();
				console.log(pre);
				preview(this, pre, siz);
			})

		})
	</script>
</body>
</html>