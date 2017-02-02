<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>寄送成功</title>
</head>
<body>
<h1>站內信順利寄出</h1><br>
以下是您的訊息內容：<br><br>
信件流水號:${msgBean.msgId}<br>
寄件者:${msgBean.msgWriterId}<br>
收件者:${msgBean.msgReaderId}<br>
標題:${msgBean.msgTitle}<br>
內文:${msgBean.msgContent}<br>

</body>
</html>