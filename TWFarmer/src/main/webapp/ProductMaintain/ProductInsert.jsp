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
			<table class="table-bordered">
				<thead>
					<tr>
						<th height="60" colspan="2" align="center">新增商品資料</th>
					</tr>
				</thead>
				<tbody>
					<!-- 					<tr> -->
					<!-- 						<td>商品編號：<br>*商品資料填寫完會產生，無需填寫</td> -->
					<%-- 						<td>${productBean.productId}</td> --%>
					<!-- 					</tr> -->

					<tr>
						<td>賣家ID：</td>
						<%-- ${範圍 . InsertProductServlet 第59行setAttributesetAttribute的key . ProductBean的變數} --%>
						<td>${sessionScope.product.sellerId}</td>
					</tr>

					<tr>
						<td>產地：</td>
						<%-- value=${param.name屬性值} --%>
						<td><input id='origin' name="origin" value="${param.origin}"
							type="text"> <%-- ${ErrorMsg(Map的key).origin(put的name)} --%>
							<div style="color: #FF0000; display: inline">${ErrorMsg.origin}</div>
					</tr>

					<tr>
						<td>商品名稱：</td>
						<td><input id='productName' name="productName"
							value="${param.productName}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.productName}</div>
					</tr>

					<tr>
						<td>庫存：</td>
						<td><input id='inventory' name="inventory"
							value="${param.inventory}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.inventory}</div>
					</tr>

					<tr>
						<td>單位價格：</td>
						<td><input id='price' name="price" value="${param.price}"
							type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.price}</div>
					</tr>

					<tr>
						<td>單位：</td>
						<td><select id='unit' name="unit">
								<option>箱</option>
								<option>顆</option>
								<option>斤</option>
								<option>公斤</option>
						</select>
							<div style="color: #FF0000; display: inline">${ErrorMsg.unitName}</div>
					</tr>

					<tr>
						<td>類別：</td>
						<td><select id="type" name="type">
								<option value="2101">仁果類</option>
								<option value="2102">核果類</option>
								<option value="2103">堅果類</option>
								<option value="2104">漿果類</option>
								<option value="2105">柑橘類</option>
								<option value="2106">瓜類</option>
								<option value="2107">根菜類</option>
								<option value="2108">莖菜類</option>
								<option value="2109">花菜類</option>
								<option value="2110">果菜類</option>
								<option value="2111">葉菜類</option>
								<option value="2112">香辛類</option>
								<option value="2113">菌藻類</option>
						</select>
							<div style="color: #FF0000; display: inline">${ErrorMsg.type}</div>
					</tr>

					<tr>
						<td>商品介紹：</td>
						<td><textarea id='productIntro' name="productIntro" cols="80"
								rows="8">${param.productIntro}</textarea>
					</tr>

					<tr>
						<td>運費：</td>
						<td><input id='freight' name="freight"
							value="${param.freight}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.freight}</div>
					</tr>

					<tr>
						<td>上架日期：</td>
						<td><input id='addDate' name="addDate"
							value="${param.addDate}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.addDate}</div>
					</tr>

					<tr>
						<td>預估下架日期：</td>
						<td><input id='removeEstDate' name="removeEstDate"
							value="${param.removeEstDate}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.removeEstDate}</div>
					</tr>

					<tr>
						<td>下架日期：</td>
						<td>商品下架才填</td>
					</tr>

					<tr>
						<td>商品狀態：</td>
						<td><select id='productStatusName' name="productStatusName">
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

					<tr>
						<td>最小件數：</td>
						<td><input id='minThreshold' name="minThreshold"
							value="${param.minThreshold}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.minThreshold}</div>
					</tr>

					<tr>
						<td>最大件數：</td>
						<td><input id='maxThreshold' name="maxThreshold"
							value="${param.maxThreshold}" type="text">
							<div style="color: #FF0000; display: inline">${ErrorMsg.maxThreshold}</div>
					</tr>

					<tr>
						<td>折扣後價格：</td>
						<td><input id='discountPrice' name="discountPrice"
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
						<td height="60" colspan="2" align="center"><input
							type="submit" name="Submit" value="新增" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>