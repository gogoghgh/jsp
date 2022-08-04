<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/testForm1</title>
</head>
<body>
	<h1>testForm1.jsp</h1>
	
	<h2>정보 전달!! - form 태그~~~ </h2>
	
	<form action="testPro1.jsp" method="get"> <!-- jsp페이지만! 받을 수 있음 html페이지는 안됨 
													get방식으로 데이터 보낼게요~-->
		🔢 좋아하는 숫자💯 입력:  <input type="number" name="num"> 
											<!-- name이 파라미터 명이다! 전달되는 정보 이름이다! -->
		
		<input type="submit" value="전송하기">
		<!-- form은 정보 전달을 목적으로 함,, 요청할 때 그 정보가 같이 감
		이 정보 가지고 가서 pro1페이지 보여줘~
		하면 pro 페이지는 그 요청 받아서 화면에 보여주는 것 -->
		
	</form>
</body>
</html>