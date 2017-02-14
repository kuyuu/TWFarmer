<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
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
					<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">購買蔬果</a></li>
						<li><a href="#">合購專區</a></li>
						<li><a href="#">購物車</a></li>
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
								<li><a href="/TWFarmer/Msg/MsgHome.jsp">站內信</a></li>
								<li><a href="/TWFarmer/BackStage/BackStageServlet">會員專區</a></li>
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
				<div class="col-md-offset-2">
					<form action="<c:url value="CheckJointPurchaseServlet"/>"
						method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="jpName" class="col-sm-2 control-label">合購團名</label>
							<div class="col-sm-6">
								<input type="text" id="jpName" name="jpName"
									class="form-control" value="${param.jpName}">
							</div>
						</div>
						<div class="form-group">
							<label for="productId" class="col-sm-2 control-label">商品ID</label>
							<div class="col-sm-6">
								<p id="productId" class="form-control-static">${sessionScope.JPDetail.productId}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="jpPrice" class="col-sm-2 control-label">合購價格</label>
							<div class="col-sm-6">
								<input type="text" id="jpPrice" name="jpPrice"
									class="form-control" value="${param.jpPrice}">
							</div>
						</div>
						<div class="form-group">
							<label for="jpFreight" class="col-sm-2 control-label">單位運費</label>
							<div class="col-sm-6">
								<input type="text" id="jpFreight" name="jpFreight"
									class="form-control" value="${param.jpFreight}">
							</div>
						</div>
						<div class="form-group">
							<label for="jpPopulationMin" class="col-sm-2 control-label">最小購買量</label>
							<div class="col-sm-6">
								<input type="text" id="jpPopulationMin" name="jpPopulationMin"
									class="form-control" value="${param.jpPopulationMin}">
							</div>
						</div>
						<div class="form-group">
							<label for="jpPopulationMax" class="col-sm-2 control-label">最大購買量</label>
							<div class="col-sm-6">
								<input type="text" id="jpPopulationMax" name="jpPopulationMax"
									class="form-control" value="${param.jpPopulationMax}">
							</div>
						</div>

						<div class="form-group">
							<label for="jpIntro" class="col-sm-2 control-label">合購介紹</label>
							<div class="col-sm-6">
								<textarea id="jpIntro" name="jpIntro" class="form-control"
									rows="3"></textarea>
								<p class="help-block">限制300字</p>
							</div>
						</div>
						<div class="form-group">
							<label for="initDate" class="col-sm-2 control-label">開始日期</label>
							<div class="col-sm-6">
								<input type="text" id="initDate" name="initDate"
									class="form-control" value="${param.initDate}" />
							</div>
						</div>
						<div class="form-group">
							<label for="endDate" class="col-sm-2 control-label">結束日期</label>
							<div class="col-sm-6">
								<input type="text" id="endDate" name="endDate"
									class="form-control" value="${param.endDate}" />
							</div>
						</div>
						<div class="form-group">
							<label for="jpLocation" class="col-sm-2 control-label">合購地區</label>
							<div class="col-sm-6">
								<input type="text" id="jpLocation" name="jpLocation"
									class="form-control" value="${param.jpLocation}" />
							</div>
						</div>
						<div class="form-group">
							<label for="miscViaWay" class="col-sm-2 control-label">雜費收取方式</label>
							<div class="col-sm-6">
								<select class="form-control" id="miscViaWay" name="miscViaWay">
									<option value="4201">不收</option>
									<option value="4202">依人頭</option>
									<option value="4203">依比例</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="misc" class="col-sm-2 control-label">雜費</label>
							<div class="col-sm-6">
								<input type="text" id="misc" name="misc" class="form-control"
									value="${param.misc}" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">
								<button type="submit" class="btn btn-default">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>