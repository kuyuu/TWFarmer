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
				<div class="col-md-offset-2">
					<form
						action="<c:url value="NewJpFollowerServlet?memberId=${memberBean.memberId}&jpId=${jpBean.jpId}"/>"
						method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="memberId" class="col-sm-2 control-label">會員ID</label>
							<div class="col-sm-6">
								<p id="memberId" class="form-control-static">${memberBean.memberId}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="productId" class="col-sm-2 control-label">合購ID</label>
							<div class="col-sm-6">
								<p id="productId" class="form-control-static">${jpBean.jpId}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="productId" class="col-sm-2 control-label">合購名稱</label>
							<div class="col-sm-6">
								<p id="jpName" class="form-control-static">${jpBean.jpName}</p>
							</div>
						</div>
						<div class="form-group">
							<label for="f2fId" class="col-sm-2 control-label">面交方式</label>
							<div class="col-sm-6">
								<c:forEach items="${f2fList}" var="x">
									<div class="radio">
										<label> <input type="radio" name="f2fId" id="f2fId"
											value="${x.f2fId}" checked>${x.f2fTime} ${x.f2fPlace}
										</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="form-group">
							<label for="f2fId" class="col-sm-2 control-label">欲購商品</label>
							<div class="col-sm-6">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td>商品名稱</td>
											<td>購買數量</td>
											<td>單價</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${jpDetailList}" varStatus="x">
											<tr>
												<td>${row.productName}</td>
												<td><input type="text" name="jpCount"
													class="form-control" value="0" style="width: 50px" /></td>
												<td>${row.jpPrice}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<label for="jpIntro" class="col-sm-2 control-label">留言給主購</label>
							<div class="col-sm-6">
								<textarea id="notes" name="notes" class="form-control" rows="3"></textarea>
								<p class="help-block">限制200字</p>
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