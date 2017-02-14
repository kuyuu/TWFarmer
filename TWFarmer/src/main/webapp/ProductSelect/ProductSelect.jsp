<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>購買蔬果</title>
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
						<li class="active"><a href="#">購買蔬果</a></li>
						<li><a href="../PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
						<li><a href="#">購物車</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="../MemberSubmit/MemberSubmit.jsp">註冊</a></li>
						<li><a href="../Login.jsp">登入</a></li>
					</ul>
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
		<form
			action="<c:url value="/ProductSelect/ProductSelect.controller" />"
			method="get" class="">
			<div class="row">
				<div class="col-md-3">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne"> 蔬菜分類 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<select class="form-control" id='selectBy' name="selectBy">
										<option value="">請選擇分類</option>
										<option value="瓜類">瓜類</option>
										<option value="豆類">豆類</option>
										<option value="根菜類">根菜類</option>
										<option value="莖菜類">莖菜類</option>
										<option value="花菜類">花菜類</option>
										<option value="果菜類">果菜類</option>
										<option value="葉菜類">葉菜類</option>
										<option value="香辛類">香辛類</option>
										<option value="菌藻類">菌藻類</option>

									</select>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo"> 水果分類 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<select class="form-control" id='selectBy2' name="selectBy2">
										<option value="">請選擇分類</option>
										<option value="仁果類">仁果類</option>
										<option value="核果類">核果類</option>
										<option value="堅果類">堅果類</option>
										<option value="漿果類">漿果類</option>
										<option value="柑橘類">柑橘類</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">

						<div class="col-md-9">
							<h3>商品搜尋</h3>
							<h2></h2>
							<div class="form-group">
								<label class="">搜尋</label>
								<div class="">
									<input type="text" name="keyword" class="form-control" value="">
								</div>
							</div>
							<!-- 							<div class="form-group"> -->
							<!-- 								<label class="">分類搜尋</label> -->
							<!-- 								<div class=""> -->
							<!-- 									<select class="form-control" id='selectBy' name="selectBy"> -->
							<!-- 										<option value="">請選擇分類</option> -->
							<!-- 										<option value="仁果類">仁果類</option> -->
							<!-- 										<option value="核果類">核果類</option> -->
							<!-- 										<option value="堅果類">堅果類</option> -->
							<!-- 										<option value="漿果類">漿果類</option> -->
							<!-- 										<option value="柑橘類">柑橘類</option> -->
							<!-- 										<option value="瓜類">瓜類</option> -->
							<!-- 										<option value="根菜類">根菜類</option> -->
							<!-- 										<option value="莖菜類">莖菜類</option> -->
							<!-- 										<option value="花菜類">花菜類</option> -->
							<!-- 										<option value="果菜類">果菜類</option> -->
							<!-- 										<option value="葉菜類">葉菜類</option> -->
							<!-- 										<option value="香辛類">香辛類</option> -->
							<!-- 										<option value="菌藻類">菌藻類</option> -->
							<!-- 										<option value="豆類">豆類</option> -->
							<!-- 									</select> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div class="form-group">
								<div class="col-md-11"></div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
							</div>
							<h3></h3>
							<c:if test="${not empty keyword}">
								<c:forEach var="row" items="${keyword}">
									<div class="col-md-4">
										<a href="../ProductServlet?productId=${row.key.productId}">
											<div class="thumbnail" style="height: 320px">
												<img src="../img/${row.value[0].pictureName}"
													style="height: 180px">
												<div class="caption">
													<h3>${row.key.productName}</h3>
													<p>${row.key.origin}</p>
													<p>
														<a href="#" class="btn btn-primary" role="button">Button</a>
														<a href="#" class="btn btn-default" role="button">Button</a>
													</p>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
						</div>


					</div>

				</div>

			</div>
		</form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>