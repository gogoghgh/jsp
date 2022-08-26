<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet/Beans.jsp</title>
</head>
<body>
	<h1>servlet/Beans.jsp</h1>
	
	<h3>전달된 사람의 정보 출력하기</h3>
	
	EL requestScope.kim: <b> ${requestScope.kim } </b><br>
	EL requestScope.kim.name: <b>${requestScope.kim.name }</b><br>
	EL requestScope.kim.age: <b>${requestScope.kim.age }</b><br>
<%-- 	EL requestScope.kim.samsung: <b>${kim.samsung }</b><br>  --%>
	EL requestScope.kim.phone: <b>${kim.phone }</b><br> 
								<!-- requestScope 생략해도 ㅇㅋ -->
	EL requestScope.kim.phone.model: <b>${kim.phone.model } </b><br>
	EL requestScope.kim.phone.color: <b>${kim.phone.color }</b><br> 
	EL requestScope.kim.phone.prive: <b>${kim.phone.price }</b><br> 
	
	<hr> 
	
	<h3>근데 변수명 너무 길어서~ core library로</h3>
	<c:set var="p" value="${kim.phone }" />
		   <!-- 얘를 p로 저장해서 p로 불러오기 -->
	EL p.model: <b>${p.model } </b><br>
	
</body>
</html>