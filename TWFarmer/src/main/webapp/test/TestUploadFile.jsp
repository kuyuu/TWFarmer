<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<form action="UploadFileServlet" method="POST" enctype="multipart/form-data">
產品編號<input type="text" name="productId" /><br>
圖片1<input type="file" name="picture" /><br>
圖片1介紹<input type="text" name="pictureIntro"><br> 
<input type="submit" value="送出" />
</form>
</body>
</html>