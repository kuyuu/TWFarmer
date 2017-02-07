<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知瀏覽器不用Cache回應資料</title>
<script type="text/javascript" src="../scripts/ajax.js"></script>
</head>
<body>
<h2>Cache回應範例展示</h2>
<div id="currentTime">目前時間為...</div>
<p />
<input type="button" value="顯示目前時間" onclick='sendRequest("<c:url value="/ch02/ShowMessage" />", "currentTime")' />
<p />
</body>
</html>