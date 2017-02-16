<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<!-- column1, Vertical Dropdown Menu -->
			<div id="main-menu" class="list-group">
				<a href="#sub-menu" class="list-group-item" data-toggle="collapse"
					data-parent="#main-menu">會員<span class="caret"></span></a>
				<div class="collapse list-group-level1" id="sub-menu">
					<a href="#" class="list-group-item" data-parent="#sub-menu">　管理訂單</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu">　管理開團</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu">　管理跟團</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu">　管理追蹤商品</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu">　管理個人資料</a>
				</div>
				<a href="#sub-menu2" class="list-group-item" data-toggle="collapse"
					data-parent="#main-menu">小農<span class="caret"></span></a>
				<div class="collapse list-group-level1" id="sub-menu2">
					<a href="#" class="list-group-item" data-parent="#sub-menu2">　管理商品</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu2">　商品問與答</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu2">　審核合購</a>
					<a href="#" class="list-group-item" data-parent="#sub-menu2">　管理小農資料</a>
				</div>
				<a href="#sub-menu3" class="list-group-item" data-toggle="collapse"
					data-parent="#main-menu">管理員<span class="caret"></span></a>
				<div class="collapse list-group-level1" id="sub-menu3">
					<a href="#" class="list-group-item" data-parent="#sub-menu3">　處理違規</a>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<!-- column 2, content goes here... -->
		</div>
	</div>
</div>
