<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}

html {
	overflow-y: scroll;
}

.center-block {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 300px;
}
</style>
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
					<h2>好友 / 黑名單</h2>
					<div class="test"></div>
					<form class="form-inline" role="form" method="POST"
						action="SelectMemberServlet">
						<div class="form-group">
							<div class="input-group">
								<label class="sr-only" for="account">會員帳號</label> <input
									type="text" class="form-control" id="account" name="account"
									placeholder="輸入會員帳號">
							</div>
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span> 搜尋會員
						</button>
					</form>
					<br>
					<div class="center-block">
						<img src="../MemberPic/${memberBean.memberPic}"
							class="img-responsive img-thumbnail" style="width: 100%;" />
						<p class="text-center">${memberBean.name}(${memberBean.account})</p>
						<div class="col-md-6">
							<button type="button" class="btn btn-success btn-block"
								name="white">加為好友</button>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-danger btn-block"
								name="black">封鎖此人</button>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(6)").addClass("list-group-item-success");

			$('button[name="white"]').click(function() {
				$.ajax({url:'AddFriend.do',type:"POST", data:{"whiteId" : "${memberBean.memberId}"}, complete:function(){
						window.location = "FriendHome.do";
				}});
			});
			$('button[name="black"]').click(function() {
				$.ajax({url:'AddFriend.do',type:"POST", data:{"blackId" : "${memberBean.memberId}"}, complete:function(){
						window.location = "FriendHome.do";
				}});
			});
			
			if ("${friend}" == "0") {
				$('button[name="white"]').attr("disabled", "disabled");
			} else if ("${friend}" == "1") {
				$('button[name="black"]').attr("disabled", "disabled");
			}
		});
	</script>
</body>
</html>