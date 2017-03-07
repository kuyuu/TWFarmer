<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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

	<div class="container">
		<jsp:include page="../common/menuProduct.jsp" />
		<form
			action="<c:url value="/ProductSelect/ProductSelect.controller" />"
			method="get" class="">
			<div class="row">
				<div class="col-md-3">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne"
								style="background: #408080; color: #FFFFFF">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne">水果分類</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<ul class="list-group" id="selectBy">
									<li class="list-group-item" value="瓜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=瓜類">瓜類</a></li>
									<li class="list-group-item" value="仁果類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=仁果類">仁果類</a></li>
									<li class="list-group-item" value="核果類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=核果類">核果類</a></li>
									<li class="list-group-item" value="堅果類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=堅果類">堅果類</a></li>
									<li class="list-group-item" value="漿果類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=漿果類">漿果類</a></li>
									<li class="list-group-item" value="柑橘類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=柑橘類">柑橘類</a></li>
								</ul>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo"
								style="background: #4078b0; color: #FFFFFF">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">蔬菜分類 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<ul class="list-group" id="selectBy2">
									<li class="list-group-item" value="豆類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=豆類">豆類</a></li>
									<li class="list-group-item" value="根菜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=根菜類">根菜類</a></li>
									<li class="list-group-item" value="莖菜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=莖菜類">莖菜類</a></li>
									<li class="list-group-item" value="花菜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=花菜類">花菜類</a></li>
									<li class="list-group-item" value="果菜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=果菜類">果菜類</a></li>
									<li class="list-group-item" value="葉菜類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=葉菜類">葉菜類</a></li>
									<li class="list-group-item" value="香辛類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=香辛類">香辛類</a></li>
									<li class="list-group-item" value="菌藻類"><a
										href="/TWFarmer/ProductSelect/ProductSelect.controller?selectBy=菌藻類">菌藻類</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">

						<div class="col-md-9">
							<h3>商品搜尋</h3>
							<br>
							<div class="form-group">
								<div class="col-md-11">
									<div class="">
										<input type="text" name="keyword" class="form-control"
											id="keyword">
									</div>
								</div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-default">搜尋</button>
								</div>
								<br> <br>
							</div>
							<c:if test="${not empty keyword}">
								<c:forEach var="row" items="${keyword}">
									<div class="col-md-4">
										<a href="../ProductServlet?productId=${row.key.productId}">
											<div class="thumbnail" style="height: 320px">
												<img src="../img/${row.value[0].pictureName}"
													style="height: 180px">
												<div class="caption">
													<h3>${row.key.productName}</h3>
													<p>產地:${row.key.origin}
														價格:${row.key.price}/${row.key.unit}</p>
													<p>
														<a
															href="<c:url value="../Order/NewOrderServlet?productId=${row.key.productId}&sellerId=${row.key.sellerId}" />"
															class="btn btn-primary" role="button">直接購買</a>
														<button type="button" class="btn btn-default" name="cart"
															data-trigger="focus" data-placement="top"
															data-toggle="popover" data-content="已加入購物車"
															value="${row.key.productId}">加入購物車</button>
													</p>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('[data-toggle="popover"]').popover();
			//購物車
			$('button[name="cart"]').click(function() {
				$.get('/TWFarmer/shoppingCart/AddShoppingCart.do', {
					"productId" : $(this).val()
				});
			});
		});

		$(function() {
			var availableTags = [ '台中市', '新社區', '卑南鄉', '鹿野鄉', '台南市', '關廟區',
					'柳營區', '宜蘭縣', '頭城鎮', '花蓮縣', '吉安鄉', '秀林鄉', '南投縣', '信義鄉',
					'埔里鎮', '草屯鎮', '屏東縣', '高樹鄉', '苗栗縣', '大湖鄉', '南庄鄉', '桃園市',
					'新屋區', '高雄市', '左營區', '雲林縣', '大埤鄉', '新竹縣', '峨眉鄉', '寶山鄉',
					'嘉義縣', '太保市', '番路鄉', '彰化縣', '大村鄉', '56青蔥', '56南瓜子', '56紅豆',
					'56黃豆', '九九峰山蕉', '大力水手菠菜☀', '小白菜', '牛奶鳳梨', '四季豆', '正宗峨眉桶柑',
					'玉女蕃茄', '玉米筍', '白花椰菜', '白蘿蔔', '有機小黃瓜', '有機花蓮地瓜葉', '有機草莓',
					'有機絲瓜', '芹菜', '金針菇', '南瓜', '南庄美味香蕉☀', '南庄農場香甜蘋果', '洋蔥',
					'胡蘿蔔', '苦瓜', '韭菜', '香菜', '高麗菜', '逍遙大蒜', '逍遙香蕉', '逍遙銀杏子',
					'雲林有機高麗菜', '黃豆芽菜', '新社杏鮑菇', '新社香菇', '鼠兒果李子', '彰化早春優級葡萄',
					'綠花椰菜', '網室紅肉木瓜', '網紋紅肉哈密瓜', '辣椒', '鳳梨', '蓮藕', '糖糖果園-大湖草莓',
					'糖糖果園-火龍果', '糖糖果園-鮮甜木瓜', '爆甜吉園圃鳳梨釋迦', '關廟無毒金鑽鳳梨', '寶山鄉桶柑' ];
			$("#keyword").autocomplete({
				source : availableTags
			});

		});

		$(document).ready(
				function() {
					if ('${param.selectBy}' == '豆類'
							|| '${param.selectBy}' == '根菜類'
							|| '${param.selectBy}' == '莖菜類'
							|| '${param.selectBy}' == '花菜類'
							|| '${param.selectBy}' == '果菜類'
							|| '${param.selectBy}' == '葉菜類'
							|| '${param.selectBy}' == '香辛類'
							|| '${param.selectBy}' == '菌藻類') {
						$('#collapseOne').removeClass("in");
						$('#collapseTwo').addClass("in");
						$("li[value='${param.selectBy}']").addClass(
								"list-group-item-info")
					} else {
						$("li[value='${param.selectBy}']").addClass(
								"list-group-item-success")
					}

				});
	</script>
</body>
</html>