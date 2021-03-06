<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<div class="panel-group" id="accordion" role="tablist"
	aria-multiselectable="true">
	<c:if test="${not empty LoginOK }">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne"
				style="background: #408080; color: #FFFFFF">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">會員</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<ul class="list-group">
					<li class="list-group-item"><a
						href="../BackStage/WelcomeMember.jsp">管理個人資料</a></li>
					<li class="list-group-item"><a
						href="../BackStage/ListOrderServlet">管理訂單</a></li>
					<li class="list-group-item"><a
						href="../BackStage/MemberCheckJpServlet">管理開團</a></li>
					<li class="list-group-item"><a
						href="../BackStage/MemberCheckJpFollowerServlet">管理跟團</a></li>
					<li class="list-group-item"><a
						href="../BackStage/ShowTrackProduct.do">管理追蹤商品</a></li>
					<li class="list-group-item"><a href="../Message/MsgHome.do">站內信</a></li>
					<li class="list-group-item"><a href="../Friend/FriendHome.do">好友
							/ 黑名單</a></li>
					<c:if test="${LoginOK.idType==1}">
						<li class="list-group-item"><a
							href="../ToBeFarmer/UpToFarmer.jsp">申請成為小農</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<c:if test="${LoginOK.idType==2}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo"
					style="background: #4078b0; color: #FFFFFF">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">小農</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="../BackStage/SelectAllProductMaintainServlet">管理商品</a></li>
						<li class="list-group-item"><a
							href="/TWFarmer/BackStage/FarmerCheckOrderServlet">訂單管理</a></li>
						<li class="list-group-item"><a
							href="../BackStage/SelectAllQnaServlet">商品問與答</a></li>
						<li class="list-group-item"><a
							href="../BackStage/FarmerCheckJpServlet">審核合購</a></li>
						<li class="list-group-item"><a
							href="/TWFarmer/BackStage/FarmerInfo.jsp">管理小農資料</a></li>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${LoginOK.idType==3}">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree"
					style="background: #4078b0; color: #FFFFFF">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">管理員</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="../BackStage/SelectFarmerUpServlet">審核小農升級</a></li>
						<li class="list-group-item"><a
							href="../BackStage/ShowAllViolation.do">處理違規</a></li>
					</ul>
				</div>
			</div>
		</c:if>
	</c:if>
</div>