<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/TWFarmer/css/bootstrap.min.css" rel="stylesheet">
<title>購買蔬果</title>
<style type="text/css">
td {
	padding: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form
				action="<c:url value="/ProductSelect/ProductSelect.controller" />"
				method="get" class="">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<h3>商品搜尋</h3>
					<h2></h2>

					<div class="form-group">
						<label class="">產地搜尋</label>
						<div class="">
							<input type="text" name="name" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="">分類搜尋</label>
						<div class="">
							<select class="form-control" id='selectBy' name="selectBy">
								<option value="">請選擇分類</option>
								<option value="仁果類">仁果類</option>
								<option value="核果類">核果類</option>
								<option value="堅果類">堅果類</option>
								<option value="漿果類">漿果類</option>
								<option value="柑橘類">柑橘類</option>
								<option value="瓜類">瓜類</option>
								<option value="根菜類">根菜類</option>
								<option value="莖菜類">莖菜類</option>
								<option value="花菜類">花菜類</option>
								<option value="果菜類">果菜類</option>
								<option value="葉菜類">葉菜類</option>
								<option value="香辛類">香辛類</option>
								<option value="菌藻類">菌藻類</option>
								<option value="豆類">豆類</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-11"></div>
						<div class="col-md-1">
							<button type="submit" class="btn btn-default">搜尋</button>
						</div>
					</div>
					<c:if test="${not empty name}">
						<table class="table-bordered">
							<thead>
								<tr>
									<th>產地</th>
									<th>產品</th>
									<th>描述</th>
									<th>價錢</th>
									<th>單位</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${name}">
									<tr>
										<td><a href="${path}">${row.origin}</a></td>
										<td>${row.productName}</td>
										<td>${row.productIntro}</td>
										<td>${row.price}</td>
										<td>${row.unit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${not empty selectBy}">
						<table class="table-bordered">
							<thead>
								<tr>
									<th>產地</th>
									<th>產品</th>
									<th>描述</th>
									<th>價錢</th>
									<th>單位</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row1" items="${selectBy}">
									<tr>
										<td><a href="${path}">${row1.origin}</a></td>
										<td>${row1.productName}</td>
										<td>${row1.productIntro}</td>
										<td>${row1.price}</td>
										<td>${row1.unit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/TWFarmer/js/bootstrap.min.js"></script>
</body>
</html>