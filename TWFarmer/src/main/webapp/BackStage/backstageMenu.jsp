<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel-group" id="accordion" role="tablist"
	aria-multiselectable="true">
	<c:if test="${not empty LoginOK }">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">會員</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<ul class="list-group">
					<li class="list-group-item">管理訂單</li>
					<li class="list-group-item">管理開團</li>
					<li class="list-group-item">管理跟團</li>
					<li class="list-group-item">管理追蹤商品</li>
					<li class="list-group-item">管理個人資料</li>
				</ul>
			</div>
		</div>
		<c:if test="${LoginOK.idType==2}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">小農</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<ul class="list-group">
						<li class="list-group-item">管理商品</li>
						<li class="list-group-item">商品問與答</li>
						<li class="list-group-item">審核合購</li>
						<li class="list-group-item">管理小農資料</li>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${LoginOK.idType==3}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">管理員</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<ul class="list-group">
						<li class="list-group-item">審核小農升級</li>
						<li class="list-group-item">處理違規</li>
					</ul>
				</div>
			</div>
		</c:if>
	</c:if>
</div>