<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>商品新增成功</h1><br>
您的商品資料：<br><br>
商品編號:${productBean.productId}<br>
產地:${productBean.origin}<br>
商品名稱:${productBean.productName}<br>
庫存:${productBean.inventory}<br>
單位價格:${productBean.price}<br>
單位編號:${productBean.unitId}<br>
類別編號:${productBean.productTypeId}	<br>
商品介紹:${productBean.productIntro}<br>
運費:${productBean.freight}<br>
上架日期:${productBean.addDate}<br>
預估下架日期:${productBean.removeEstDate}<br>
下架日期:${productBean.removeDate}<br>
商品狀態:${productStatusBean.productStatusName}<br>
商品圖片編號:${productPicBean.productPicId}<br>
商品圖片介紹:${productPicBean.pictureIntro}<br>
</body>
</html>