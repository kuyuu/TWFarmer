<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<link href="../css/jquery.datetimepicker.css" rel="stylesheet">
<style>
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
	<jsp:include page="../common/menuJp.jsp" />
	<div class="container">
		<div class="jumbotron col-md-12">
			<img src="../img/img/003.png" style="width: 100%" />
			<form action="F2F.do" method="POST">
				<input type="hidden" value="${jpId}" name="jpId" />
				<div class="form-group col-md-3 col-md-offset-1">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="form-group col-md-3 col-md-offset-1 hidden">
					<label for="f2fTime" class="control-label">面交時間</label> <input
						type="text" name="f2fTime" class="form-control" />
				</div>
				<div class="form-group col-md-7 hidden">
					<label for="f2fPlace" class="control-label">面交地點</label> <input
						type="text" name="f2fPlace" class="form-control" />
				</div>
				<div class="col-md-10 col-md-offset-1">
					<div class="form-group">
						<button class="btn btn-success" type="button" id="buttonAdd">增加輸入框</button>
						<button type="submit" class="btn btn-primary">送出</button>
					</div>
				</div>
				<!-- 				<div class="form-group col-md-5 col-md-offset-1"> -->
				<!-- 					<label for="f2fTime" class="control-label">面交時間</label> <input -->
				<!-- 						type="text" name="f2fTime" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5"> -->
				<!-- 					<label for="f2fPlace" class="control-label">面交地點</label> <input -->
				<!-- 						type="text" name="f2fPlace" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5 col-md-offset-1"> -->
				<!-- 					<label for="f2fTime" class="control-label">面交時間</label> <input -->
				<!-- 						type="text" name="f2fTime" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5"> -->
				<!-- 					<label for="f2fPlace" class="control-label">面交地點</label> <input -->
				<!-- 						type="text" name="f2fPlace" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5 col-md-offset-1"> -->
				<!-- 					<label for="f2fTime" class="control-label">面交時間</label> <input -->
				<!-- 						type="text" name="f2fTime" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5"> -->
				<!-- 					<label for="f2fPlace" class="control-label">面交地點</label> <input -->
				<!-- 						type="text" name="f2fPlace" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5 col-md-offset-1"> -->
				<!-- 					<label for="f2fTime" class="control-label">面交時間</label> <input -->
				<!-- 						type="text" name="f2fTime" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="form-group col-md-5"> -->
				<!-- 					<label for="f2fPlace" class="control-label">面交地點</label> <input -->
				<!-- 						type="text" name="f2fPlace" class="form-control" /> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-md-1 col-md-offset-10"> -->
				<!-- 					<div class="form-group"></div> -->
				<!-- 				</div> -->
			</form>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="../js/jquery.datetimepicker.full.js"></script>
	<script>
		$(function() {
			$.datetimepicker.setLocale('en');
			$('input[name="f2fTime"]').datetimepicker();

			//$('#datepicker').timepicker({"timeFormat": "HH:mm"}); 
			$('#buttonAdd').click(function() {
				var count = 0;
				$('.hidden').each(function() {
					$(this).removeClass('hidden');
					count++;
					if (count % 2 == 0) {
						return false;
					}
				});
			});
		});
	</script>
</body>
</html>