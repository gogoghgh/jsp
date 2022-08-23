<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core, formatting 둘 다 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/fmt_Date.jsp</title>
</head>
<body>
	<h1>jsp3/fmt_Date.jsp</h1>
	
	(JSP) new Date() ⏩ <%=new Date() %> <br>
	
	<c:set var="today" value="<%=new Date() %>" />
	
	EL today ⏩	${today } <hr>
	
	formatDate value= "EL today" ⏩ (날짜) 
	<fmt:formatDate value="${today }"/> <br>
	
	formatDate value= "EL today" type="time" ⏩ (시간) 
	<fmt:formatDate value="${today }" type="time"/> <br>
	
	formatDate value= "EL today" type="both" ⏩  (날짜+시간)
	<fmt:formatDate value="${today }" type="both"/> <br>
	
	<h4>dateStyle</h4>
	full ⏩ <fmt:formatDate value="${today }" dateStyle="full"/> <br>
	long ⏩ <fmt:formatDate value="${today }" dateStyle="long"/> <br>
	medium ⏩ <fmt:formatDate value="${today }" dateStyle="medium"/> --- 생략 시, default<br>
	short ⏩ <fmt:formatDate value="${today }" dateStyle="short"/> <br>
	
	<h4>timeStyle</h4>
	full ⏩ <fmt:formatDate value="${today }" type="time" timeStyle="full"/> <br>
	long ⏩<fmt:formatDate value="${today }" type="time" timeStyle="long"/> <br>
	medium ⏩<fmt:formatDate value="${today }" type="time" timeStyle="medium"/> --- 생략 시, default<br>
	short ⏩<fmt:formatDate value="${today }" type="time" timeStyle="short"/> <br>
	<br>
	
	<fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="long"/>
	
	<hr>
	
	🤓2022/8/23(화) (오후) 4:23:00 🤓<br>
	<h1>
	<fmt:formatDate value="${today }" pattern="🎅yyyy💖MM🕺dd 🎇(E)🐉"/>
	<fmt:formatDate value="${today }" type="time" pattern="hh💫mm🚀ss" /> <br>
	</h1>
	
	
</body>
</html>