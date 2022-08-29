<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/jsp3/core_set2.jsp</title>
</head>
<body>
	<h1><font style="color: salmon">review</font>/jsp3/core_set2.jsp</h1>
	
	<h2>core_set.jsp에서 저장한 정보 여기서 받아보기</h2>
	<h3>EL 표현식으로</h3>
	EL name: <b>${name }</b><br>
	EL price: <b>${requestScope.price } </b><br>
	EL color: <b>${requestScope.color } </b><br>
	

</body>
</html>