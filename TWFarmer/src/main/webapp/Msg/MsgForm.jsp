<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>寫封站內信</title>
</head>
<body>
    <form action="<c:url value="MsgCreatingServlet"/>" method="POST"> 
        <table border="0" width="35%" align="center">
            <caption><h2>寄送站內訊息</h2></caption>
            <tr>
				<td width="50%">寄件人：</td>
				<td>${sessionScope.Msg.msgWriterId}</td>
				<td></td>
			</tr>
            
            <tr>
                <td width="50%">收件人 </td>
                <td><input id='msgReaderId' value ="${param.msgReaderId}" type="text" name="msgReaderId" size="50"/>
                <div style="color: #FF0000; display: inline">${errors.msgReaderId}</div></td></tr>
            <tr>
                <td>標題 </td>
                <td><input id='msgTitle' value="${param.msgTitle}" type="text" name="msgTitle" size="50"/>
                <div style="color: #FF0000; display: inline">${errors.msgTitle}</div></td>
            </tr>
            <tr>
                <td>內文 </td>
                <td><textarea rows="10" cols="39" name="msgContent">${param.msgContent}</textarea>
                <div style="color: #FF0000; display: inline">${errors.msgContent}</div></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="送出"/></td>
            </tr>
            
            
            
        </table>
         
    </form>
</body>
</html>