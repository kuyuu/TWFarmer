<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<body>

	<div class="container">
		<jsp:include page="../common/menu.jsp" />

		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item">管理訂單</a> <a href="#"
						class="list-group-item">管理開團</a> <a href="#"
						class="list-group-item active">管理跟團</a><a href="#"
						class="list-group-item">管理追蹤商品</a> <a href="#"
						class="list-group-item">管理個人資料</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<form class="form-horizontal" action="UpdateForPaymentOfOrder"
						method="POST">
						<input type="hidden" name="orderId" value="${order.orderId}" />
						<div class="form-group">
							<label for="remittanceBank" class="col-sm-3 control-label">匯款銀行</label>
							<div class="col-sm-9">
								<input type="text" name="remittanceBank" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceAcc" class="col-sm-3 control-label">匯款帳號後5碼</label>
							<div class="col-sm-9">
								<input type="text" name="remittanceAcc" class="form-control"  />
							</div>
						</div>
						<div class="form-group">
							<label for="remittance" class="col-sm-3 control-label">匯款金額</label>
							<div class="col-sm-9">
								<input type="text" name="remittance" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceDate" class="col-sm-3 control-label">匯款時間</label>
							<div class="col-sm-9">
								<input type="text" name="remittanceDate" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>