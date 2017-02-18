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
				<jsp:include page="backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<form class="form-horizontal" action="RemittanceServlet"
						method="POST">
						<input type="hidden" value="${jpfBean.JPFollowerId}"
							name="jpFollowerId" />
						<div class="form-group">
							<label for="remittanceBank" class="col-sm-3 control-label">匯款銀行</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceBank"
									name="remittanceBank" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceAcc" class="col-sm-3 control-label">匯款帳號後5碼</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceAcc"
									name="remittanceAcc" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittance" class="col-sm-3 control-label">匯款金額</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittance"
									name="remittance" />
							</div>
						</div>
						<div class="form-group">
							<label for="remittanceDate" class="col-sm-3 control-label">匯款時間</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remittanceDate"
									name="remittanceDate" />
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