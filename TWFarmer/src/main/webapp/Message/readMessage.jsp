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
				<jsp:include page="../BackStage/backstageMenu.jsp" />
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<div class="row">
						<div class="col-md-4">
							<img src="../MemberPic/${msgBean.writerMemberPic}"
								class="img-responsive img-thumbnail" style="width: 100%;" />
								${msgBean.writerName}(${msgBean.writerAccount})<br>
							<button type="button" class="btn btn-default">加為好友</button>
							
							<button type="button" class="btn btn-default">封鎖此人</button>

						</div>
						<div class="col-md-8">
							<h2>${msgBean.msgTitle }</h2>
							<p>${msgBean.msgContent }</p>
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
			$("#collapseOne>ul>li:eq(4)").addClass("list-group-item-success");
		});
	</script>
</body>
</html>