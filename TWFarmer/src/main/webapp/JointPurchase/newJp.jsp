<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>台灣小農</title>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menuJp.jsp" />
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<form action="<c:url value="CheckJointPurchaseServlet"/>"
						method="POST" class="form-horizontal">
						<div class="row">
							<div class="col-md-6">
								<c:forEach items="${jpdBeanMap}" var="x" varStatus="z">
									<c:forEach items="${x.value}" var="y">
										<div class="col-md-6">
											<div class="thumbnail" style="height: 320px">
												<img src="../img/${y.value[0].pictureName}"
													style="height: 160px" />
												<div class="caption">
													<h3>${y.key.productName}</h3>
													<font size="2"> 價格：${x.key.jpPrice}<br>
														運費：${x.key.jpFreight}<br>最小購買量：${x.key.jpPopulationMin}<br>
														最大購買量：${x.key.jpPopulationMax}
													</font>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:forEach>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="jpName" class="control-label">合購團名</label> <input
										type="text" id="jpName" name="jpName" class="form-control"
										value="${param.jpName}">
								</div>
								<div class="form-group">
									<label for="jpIntro" class="ontrol-label">合購介紹</label>
									<textarea id="jpIntro" name="jpIntro" class="form-control"
										rows="3"></textarea>
									<p class="help-block">限制300字</p>
								</div>
								<div class="form-group">
									<label for="initDate" class="control-label">開始日期</label> <input
										type="text" id="initDate" name="initDate" class="form-control"
										value="${param.initDate}" />
								</div>
								<div class="form-group">
									<label for="endDate" class="control-label">結束日期</label> <input
										type="text" id="endDate" name="endDate" class="form-control"
										value="${param.endDate}" />
								</div>
								<div class="form-group">
									<label for="jpLocation" class="control-label">合購地區</label> <input
										type="text" id="jpLocation" name="jpLocation"
										class="form-control" value="${param.jpLocation}" />
								</div>
								<div class="form-group">
									<label for="miscViaWay" class="control-label">雜費收取方式</label> <select
										class="form-control" id="miscViaWay" name="miscViaWay">
										<option value="4201">不收</option>
										<option value="4202">依人頭</option>
									</select>
								</div>
								<div class="form-group">
									<label for="misc" class="control-label">雜費</label> <input
										type="text" id="misc" name="misc" class="form-control"
										value="${param.misc}" />
								</div>
								<div class="col-md-1 col-md-offset-11">
									<div class="form-group">
										<button type="submit" class="btn btn-default">送出</button>
									</div>
								</div>
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