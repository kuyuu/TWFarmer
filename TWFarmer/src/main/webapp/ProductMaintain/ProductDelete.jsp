<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-變更商品</title>
<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/jquery.bootstrap-touchspin.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
body {
	padding-top: 70px;
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
					<!-- enctype="multipart/form-data" -->
					<!-- 上傳圖片的form表單，要增加enctype="multipart/form-data" -->
					<form
						action="<c:url value="/BackStage/DeleteTheProductServlet?productId=${productBean.productId}" />"
						method="POST" class="form-horizontal"
						enctype="multipart/form-data">
						<center>
							<table>
								<thead>
									<%-- 									<center> --%>
									<h2>變更商品資料</h2>
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
										<%-- value=${productBean.name屬性值} --%>
										<td width=300><input id='origin' name="origin"
											value="${productBean.origin}" type="text"
											class="form-control"> <%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
											<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div>
										</td>
									</tr>

									<tr height=60>
										<td><strong>商品名稱</strong></td>
										<td><input id='productName' name="productName"
											value="${productBean.productName}" type="text"
											class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.productName}</div>
									</tr>

									<tr height=60>
										<td><strong>庫存</strong></td>
										<td><input id='inventory' name="inventory"
											value="${productBean.inventory}" type="text"
											class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.inventory}</div>
									</tr>

									<tr height=60>
										<td><strong>單位價格</strong></td>
										<td><input id='price' name="price"
											value="${productBean.price}" type="text" class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
									</tr>

									<tr height=60>
										<td><strong>單位</strong></td>
										<td><select class="form-control" id='unit' name="unit">
												<option value="箱">箱</option>
												<option value="顆">顆</option>
												<option value="斤">斤</option>
												<option value="公斤">公斤</option>
										</select><input type="hidden" value="${productBean.unit}" name="unit" />
											<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
									</tr>

									<tr height=60>
										<td><strong>類別</strong></td>
										<td><select class="form-control" id="productTypeName"
											name="productTypeName">
												<option value="仁果類">仁果類</option>
												<option value="核果類">核果類</option>
												<option value="堅果類">堅果類</option>
												<option value="漿果類">漿果類</option>
												<option value="柑橘類">柑橘類</option>
												<option value="瓜類">瓜類</option>
												<option value="根菜類">根菜類</option>
												<option value="莖菜類">莖菜類</option>
												<option value="花菜類">花菜類</option>
												<option value="果菜類">果菜類</option>
												<option value="葉菜類">葉菜類</option>
												<option value="香辛類">香辛類</option>
												<option value="菌藻類">菌藻類</option>
												<option value="豆類">豆類</option>
										</select> <input type="hidden" value="${productBean.productTypeName}"
											name="type" />
											<div style="color: #FF0000; display: inline">${ErrorMsg.type}</div>
									</tr>

									<tr height=60>
										<td><strong>商品介紹</strong></td>
										<td><textarea class="form-control" id='productIntro'
												name="productIntro" cols="50" rows="8">${productBean.productIntro}</textarea>
									</tr>

									<tr height=60>
										<td><strong>運費</strong></td>
										<td><input id='freight' name="freight"
											value="${productBean.freight}" type="text"
											class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
									</tr>

									<tr height=60>
										<td><strong>上架日期</strong></td>
										<td><input id='datepicker' name="addDate"
											value="${productBean.addDate}" type="text"
											class="form-control">
											<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
									</tr>

									<tr height=60>
										<td><strong>預估下架日期</strong></td>
										<td><input id='datepicker2' name="removeEstDate"
											value="${productBean.removeEstDate}" type="text"
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
												<option value="上架">上架</option>
												<option value="下架">下架</option>
												<option value="刪除">刪除</option>
												<option value="封鎖">封鎖</option>
										</select><input type="hidden" value="${productBean.productStatusName}"
											name="productStatusName" /></td>

									</tr>

									<!-- 					<tr> -->
									<!-- 						<td>折扣編號：<br>*商品資料填寫完會產生，無需填寫 -->
									<!-- 						</td> -->
									<%-- 						<td>${productDiscountBean.discountId}</td> --%>

									<!-- 					</tr> -->

									<c:forEach items="${productDiscountList}" var="x">

										<td><input type="hidden" value="${x.discountId}"
											name="discountId" /></td>

										<tr height=60>
											<td><strong>最小件數</strong></td>
											<td><input id='minThreshold' name="minThreshold"
												value="${x.minThreshold}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
											</td>
										</tr>

										<tr height=60>
											<td><strong>最大件數</strong></td>
											<td><input id='maxThreshold' name="maxThreshold"
												value="${x.maxThreshold}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
											</td>
										</tr>

										<tr height=60>
											<td><strong>折扣後價格</strong></td>
											<td><input id='discountPrice' name="discountPrice"
												value="${x.discountPrice}" type="text" class="form-control">
												<div style="color: #FF0000; display: inline">${ErrorMsg.discountPrice}</div>
											</td>
										</tr>
									</c:forEach>


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

									<tr>
										<td><strong>商品圖片及介紹</strong></td>


										<td width=140><c:forEach items="${productPicList}"
												var="row" varStatus="name">
												<input type="hidden" value="${row.productPicId}"
													name="productPicId" />
												<div class="col-md-8">
													<div class="thumbnail">
														<img src="../img/${row.pictureName}">
														<div class="caption">
															<input type="text" value="${row.pictureIntro}"
																name="pictureIntro${name.count}">
															<%-- 															<h4>${row.pictureIntro}</h4> --%>
															<input class='InputClass' type="file"
																name="picture${name.count}" />
														</div>
													</div>
												</div>
											</c:forEach></td>
									</tr>

									<tr>
										<td height="100" colspan="2" align="center"><input
											class="btn btn-default" type="submit" value="修改"
											name="prodaction">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input class="btn btn-default" type="submit" value="刪除"
											name="prodaction">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
											class="btn btn-default" type="submit" value="下架"
											name="prodaction"></td>
									</tr>
								</tbody>
							</table>
						</center>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="/TWFarmer/js/jquery.bootstrap-touchspin.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

		$(function() {
			var list = $('#productTypeName').children();
			for (var i = 0; i < list.size(); i++) {
				if ($('input[name="type"]').val() == $(list[i]).val()) {
					$(list[i]).attr("selected", "value");
				}
			}
		});

		$(function() {
			var list = $('#unit').children();
			for (var j = 0; j < list.size(); j++) {
				if ($('input[name="unit"]').val() == $(list[j]).val()) {
					$(list[j]).attr("selected", "value");
				}
			}
		});

		$(function() {
			var list = $('#productStatusName').children();
			for (var k = 0; k < list.size(); k++) {
				if ($('input[name="productStatusName"]').val() == $(list[k])
						.val()) {
					$(list[k]).attr("selected", "value");
				}
			}
		});
	</script>
	<script>
		//顯示預覽圖
		$(function() {
			function format_float(num, pos) {
				var size = Math.pow(10, pos);
				return Math.round(num * size) / size;
			}

			function preview(input, p) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						p.attr('src', e.target.result);

// 						var KB = format_float(e.total / 1024, 2);
// 						s.text("檔案大小：" + KB + " KB");
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$("body").on("change", ".InputClass", function() {
				var pre = $(this).parent().parent().children();
// 				var siz = $(this).next().next().children().next();
				console.log(pre);
				preview(this, pre);
			})

		})
	</script>
</body>
</html>