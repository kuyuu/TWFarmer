<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty LoginOK}">
	<c:set var="target"
		value="/JointPurchase/StarJpFollower.do?jpId=${jpBean.jpId}"
		scope="session" />
	<c:redirect url="../Login.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>台灣小農</title>

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
	<jsp:include page="../common/menuJp.jsp" />
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<form
						action="<c:url value="NewJpFollowerServlet?memberId=${LoginOK.memberId}&jpId=${jpBean.jpId}"/>"
						method="POST">
						<div class="form-group">
							<label for="productId" class="control-label">合購名稱</label>
							<p id="jpName" class="form-control-static">${jpBean.jpName}</p>
						</div>
						<div class="form-group">
							<label for="productId" class="control-label">合購介紹</label>
							<p id="jpName" class="form-control-static">${jpBean.jpIntro}</p>
						</div>
						<div class="form-group">
							<label for="productId" class="control-label">截止日期</label>
							<p id="jpName" class="form-control-static">${jpBean.endDate}</p>
						</div>
						<div class="form-group">
							<label for="f2fId" class="control-label">面交時間/地點</label>
							<c:forEach items="${f2fList}" var="x">
								<div class="radio">
									<label> <input type="radio" name="f2fId" id="f2fId"
										value="${x.f2fId}" checked>
									<fmt:formatDate value="${x.f2fTime}" pattern="yyyy-MM-dd HH:mm" />
										${x.f2fPlace}
									</label>
								</div>
							</c:forEach>
						</div>
						<div class="form-group">
							<label for="f2fId" class="control-label">欲購商品</label>
							<table class="table table-bordered">
								<thead>
									<tr>
										<td>商品名稱</td>
										<td>單價</td>
										<td>運費</td>
										<td>含運價</td>
										<td>購買數量</td>
										<td>總價</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${jpDetailList}" varStatus="x">
										<input type="hidden" value="" name="price2" />
										<input type="hidden" value="${row.jpPrice+row.jpFreight}" />
										<tr>
											<td>${row.productName}</td>
											<td>${row.jpPrice}/${row.jpUnit}</td>
											<td>${row.jpFreight}/${row.jpUnit}</td>
											<td>${row.jpPrice+row.jpFreight}/${row.jpUnit}</td>
											<td class="col-md-2"><input type="text" name="jpCount"
												class="form-control" value="0" /></td>
											<td>0</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="4"></td>
										<td>合計</td>
										<td class="all">0</td>
									</tr>
								</tbody>
							</table>
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							<label for="jpIntro" class="control-label">留言給主購</label> -->
<!-- 							<textarea id="notes" name="notes" class="form-control" rows="3"></textarea> -->
<!-- 							<p class="help-block">限制200字</p> -->
<!-- 						</div> -->
						<div class="form-group">
							<div class="col-md-1 col-md-offset-11">
								<button type="submit" class="btn btn-primary">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.js"></script>
	<script src="/TWFarmer/js/jquery.bootstrap-touchspin.js"></script>
	<script>
		$("input[name*='jpCount']").TouchSpin({
			initval : 0
		});
		$(function() {
			$('input[name="jpCount"]').change(function() {
				var price = $(this).parent().parent().parent().prev().val();
				// 				console.log(price);
				var count = $(this).val();
				// 				console.log(count);
				var total = price * count;
				$(this).parent().parent().next().html(total);

				var price2 = $(this).parent().parent().parent().prev().prev();
				price2.val(total);

				var tp = 0;
				$('input[name="price2"]').each(function() {
					tp = tp + Number($(this).val());
				});
				// 				console.log(tp)
				$('.all').text(tp)

			});
		});
	</script>
</body>
</html>