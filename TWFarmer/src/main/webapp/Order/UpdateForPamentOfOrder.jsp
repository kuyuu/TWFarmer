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
<!-- 以下兩個為date的link -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="../css/jquery-ui-timepicker-addon.css">



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
								<input type="text" name="remittanceAcc" class="form-control" />
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
								<input type="text" id="datepicker" name="remittanceDate"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">匯款確認</button>
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
	<script>
		$(function() {
			$('#collapseOne>ul>li:eq(2)').addClass("list-group-item-success");
		});
	</script>
<!-- 以下為datepicker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script>
	<script>
		$(function() {
			
			$("#datepicker").datetimepicker({
				dateFormat : "yy-mm-dd",
				timeFormat: "HH:mm",
			});
			
			
			//$('#datepicker').timepicker({"timeFormat": "HH:mm"}); 
		});
	</script>



</body>
</html>