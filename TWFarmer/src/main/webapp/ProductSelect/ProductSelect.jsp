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
			var availableTags = [ '台中市', '大肚區', '烏日區', '台北市', '文山區', '台東縣',
					'大武鄉', '太麻里鄉', '東河鄉', '關山鎮', '柳營區', '楠西區', '龍崎區', '關廟區',
					'宜蘭縣', '冬山鄉', '頭城鎮', '花蓮縣', '光復鄉', '鳳林鎮', '南投縣', '水里鄉',
					'信義鄉', '埔里鎮', '鹿谷鄉', '屏東縣', '內埔鄉', '竹田鄉', '苗栗縣', '大湖鄉',
					'竹南鎮', '後龍鎮', '頭屋鄉', '桃園縣', '龜山鄉', '高雄市', '左營區', '田寮區',
					'岡山區', '美濃區', '燕巢區', '基隆市', '暖暖區', '雲林縣', '東勢鄉', '新竹縣',
					'峨眉鄉', '嘉義縣', '太保市', '鹿草鄉', '番路鄉', '彰化縣', '員林鎮',
					'大內有機(轉)木瓜', '小白菜', '日本富士蘋果', '火龍果', '牛老闆有機(轉)草莓',
					'台東大目釋迦', '平偉der青蔥', '平偉der普利珠李子', '正宗峨嵋桶柑', '旭陽有機紅蘿蔔',
					'有機千寶菜', '有機白玉白蘿蔔', '有機地瓜葉', '有機羽衣甘藍', '有機青江菜', '有機高麗菜',
					'有機甜菠菜(番杏)', '有機黑木耳', '有機愛女小番茄', '有機綠霸大番茄', '有機皺葉白菜',
					'有機藍寶石菇', '有機轉型期金鑽鳳梨', '有機轉型期青木瓜', '有機轉型期栗子地瓜', '有機轉型期高麗菜',
					'有機轉型期無籽檸檬', '有機轉型期黑柿番茄', '百香果', '冷凍野生藍莓', '東河林爸晚崙西亞橙',
					'金鑽鳳梨', '阿里山有機轉型草莓', '信義鄉巨峰葡萄', '南投無毒高山雪梨', '皇宮菜', '科P大蒜',
					'科P紅豆', '科P香蕉', '科P銀杏子', '美濃水蓮', '徐耀昌大湖草莓', '高雄劉姐的有機芭蕉',
					'無毒珍品白蘆筍', '無毒埔里筊白筍', '無毒澄蜜小番茄', '超美味楠西楊桃', '楊桃',
					'彰化早春優級葡萄', '綠色奇異果', '鳳梨釋迦4斤裝', '燕巢蜜棗', '關廟無毒金鑽鳳梨', '蘿蔓萵苣' ]
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