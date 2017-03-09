<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農-恭喜註冊成功</title>

<script src="/TWFarmer/js/jquery.min.js"></script>
<script src="/TWFarmer/js/bootstrap.js"></script>
<script src="/TWFarmer/js/scripts.js"></script>
<script type='text/javascript'>
	setTimeout('countdown()', 1000);

	function countdown() {
		var s = document.getElementById('timer');
		s.innerHTML = s.innerHTML - 1;
		if (s.innerHTML == 0)
			window.location = '/TWFarmer/index.jsp';
		else
			setTimeout('countdown()', 1000);
	}
</script>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="center-block">
							<div class="jumbotron">
								<div class="text-center">
									<img
										src="/TWFarmer/resources/uploadImages/${memberBean.memberPic}"
										class="img-responsive img-thumbnail" style="width: 80%;" />
								</div>
								<h3 class="text-center">${memberBean.name}(${memberBean.account})</h3>
								<h3 class="text-center">您已經註冊成功</h3>
								<h4 class="text-center">
									將於<span id='timer'>30</span>秒鐘後自動轉回首頁
								</h4>
								<h4 class="text-center">為維護您帳號安全，請重新登入</h4>
								<div class="text-center">
									<a href="/TWFarmer/index.jsp"
										class="btn btn-success btn-default" type="button">按我回首頁</a>
								</div>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>