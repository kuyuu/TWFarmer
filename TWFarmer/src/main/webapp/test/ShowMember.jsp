<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:useBean id="memberDaoJdbc" class="model.dao.MemberDAOJdbc" scope="session" />
<jsp:useBean id="memberBean" class="model.MemberBean" scope="session" />
<c:set var="subTitle" value="顯示會員資料"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty LoginOK}"> 
   <c:set var="target" value="${pageContext.request.servletPath}" scope="session" />
   <c:redirect url="../Login.jsp" />
</c:if>                
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${subTitle}</title>
</head>
<body>
  <c:choose>
      <c:when test="${ empty LoginOK}">
          目前尚未有任何會員資料
      </c:when>
      <c:otherwise>
            會員資料如下：<BR>
            <TABLE border='1'>
                <TR>
            <TH width=‘120’>會員帳號</TH>
            <TH width=‘120’>密碼</TH>
            <TH width='140'>姓名</TH>
            <TH width='360'>地址</TH>
            <TH width='130'>電話</TH>
            <TH width='150'>生日</TH>
        </TR>
        <TR>
            <TD> ${LoginOK.memberId}</TD>
            <TD> ${LoginOK.password}</TD>
            <TD> ${LoginOK.name}</TD>
            <TD> ${LoginOK.address}</TD>
            <TD> ${LoginOK.phone}</TD>
            <TD> ${LoginOK.birthDate}</TD>
         </TR>
    </TABLE>
    <c:if test="${not empty IsFarmer }">
    	${IsFarmer.farmerId }
    </c:if>
    <c:if test="${not empty manager }">
    	i am manager
    </c:if>
  </c:otherwise>
</c:choose>
<br>
<!-- 
<a href="../index.jsp">回首頁</a>
 -->
<a href="<c:url value='../index.jsp' /> ">回首頁</a>
</body>
</html>
        
