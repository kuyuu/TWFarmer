<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/ProductServlet?productId=${productBean.productId}"
		scope="session" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">

<style>
* {
	box-sizing: border-box
}

/* body {
	font-family: Verdana, sans-serif;
} */
.mySlides {
	display: none
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	max-height: 600px;
	position: relative;
	margin: auto;
}

/* Caption text */
/* .text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
} */

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

* /
	/* The dots/bullets/indicators */              
	                                      
.dot {
	height: 13px;
	width: 13px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

/* .active {
	background-color: #717171;
} */

/* Fading animation */
.fadeAlt {
	-webkit-animation-name: fadeAlt;
	-webkit-animation-duration: 1.5s;
	animation-name: fadeAlt;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fadeAlt {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fadeAlt {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}

body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/common/menuProduct.jsp" />
		<div class="row jumbotron">
			<!-- 			<div class="jumbotron"> -->
			<div class="col-md-4">
				<%-- <c:forEach items="${picList}" var="x">
								<img src="img/${x.pictureName}" style="width: 100%;" />
							</c:forEach> --%>

				<div class="ThisIsTheSlider">
					<!-- 								<div class="text" -->
					<!-- 									style="color: #6133FF; font-weight: bold; font-size: 16px">୧༼✿ -->
					<!-- 									͡◕ д ◕͡ ༽୨商品皆為賣方提供，恕不代表本站立場୧༼✿ ͡◕ д ◕͡ ༽୨</div> -->
					<!-- 								<div class="text" style="color: #0F7C58; font-weight: bold">(q^-^)q貨比三家不吃虧下單前請先充分聯繫賣家 -->
					<!-- 									(p^-^)p</div> -->
					<c:forEach items="${picList}" var="x" varStatus="y">
						<div class="mySlides fadeAlt">
							<%-- <center>
										<div class="numbertext"></div>
									</center> --%>
							<img src="img/${x.pictureName}" style="width: 80%"> <br>
							<div class="text">${x.pictureIntro}</div>

							<br>
						</div>
						<c:if test="${y.last}">
							<c:set var="count" value="${y.count}" />
						</c:if>
					</c:forEach>
					<div style="text-align: center">
						<c:forEach begin="1" end="${count}">
							<span class="dot"></span>
						</c:forEach>
					</div>
				</div>
				<ul class="preview-thumbnail nav nav-tabs">
					<c:forEach items="${picList}" var="x">
						<li class="active">
							<%-- 						<a data-target="#pic<c:out value='${i}'/>" data-toggle="tab">  --%>
							<span style="height: '100px';"> <img
								src="img/${x.pictureName}" /></span> <!-- 						</a> -->
						</li>
					</c:forEach>
				</ul>
			</div>



			<!-- 							原始檔 -->
			<!-- 			<div class="ThisIsTheSlider"> -->
			<!-- 												<div class="text" -->
			<!-- 													style="color: #6133FF; font-weight: bold; font-size: 16px">୧༼✿ -->
			<!-- 													͡◕ д ◕͡ ༽୨商品皆為賣方提供，恕不代表本站立場୧༼✿ ͡◕ д ◕͡ ༽୨</div> -->
			<!-- 												<div class="text" style="color: #0F7C58; font-weight: bold">(q^-^)q貨比三家不吃虧下單前請先充分聯繫賣家 -->
			<!-- 													(p^-^)p</div> -->
			<%-- 				<c:forEach items="${picList}" var="x" varStatus="y"> --%>
			<!-- 					<div class="mySlides fadeAlt"> -->
			<%-- 						<center>
<%-- 										<div class="numbertext"></div> --%>
			<%-- 									</center> --%>
			<%-- 						<img src="img/${x.pictureName}" style="width: 80%"> <br> --%>
			<%-- 						<div class="text">${x.pictureIntro}</div> --%>

			<!-- 						<br> -->
			<!-- 					</div> -->
			<%-- 					<c:if test="${y.last}"> --%>
			<%-- 						<c:set var="count" value="${y.count}" /> --%>
			<%-- 					</c:if> --%>
			<%-- 				</c:forEach> --%>
			<!-- 				<div style="text-align: center"> -->
			<%-- 					<c:forEach begin="1" end="${count}"> --%>
			<!-- 						<span class="dot"></span> -->
			<%-- 					</c:forEach> --%>
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 		</div> -->
			<div class="col-md-8">
				<h1>${productBean.productName}</h1>
				<h4>
					賣家：${productBean.memberBean.name}(${productBean.memberBean.account})<a
						href="Message/NewMessage.do?readerAccount=${productBean.memberBean.account}"
						class="btn btn-default"><span
						class="glyphicon glyphicon-envelope"></span></a>
				</h4>
				<p>${productBean.productIntro }</p>
				<p>${productBean.price }元/${productBean.unit}</p>
				<p>


					<!-- 					<a -->
					<%-- 						href="<c:url value="Order/NewOrderServlet?productId=${productBean.productId}&sellerId=${productBean.sellerId}" />" --%>
					<!-- 						class="btn btn-default">購買商品</a> -->
					<button type="button" class="btn btn-default" id="newOrder">購買商品</button>
					<button type="button" class="btn btn-primary" id="newJp">發起合購</button>
					<a
						href="PurchaseSelect/PurchaseSelect.controller?keyword=${productBean.productName}&district=&district2="><button
							type="button" class="btn btn-success">我想跟團</button></a>


					<button type="button" class="btn btn-info" id="cart"
						data-trigger="focus" data-placement="top" data-toggle="popover"
						data-content="已加入購物車">加入購物車</button>
					<c:choose>
						<c:when test="${not empty LoginOK}">
							<button type="button" class="btn btn-warning" id="track"
								data-trigger="focus" data-placement="top" data-toggle="popover"
								data-content="已追蹤商品">追蹤商品</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-warning" id="trackError"
								data-trigger="focus" data-placement="top" data-toggle="popover"
								data-content="請先登入">追蹤商品</button>
						</c:otherwise>
					</c:choose>

					<a
						href="Violation/violationForm.jsp?productId=${productBean.productId}"><button
							type="button" class="btn btn-danger">檢舉商品</button></a>
				</p>
				<hr>
				<form action="/TWFarmer/QnAInsertServlet" style="margin: 10px"
					method="POST">
					<c:if test="${empty QnA}">
						<h4>目前沒有問與答</h4>
					</c:if>
					<c:if test="${not empty QnA}">
						<h3>問與答</h3>
						<c:forEach var="row" items="${QnA}">
							<div>
								<%-- 									<p style="background: #DDDDDD">賣家提問:${row.qnAContent}</p> --%>
								<%-- 									<p>　　${row.reQnA}</p> --%>
								<table style="line-height: 35px; width: 620px">
									<tr style="background: #FFDDAA">
										<td style="width: 70%; font-size: 20px">${row.queryName}提問：${row.qnAContent}</td>
										<td style="width: 30%"><fmt:formatDate
												value="${row.queryDate}" pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
									<tr>
										<td style="width: 80%; font-size: 20px">${productBean.memberBean.name}回覆：${row.reQnA}</td>
										<td style="width: 20%"><fmt:formatDate
												value="${row.reDate}" pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:if>
					<input type="hidden" name="memberId" value="${LoginOK.memberId}" />
					<input type="hidden" name="productId" id="productId"
						value="${productBean.productId}" />
					<div class="form-group">
						<label class="">我要發問</label>
						<textarea id="QnA" name="QnA" class="form-control" rows="5"></textarea>
						<h4>${errors.QnAerror}</h4>
						<button type="submit" class="btn btn-default">送出</button>
						<button type="button" class="btn btn-default" id="clearQnA"
							onclick="ClearFields();">清除</button>
					</div>
				</form>
			</div>
			<!-- 			</div> -->
		</div>

	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>
	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 4000); // Change image every 4 seconds
		}

		function ClearFields() {
			document.getElementById("QnA").value = "";
		}

		$(function() {
			$('[data-toggle="popover"]').popover();
			//購物車
			$('#cart').click(function() {
				$.get('shoppingCart/AddShoppingCart.do', {
					"productId" : $('#productId').val()
				});
			});
			//發起合購
			$('#newJp')
					.click(
							function() {
								$
										.ajax({
											url : 'shoppingCart/AddShoppingCart.do',
											data : {
												"productId" : $('#productId')
														.val()
											},
											complete : function() {
												window.location = 'JointPurchase/NewJointPurchaseServlet?productId='
														+ $('#productId').val();
											}
										});
							});
			//購買商品2
			$('#newOrder')
					.click(
							function() {
								$
										.ajax({
											url : 'shoppingCart/AddShoppingCart.do',
											data : {
												"productId" : $('#productId')
														.val()
											},
											complete : function() {
												window.location = 'Order/StarOrder.do?productId='
														+ $('#productId').val();
											}
										});
							});
			$('#track').click(function() {
				$.ajax({
					url : 'TrackProduct/AddTrackProduct.do',
					type : 'POST',
					data : {
						"productId" : $('#productId').val()
					},
					complete : function() {
						// 						alert('Add TrackProduct');
					}
				});
			});
		});
	</script>

</body>
</html>