<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/core_if.jsp</title>
</head>
<body>
	<h1>jsp3/core_if.jsp</h1>
	
	<h3> 속성값 생성 & 출력 </h3>
	<c:set var="name" value="ITWILL📱"/>
	name: ${name } <br>
	
	<hr>
	
	<h3> if문 시작 </h3>
	<!-- test 속성값은 el표현식을 사용하여 값을 비교한다 -->
	<c:if test="${ 10 < 20 }">
		10 < 20 <br>
	</c:if>

	<c:if test="${ 10 lt 20 }">
		10 less than 20 <br>
	</c:if>
	
	<!-- name 정보가 itwill일 경우, itwill님 안녕하세요^^ 출력 -->
	<c:if test="${name eq 'ITWILL📱' }">  <!-- "", '' 구분 잘!! -->
		${name } 님 안녕하세요^^ <br>
	</c:if>

	<hr>
	
	<h3>choose</h3>
	<!-- switch-case 형태와 유사 -->
	<!-- 
		when:  case 느낌         (~할 때: 조건) 
		otherwise: default 느낌  (그렇지 않으면~~ when 애들 다 아니면 여기로 옴) 
		    ㄴ if: if-else 느낌
	-->
	<c:choose>
		<c:when test="${ 10 gt 20 }"> 
			10 greater than 20
			거짓이라서 실행 X
		</c:when>
		<c:when test="${ 10 lt 20 }">
			10 less than 20
		</c:when>
		<c:otherwise>
			<c:if test="${ 10 != 20 }">
				10 not equal 20 
			</c:if>
		</c:otherwise>
	</c:choose>
</body>
</html>