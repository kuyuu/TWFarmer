<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<title>台灣小農</title>

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
		<jsp:include page="common/menu.jsp" />
		<div class="container">
			<div class="row">
				<div class="carousel slide" id="carousel-285061" style="margin-right:2%;">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-285061"></li>
						<li data-slide-to="1" data-target="#carousel-285061"></li>
						<li data-slide-to="2" data-target="#carousel-285061"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="Carousel Bootstrap First" src="img/slides/1.jpg">
							<div class="carousel-caption">
								<h4>自動化收割機的精耕細作</h4>
								<button type="button" id="Know1" class="btn btn-success btn-lg"
									onclick="location.href='#ourservice'">Know more</button>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Second" src="img/slides/2.jpg">
							<div class="carousel-caption">
								<h4>台灣農業具有多樣性</h4>
								<button type="button" id="Know1" class="btn btn-success btn-lg"
									onclick="location.href='#ourservice'"
									style="-moz-transition: 0.5s; -ms-transition: 0.5s; -o-transition: 0.5s; -webkit-transition: 0.5s; transition: 0.5s;">
									Know more</button>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Third" src="img/slides/3.jpg">
							<div class="carousel-caption">
								<button type="button" id="Know1" class="btn btn-success btn-lg"
									onclick="location.href='#ourservice'">Know more</button>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-285061"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-285061"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>

				<!-- 				SLIDE SHOW結束 -->

				<!-- 				our service -->

				<div class="row" id="ourservice">
					<div class="title text-center" style="margin: 5%;">
						<h2>
							OUR <span style="color: #6CB670;">SERVICE</span>
						</h2>
						<div class="border"></div>
					</div>
				</div>
				<div class="row" style="margin-bottom: 5%;">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail First"
								src="/TWFarmer/img/index/index-product.jpg">
							<div class="caption">
								<h3>蔬果購買區</h3>
								<p>台灣在地小農親自培育的各式蔬果任君挑選!</p>
								<p>
									<a class="btn btn-primary" href="/TWFarmer/ProductSelect/ProductSelectAllServlet">馬上選購</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Second"
								src="/TWFarmer/img/index/index-JP.jpg">
							<div class="caption">
								<h3>合購專區</h3>
								<p>有喜歡的水果卻找不到朋友與您分享嗎? 
								合購專區幫您找到您匯總所在區域的合購團, 
								讓您與附近的鄰居一起分享健康美味好蔬果!</p>
								<p>
									<a class="btn btn-primary" href="/TWFarmer/PurchaseSelect/PurchaseSelect.jsp">尋找合購</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Third"
								src="/TWFarmer/img/index/index-member.jpg">
							<div class="caption">
								<h3>會員專區</h3>
								<p>會員專區匯總所有關於您的帳號資訊, 
								幫助您確認訂單. 修改資料一目了然</p>
								<p>
									<a class="btn btn-primary" href="/TWFarmer/BackStage/WelcomeMember.jsp">進入會員專區</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>

</body>
</html>