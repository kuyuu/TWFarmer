<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="row"> -->
<!-- 	<div class="col-md-12"> -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span><span
				class="icon-bar"></span><span class="icon-bar"></span><span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/TWFarmer/index.jsp">台灣小農</a>
	</div>

	<div class="collapse navbar-collapse"
		id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a
				href="/TWFarmer/ProductSelect/ProductSelect.jsp">購買蔬果</a></li>
			<li><a href="/TWFarmer/PurchaseSelect/PurchaseSelect.jsp">合購專區</a></li>
			<li class="active"><a href="/TWFarmer/shoppingCart/ShowShoppingCartServlet">購物車</a></li>
		</ul>
		<c:choose>
		<c:when test="${empty LoginOK}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/TWFarmer/MemberSubmit/MemberSubmit.jsp">註冊</a>
				</li>
				<li><a href="/TWFarmer/Login.jsp">登入</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/TWFarmer/Msg/MsgCheckingServlet">站內信</a></li>
				<li><a href="/TWFarmer/BackStage/BackStageServlet">會員專區</a></li>
				<li><a href="/TWFarmer/FindFriends/FriendHome.jsp">社群管理</a></li>
				<li><a href="/TWFarmer/logout.jsp">登出</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control">
			</div>
			<button type="submit" class="btn btn-default">搜尋</button>
		</form>
	</div>
</nav>
<!-- 	</div> -->
<!-- </div> -->