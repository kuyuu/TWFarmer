<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty LoginOK}">
	<c:set var="target" value="/JointPurchase.do?jpId=${jpBean.jpId}"
		scope="session" />
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

.imgauto {
	width: auto;
	height: 200px;
}

.hr {
	border-top: 1px solid gray;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="common/menuJp.jsp" />
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="col-md-4">
						<img src="img/${jpBean.pictureName}" style="width: 100%"
							class="img-thumbnail" />
					</div>
					<div class="col-md-8">
						<h2>${jpBean.jpName}</h2>
						<p>
							小農：<img
								src="resources/uploadImages/${fBean.memberBean.memberPic}"
								height="40px" /><a
								href="Friend/SelectMember.do?account=${fBean.account}">${fBean.name}(${fBean.account})</a><a
								href="Message/NewMessage.do?readerAccount=${fBean.account}"
								class="btn btn-default"><span
								class="glyphicon glyphicon-envelope"></span></a>
						</p>
						<p>
							主購：<img src="resources/uploadImages/${mBean.memberPic}"
								height="40px" /><a
								href="Friend/SelectMember.do?account=${mBean.account}">${mBean.name}(${mBean.account})</a><a
								href="Message/NewMessage.do?readerAccount=${mBean.account}"
								class="btn btn-default"><span
								class="glyphicon glyphicon-envelope"></span></a>
						</p>
						<a href="JointPurchase/StarJpFollower.do?jpId=${jpBean.jpId}"><button
								class="btn btn-primary" id="go" value="${jpBean.jpId}">我要跟團</button></a><br>
						<br>

					</div>
				</div>
				<div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div role="tabpanel">

								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a href="#home"
										aria-controls="home" role="tab" data-toggle="tab">合購資訊</a></li>
									<li role="presentation"><a href="#profile"
										aria-controls="profile" role="tab" data-toggle="tab">合購統計</a></li>
									<li role="presentation"><a href="#profile2"
										aria-controls="profile2" role="tab" data-toggle="tab">面交方式</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="home" style="background: rgba(255, 255, 255, 0.8);border-bottom: 1px solid #ddd;
									    padding:20px; border-radius: 4px 4px 4px 4px;">
										<h4>合購介紹：</h4>${jpBean.jpIntro}
										<h4>合購地區：</h4>${jpBean.jpLocation}
										<h4>截止日期：</h4>${jpBean.endDate}
									</div>
									<div role="tabpanel" class="tab-pane" id="profile" style="background: rgba(255, 255, 255, 0.8);border-bottom: 1px solid #ddd;
									    padding:10px; border-radius: 4px 4px 4px 4px;">
										<table class="table">
											<tr class="warning">
												<td>商品名稱</td>
												<td>價格</td>
												<td>運費</td>
												<td>數量</td>
												<td>金額</td>
											</tr>
											<c:set var="total" value="0" />
											<c:forEach begin="0" end="${size-1}" var="x">
												<tr>
													<td>${jpdList[x].productName}</td>
													<td>${jpdList[x].jpPrice}/${jpdList[x].jpUnit}</td>
													<td>${jpdList[x].jpFreight}/${jpdList[x].jpUnit}</td>
													<c:choose>
														<c:when test="${jpdList[x].jpPopulationMin<=quantity[x]}">
															<td>${quantity[x]}(達標)</td>
														</c:when>
														<c:otherwise>
															<td>${quantity[x]}</td>
														</c:otherwise>
													</c:choose>
													<td>${jpdList[x].jpPrice*quantity[x]+jpdList[x].jpFreight*quantity[x]}</td>
													<c:set var="total"
														value="${total+jpdList[x].jpPrice*quantity[x]+jpdList[x].jpFreight*quantity[x]}" />
												</tr>
											</c:forEach>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td>總計</td>
												<td>${total}</td>
											</tr>
										</table>
									</div>
									<div role="tabpanel" class="tab-pane" id="profile2" style="background: rgba(255, 255, 255, 0.8);border-bottom: 1px solid #ddd;
									    padding:10px; border-radius: 4px 4px 4px 4px;">
										<table class="table">
											<tr class="warning">
												<td>面交時間</td>
												<td>面交地點</td>
											</tr>
											<c:forEach items="${f2fList}" var="x">
												<tr>
													<td><fmt:formatDate value="${x.f2fTime}"
															pattern="yyyy-MM-dd HH:mm" /></td>
													<td>${x.f2fPlace}</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<h2 class="text-center">可合購商品</h2>
						<div class="hr"></div>
						<c:forEach items="${jpdMap}" var="x">
							<c:forEach items="${x.value}" var="y">
								<a href="ProductServlet?productId=${y.key.productId}">
									<div class="col-md-3">
										<div class="thumbnail" style="height: 280px;">
											<img src="img/${y.value[0].pictureName}"
												style="height: 120px; width: auto;" />
											<div class="caption">
												<h3>${y.key.productName}</h3>
												<h4>${x.key.jpPrice+x.key.jpFreight}/${x.key.jpUnit}(含運)</h4>
												<h4>${x.key.jpPopulationMin}${x.key.jpUnit}成團</h4>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:forEach>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<h2 class="text-center">合購留言板</h2>
						<div class="hr"></div>
						<c:if test="${empty msgBoardList}">
							<div class="col-md-12">
								<p>目前沒有人留言</p>
							</div>
						</c:if>
						<c:forEach items="${msgBoardList}" var="x">
							<div class="media">

								<a class="media-left media-top"
									href="Friend/SelectMember.do?account=${x.memberBean.account}">
									<img src="resources/uploadImages/${x.memberBean.memberPic}"
									alt="..." width="50px">
								</a>
								<div class="media-body">
									<%-- 									<h4 class="media-heading">${x.content}</h4> --%>
									<p>${x.content}</p>
									<p class="text-right">
										<fmt:formatDate value="${x.msgTime}"
											pattern="yyyy-MM-dd HH:mm" />
									</p>
								</div>

							</div>
						</c:forEach>
						<br>
						<div>
							<c:choose>
								<c:when test="${not empty LoginOK}">
									<div class="form-group">
										<label for="content" class="ontrol-label">我要留言</label>
										<textarea id="content" name="content" class="form-control"
											rows="4"></textarea>
									</div>
									<input type="hidden" value="${jpBean.jpId}" id="jpId" />
									<div class="col-md-1 col-md-offset-11">
										<div class="form-group">
											<button id="submit" type="submit" class="btn btn-default">送出</button>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-md-12">
										<p>請先登入才可留言</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/scripts.js"></script>
	<script>
		$('#submit').click(
				function() {
					$.ajax({
						url : 'MessageBoard/NewMessage.do',
						type : 'POST',
						data : {
							'content' : $('#content').val(),
							'jpId' : $('#jpId').val()
						},
						complete : function() {
							// 							alert('${jpBean.jpId}');
							window.location = 'JointPurchase.do?jpId='
									+ $('#jpId').val();
						}
					});

				});
	</script>
</body>
</html>