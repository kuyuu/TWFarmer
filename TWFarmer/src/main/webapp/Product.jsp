<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>??</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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
</style>
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
					<a class="navbar-brand" href="/TWFarmer/index.jsp">?啁撠噙</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="ProductSelect/ProductSelect.jsp">鞈潸眺?祆?</a></li>
						<li><a href="PurchaseSelect/PurchaseSelect.jsp">?頃撠?</a></li>
						<li><a href="#">鞈潛頠?/a></li>
					</ul>
					<c:choose>
						<c:when test="${empty LoginOK}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">閮餃?</a>
								</li>
								<li><a href="/TWFarmer/Login.jsp">?餃</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/TWFarmer/Msg/MsgCheckingServlet">蝡靽?/a></li>
								<li><a href="#">?撠?</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">??</button>
					</form>
				</div>
				</nav>
				<div class="row">
					<div class="jumbotron">
						<div class="col-md-4">
							<%-- <c:forEach items="${picList}" var="x">
								<img src="img/${x.pictureName}" style="width: 100%;" />
							</c:forEach> --%>
							<div class="ThisIsTheSlider">
								<div class="text"
									style="color: #7C630F; font-weight: bold; font-size: 25px">??撖怎?</div>
								<br>
								<div class="text"
									style="color: #6133FF; font-weight: bold; font-size: 16px">酯抉撮??
									矷??迡 ??鉏賞郃???鞈???嚗?銝誨銵冽蝡??毯郁鉏潑 矷??迡 ??鉏賞郃</div>
								<div class="text" style="color: #0F7C58; font-weight: bold">(q^-^)q鞎冽?銝振銝??找??桀?隢????舐鼠鞈?振
									(p^-^)p</div>
								<c:forEach items="${picList}" var="x" varStatus="y">

									<div class="mySlides fadeAlt">
										<%-- <center>
										<div class="numbertext"></div>
									</center> --%>
										<div class="text">${x.pictureIntro}</div>
										<img src="img/${x.pictureName}" style="width: 80%"> <br>
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
						</div>
						<div class="col-md-8">
							<h1>${productBean.productName}</h1>
							<p>${productBean.productIntro }</p>
							<p>${productBean.price }/${productBean.unit }</p>
							<p>
								<a
									href="<c:url value="Order/NewOrderServlet?productId=${productBean.productId}&sellerId=${productBean.sellerId}" />"
									class="btn btn-default">鞈潸眺??</a> <a
									href="JointPurchase/NewJointPurchaseServlet?memberId=${LoginOK.memberId}&productId=${productBean.productId}"><button
										type="button" class="btn btn-default">?潸絲?頃</button></a>
								<button type="button" class="btn btn-default">?頝?</button>
								<button type="button" class="btn btn-default">?鞈潛頠?/button>
							</p>
							<c:if test="${not empty keyword}">
								<c:forEach var="row" items="${keyword}">
									<table>

									</table>
								</c:forEach>


							</c:if>

							<form
								style="border: 1px solid; border-radius: 20px; padding: 15px">
								<c:if test="${not empty QnA}">
									<h3>??蝑?/h3>
									<c:forEach var="row" items="${QnA}">
										<div>
											<p style="background: #DDDDDD">鞎瑕振??:${row.qnAContent}</p>
											<p>${row.reQnA}</p>
										</div>
									</c:forEach>
								</c:if>
								<div class="form-group">
									<label class="">???澆?</label>
									<textarea id="QnA" class="form-control" rows="5"></textarea>
									<button type="submit" class="btn btn-default">?</button>
									<button type="button" class="btn btn-default" id="clearQnA"
										onclick="ClearFields();">皜</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#clearQnA").click(function() {
			$("#QnA").val('');
		})
	</script>
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
	</script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>