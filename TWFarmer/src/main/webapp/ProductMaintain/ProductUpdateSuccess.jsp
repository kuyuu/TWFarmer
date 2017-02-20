<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-修改商品</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
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
									<td><fmt:formatDate value="${productBean.addDate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>

								<tr>
									<td><strong>預估下架日期</strong></td>
									<td><fmt:formatDate value="${productBean.removeEstDate}"
											pattern="yyyy-MM-dd" /></td>
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
								
								<c:forEach items="${productDiscountList}" var="x">
										
										<tr>
											<td><strong>最小件數</strong></td>
											<td>${x.minThreshold}</td>
										</tr>

										<tr>
											<td><strong>最大件數</strong></td>
											<td>${x.maxThreshold}</td>
										</tr>

										<tr>
											<td><strong>折扣後價格</strong></td>
											<td>${x.discountPrice}</td>
										</tr>
									</c:forEach>

<!-- 								<tr> -->
<!-- 									<td><strong>最小件數</strong></td> -->
<%-- 									<td>${productDiscountBean.minThreshold}</td> --%>
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td><strong>最大件數</strong></td> -->
<%-- 									<td>${productDiscountBean.maxThreshold}</td> --%>
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td><strong>折扣後價格</strong></td> -->
<%-- 									<td>${productDiscountBean.discountPrice}</td> --%>
<!-- 								</tr> -->

								<tr>
<!-- 									<td><strong>商品圖片及介紹</strong></td> -->

<%-- 									<td width=140><c:forEach items="${productPicList}" --%>
<%-- 											var="row"> --%>
<!-- 											<div class="col-md-8"> -->
<!-- 												<div class="thumbnail"> -->
<%-- 													<img src="../img/${row.pictureName}"> --%>
<!-- 													<div class="caption"> -->
<%-- 														<h4>${row.pictureIntro}</h4> --%>
<!-- 														<input class='InputClass' type="file" name="picture1" /> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<%-- 										</c:forEach></td> --%>
								</tr>
							
							<c:forEach items="${productPicList}"
											var="row">
											<div class="col-md-4">
												<div class="thumbnail">
													<img src="../img/${row.pictureName}">
													<div class="caption">
														<h4>${row.pictureIntro}</h4>
														
													</div>
												</div>
											</div>
										</c:forEach>

						</table><br><br>
						<a class="btn btn-default"
							href="../BackStage/SelectAllProductMaintainServlet" role="button">回商品管理頁面</a></div>
						</center>
					</center>
					<script src="../js/jquery.min.js"></script>
					<script src="../js/bootstrap.min.js"></script>
					<script src="../js/scripts.js"></script>
</body>
</html>