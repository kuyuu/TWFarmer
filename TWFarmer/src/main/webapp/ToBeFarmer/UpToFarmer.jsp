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
	<!-- 上方選單start -->
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="col-md-3">
			<jsp:include page="../BackStage/backstageMenu.jsp" />
		</div>
		<div class="col-md-8">
			<div style="font-weight: bold; color: #ff0000; font-size: 2em;">升級小農</div>
			<br> <span style="color: #ff0000">${errors.farmer}</span>
			<form action="<c:url value="NewFarmerServlet" />" method="post">
				<div class="form-group ">
					<label for="">小農證號</label> <input type="text" name="farmerId"
						id="farmerId" placeholder="請輸入小農證號" class="form-control">
					<span style="color: #ff0000">${errors.farmerId}</span>
				</div>
				<div class="form-group">
					<label for="">銀行代碼</label> <select class="form-control" name="bank"
						id="bank">
						<option value="">請選擇銀行代碼</option>
						<option value="004">004 - 臺灣銀行</option>
						<option value="005">005 - 土地銀行</option>
						<option value="006">006 - 合作商銀</option>
						<option value="007">007 - 第一銀行</option>
						<option value="008">008 - 華南銀行</option>
						<option value="009">009 - 彰化銀行</option>
						<option value="011">011 - 上海商業儲蓄銀行</option>
						<option value="012">012 - 台北富邦銀行</option>
						<option value="013">013 - 國泰世華銀行</option>
						<option value="016">016 - 高雄銀行</option>
						<option value="017">017 - 兆豐國際商業銀行</option>
						<option value="018">018 - 農業金庫</option>
						<option value="021">021 - 花旗(台灣)商業銀行</option>
						<option value="025">025 - 首都銀行</option>
						<option value="039">039 - 澳商澳盛銀行</option>
						<option value="040">040 - 中華開發工業銀行</option>
						<option value="050">050 - 臺灣企銀</option>
						<option value="052">052 - 渣打國際商業銀行</option>
						<option value="053">053 - 台中商業銀行</option>
						<option value="054">054 - 京城商業銀行</option>
						<option value="072">072 - 德意志銀行</option>
						<option value="075">075 - 東亞銀行</option>
						<option value="081">081 - 匯豐(台灣)商業銀行</option>
						<option value="085">085 - 新加坡商新加坡華僑銀行</option>
						<option value="101">101 - 大台北銀行</option>
						<option value="102">102 - 華泰銀行</option>
						<option value="103">103 - 臺灣新光商銀</option>
						<option value="104">104 - 台北五信</option>
						<option value="106">106 - 台北九信</option>
						<option value="108">108 - 陽信商業銀行</option>
						<option value="114">114 - 基隆一信</option>
						<option value="115">115 - 基隆二信</option>
						<option value="118">118 - 板信商業銀行</option>
						<option value="119">119 - 淡水一信</option>
						<option value="120">120 - 淡水信合社</option>
						<option value="124">124 - 宜蘭信合社</option>
						<option value="127">127 - 桃園信合社</option>
						<option value="130">130 - 新竹一信</option>
						<option value="132">132 - 新竹三信</option>
						<option value="146">146 - 台中二信</option>
						<option value="147">147 - 三信商業銀行</option>
						<option value="158">158 - 彰化一信</option>
						<option value="161">161 - 彰化五信</option>
						<option value="162">162 - 彰化六信</option>
						<option value="163">163 - 彰化十信</option>
						<option value="165">165 - 鹿港信合社</option>
						<option value="178">178 - 嘉義三信</option>
						<option value="179">179 - 嘉義四信</option>
						<option value="188">188 - 台南三信</option>
						<option value="204">204 - 高雄三信</option>
						<option value="215">215 - 花蓮一信</option>
						<option value="216">216 - 花蓮二信</option>
						<option value="222">222 - 澎湖一信</option>
						<option value="223">223 - 澎湖二信</option>
						<option value="224">224 - 金門信合社</option>
						<option value="512">512 - 雲林區漁會</option>
						<option value="515">515 - 嘉義區漁會</option>
						<option value="517">517 - 南市區漁會</option>
						<option value="518">518 - 南縣區漁會</option>
						<option value="520">520 - 小港區漁會；高雄區漁會</option>
						<option value="521">521 - 彌陀區漁會；永安區漁會；興達港區漁會；林園區漁會</option>
						<option value="523">523 - 東港漁會；琉球區漁會；林邊區漁會</option>
						<option value="524">524 - 新港區漁會</option>
						<option value="525">525 - 澎湖區漁會</option>
						<option value="605">605 - 高雄市農會</option>
						<option value="612">612 - 豐原市農會；神岡鄉農會</option>
						<option value="613">613 - 名間農會</option>
						<option value="614">614 - 彰化地區農會</option>
						<option value="616">616 - 雲林地區農會</option>
						<option value="617">617 - 嘉義地區農會</option>
						<option value="618">618 - 台南地區農會</option>
						<option value="619">619 - 高雄地區農會</option>
						<option value="620">620 - 屏東地區農會</option>
						<option value="621">621 - 花蓮地區農會</option>
						<option value="622">622 - 台東地區農會</option>
						<option value="624">624 - 澎湖農會</option>
						<option value="625">625 - 台中市農會</option>
						<option value="627">627 - 連江縣農會</option>
						<option value="700">700 - 中華郵政</option>
						<option value="803">803 - 聯邦商業銀行</option>
						<option value="805">805 - 遠東銀行</option>
						<option value="806">806 - 元大銀行</option>
						<option value="807">807 - 永豐銀行</option>
						<option value="808">808 - 玉山銀行</option>
						<option value="809">809 - 萬泰銀行</option>
						<option value="810">810 - 星展銀行</option>
						<option value="812">812 - 台新銀行</option>
						<option value="814">814 - 大眾銀行</option>
						<option value="815">815 - 日盛銀行</option>
						<option value="816">816 - 安泰銀行</option>
						<option value="822">822 - 中國信託</option>
						<option value="901">901 - 大里市農會</option>
						<option value="903">903 - 汐止農會</option>
						<option value="904">904 - 新莊農會</option>
						<option value="910">910 - 財團法人農漁會聯合資訊中心</option>
						<option value="912">912 - 冬山農會</option>
						<option value="916">916 - 草屯農會</option>
						<option value="922">922 - 台南市農會</option>
						<option value="928">928 - 板橋農會</option>
						<option value="951">951 - 北農中心</option>
						<option value="954">954 - 中南部地區農漁會</option>
					</select> <span style="color: #ff0000">${errors.bank}</span>
				</div>
				<div class="form-group">
					<label for="">銀行帳號</label> <input type="text" name="bankAccount"
						id="bankAccount" placeholder="請輸入銀行帳號" class="form-control">
					<span style="color: #ff0000">${errors.bankAccount}</span>
				</div>
				<div class="form-group">
					<h3>請輸入您的賣場介紹</h3>
					<textarea class="form-control" rows="5" name="farmerIntro"
						id="farmerIntro" placeholder="請輸入賣場介紹"></textarea>
					<span style="color: #ff0000">${errors.farmerIntro}</span>
				</div>
				<button type="submit" class="btn btn-default">提出申請</button>
			</form>
			<button type="button" class="btn btn-primary" style="float: right;"
				onclick="insertfile();">一鍵輸入</button>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script>
		$(function() {
			$("#collapseOne>ul>li:eq(7)").removeClass("list-group-item")
					.addClass("list-group-item list-group-item-success")
		})
		
		function insertfile() {
			$("#farmerId").val('M9527');
			$("#bank>option[value='004']").attr("selected","selected");
			$("#bankAccount").val('1433808084331636');
			$("#farmerIntro").val('在種滿四季水果的吉田觀光果園中，可以享受賞花、採果、採菜的樂趣，體驗難得的鄉村生活，尤其大人帶著小孩在果園、菜園透過實際行動體驗採收活動。園中所產水果的果粒都十分大顆，果園一旁則栽種了青翠蔬菜，通通可以讓遊客帶回家。入園不收取清潔管理費，外帶則依市價論斤計算。另有精美禮盒包裝，送禮大方實惠。');
		}
	</script>
</body>
</html>