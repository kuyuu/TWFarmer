<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <meta name="description" -->
<!-- 	content="Source code generated using layoutit.com"> -->
<!-- <meta name="author" content="LayoutIt!"> -->
<!-- <title>台灣小農</title> -->

 <!-- Favicon 網頁上小icon --> 
<!-- <link rel="shortcut icon" type="image/x-icon" -->
<!-- 	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" /> -->

<!-- <link href="/TWFarmer/css/bootstrap.css" rel="stylesheet"> -->
<!-- <link href="/TWFarmer/css/style.css" rel="stylesheet"> -->
<!-- </head> -->
<!-- <body> -->
 	<!-- 上方選單start --> 
<!-- 	<div class="container"> -->
<%-- 		<jsp:include page="common/menu.jsp" /> --%>
		<div class="container">
			<div class="row">
					<div class="col-md-12">
						<!-- 		會員登入表單    Start    -->
<!-- 							<div -->
<!-- 								style="font-weight: bold; color: #ff0000; margin: .67em 0; font-size: 2em;">會員登入</div> -->
							<form action="<c:url value="/LittleLogin.controller" />" method="post"
								role="form">

								<div class="form-group ">
									<label for="exampleInputEmail1">帳號</label> <input type="text"
										name="account" value="" class="form-control"
										id="exampleInputEmail1" placeholder="請輸入帳號"> <span style="color: #ff0000">${errors.account}</span>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">密碼</label> <input
										type="password" name="password" value="" class="form-control" 
										id="exampleInputPassword1" placeholder="請輸入密碼"/> <span style="color: #ff0000">${errors.password}</span>
								</div>
								<div>
									<span style="color: #ff0000">
										<h4>${errors.LoginError}</h4>
									</span>
								</div>
								<button type="submit" class="btn btn-default">登入</button>
							</form>
						</div>

						<!-- 會員登入表單  End -->
				</div>
		</div>
<!-- 	</div> -->
 	<!-- 上方選單 End --> 


<!-- 	<script src="js/jquery.min.js"></script> -->
<!-- 	<script src="js/bootstrap.js"></script> -->
<!-- 	<script src="js/scripts.js"></script> -->

<!-- </body> -->
<!-- </html> -->