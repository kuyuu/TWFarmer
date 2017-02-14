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
	<center>
		<!-- 上傳圖片的form表單，要增加enctype="multipart/form-data" -->
		<form action="<c:url value="ProcessProductServlet" />" method="POST"
			enctype="multipart/form-data">
			<%-- 			<center> --%>
			<h2>新增商品資料</h2>
			<%-- 			</center> --%>
			<!-- 					<tr> -->
			<!-- 						<td>商品編號：<br>*商品資料填寫完會產生，無需填寫</td> -->
			<%-- 						<td>${productBean.productId}</td> --%>
			<!-- 					</tr> -->


			<div class="form-group">
				<label for="memberId" class="col-sm-2 control-label">賣家ID：</label>
				<%-- ${範圍 . InsertProductServlet 第59行setAttributesetAttribute的key . ProductBean的變數} --%>
				<div class="col-sm-6">
					<p id="memberId" class="form-control-static">${sessionScope.product.sellerId}</p>
				</div>
			</div>


			<div class="form-group">
				<label for="origin" class="col-sm-2 control-label">產地：</label>
				<%-- value=${param.name屬性值} --%>
				<div class="col-sm-4">
					<input id='origin' name="origin" value="${param.origin}"
						type="text" class="form-control">
					<%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
					<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="productName" class="col-sm-2 control-label">商品名稱：</label>
				<div class="col-sm-4">
					<input id='productName' name="productName"
						value="${param.productName}" type="text" class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.productName}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="inventory" class="col-sm-2 control-label">庫存：</label>
				<div class="col-sm-4">
					<input id='inventory' name="inventory" value="${param.inventory}"
						type="text" class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.inventory}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-2 control-label">單位價格：</label>
				<div class="col-sm-4">
					<input id='price' name="price" value="${param.price}" type="text"
						class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="unit" class="col-sm-2 control-label">單位：</label>
				<div class="col-sm-6">
					<select id='unit' name="unit">
						<option>箱</option>
						<option>顆</option>
						<option>斤</option>
						<option>公斤</option>
					</select>
					<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="productTypeName" class="col-sm-2 control-label">類別：</label>
				<div class="col-sm-6">
					<select id="productTypeName" name="productTypeName">
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
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-2 control-label">商品介紹：</label>
				<div class="col-sm-6">
					<textarea id='productIntro' name="productIntro" cols="80" rows="8">${param.productIntro}</textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="freight" class="col-sm-2 control-label">運費：</label>
				<div class="col-sm-4">
					<input id='freight' name="freight" value="${param.freight}"
						type="text" class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="addDate" class="col-sm-2 control-label">上架日期：</label>
				<div class="col-sm-4">
					<input id='addDate' name="addDate" value="${param.addDate}"
						type="text" class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="removeEstDate" class="col-sm-2 control-label">預估下架日期：</label>
				<div class="col-sm-4">
					<input id='removeEstDate' name="removeEstDate"
						value="${param.removeEstDate}" type="text" class="form-control">
					<div style="color: #FF0000; display: inline">${ErrorMsg.removeEstDate}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="removeEstDate" class="col-sm-2 control-label">下架日期：</label>
				<div class="col-sm-4">商品下架才填</div>
			</div>

			<div class="form-group">
				<label for="removeEstDate" class="col-sm-2 control-label">商品狀態：</label>
				<div class="col-sm-6">
					<select id='productStatusName' name="productStatusName">
						<option>上架</option>
						<option>下架</option>
						<option>封鎖</option>
					</select>
				</div>

			</div>

			<!-- 					<tr> -->
			<!-- 						<td>折扣編號：<br>*商品資料填寫完會產生，無需填寫 -->
			<!-- 						</td> -->
			<%-- 						<td>${productDiscountBean.discountId}</td> --%>

			<!-- 					</tr> -->

			<div class="form-group">
				<label for="origin" class="col-sm-2 control-label">最小件數：</label>
				<div class="col-sm-4">
					<input id='minThreshold' name="minThreshold"
						value="${param.minThreshold}" type="text">
					<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="maxThreshold" class="col-sm-2 control-label">最大件數：</label>
				<div class="col-sm-4">
					<input id='maxThreshold' name="maxThreshold"
						value="${param.maxThreshold}" type="text">
					<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="discountPrice" class="col-sm-2 control-label">折扣後價格：</label>
				<div class="col-sm-4">
					<input id='discountPrice' name="discountPrice"
						value="${param.discountPrice}" type="text">
					<div style="color: #FF0000; display: inline">${ErrorMsg.discountPrice}</div>
				</div>
			</div>

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
				<td>商品圖片：</td>
				<td>圖片1<input class='InputClass' type="file" name="picture1" /><br>
					圖片2<input class='InputClass' type="file" name="picture2" /><br>
					圖片3<input class='InputClass' type="file" name="picture3" /><br>
					圖片4<input class='InputClass' type="file" name="picture4" /><br>
					圖片5<input class='InputClass' type="file" name="picture5" /><br>
					<div style="color: #FF0000; display: inline">${ErrorMsg.picture}</div>
			</tr>

			<tr>
				<td>商品圖片介紹：</td>
				<td>圖片1<input id='pictureIntro' name="pictureIntro1"
					value="${param.pictureIntro1}" type="text"><br> 圖片2<input
					id='pictureIntro' name="pictureIntro2"
					value="${param.pictureIntro2}" type="text"><br> 圖片3<input
					id='pictureIntro' name="pictureIntro3"
					value="${param.pictureIntro3}" type="text"><br> 圖片4<input
					id='pictureIntro' name="pictureIntro4"
					value="${param.pictureIntro4}" type="text"><br> 圖片5<input
					id='pictureIntro' name="pictureIntro5"
					value="${param.pictureIntro5}" type="text"><br>
			</tr>

			<tr>
				<td height="60" colspan="2" align="center"><input type="submit"
					name="Submit" value="新增" /></td>
			</tr>
			<!-- 				</tbody> -->
			<!-- 			</table> -->
		</form>
	</center>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>