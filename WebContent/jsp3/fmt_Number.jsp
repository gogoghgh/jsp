<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/fmt_Number.jsp</title>
</head>
<body>
	<h1>jsp3/fmt_Number.jsp</h1>
	<h2> Formatting library <br> 
		숫자 데이터를 원하는 형태로 출력 </h2>
	
	HTML: 10000000 <br>
	HTML: 10,000,000 <br>
	
	<%
		pageContext.setAttribute("money", 999999999);
	%>
	
	<h3>JSTL fmt</h3>
	groupingUsed 생략: &nbsp;&nbsp; <fmt:formatNumber value="10000000" /> <br>
	groupingUsed="true" &nbsp;&nbsp; <fmt:formatNumber value="10000000" groupingUsed="true"/> <br>
	groupingUsed="false" &nbsp;&nbsp; <fmt:formatNumber value="10000000" groupingUsed="false"/> <br>
	
	💰My 월급💰: ${money }원 <br>
	💰My 월급💰: <fmt:formatNumber value="${money }" />원 <br>
			<!-- EL로 쓰니까,, groupingUsed = true 가 default네?!! 쌉편하네 -->
	
	<hr>
	
	<h3> 소수점 표현</h3>
	🤓 3.1233456   소수점 2번째 자리까지만 표기하3 <br>
	#.##:  <fmt:formatNumber value="3.1233456" pattern="#.##"/> <br>
	#.##########: <fmt:formatNumber value="3.1233456" pattern="#.##########"/> <br>
	
	🤓 10.5   ->   10.500 형태로 출력 <br>
	#.000:  <fmt:formatNumber value="10.5" pattern="#.000" /> <br>
	
	🤓 0.5  ->  50% <br>
	0.5: <fmt:formatNumber value="0.5" type="percent"/> <br>
	0.318: <fmt:formatNumber value="0.318" type="percent"/> <br>
	43/29: <fmt:formatNumber value="${43/29 }" type="percent"/> <br>
	
	<h3>통화</h3>
	💰My 월급💰: <fmt:formatNumber value="${money }" type="currency"/>원 <br>
												<!-- 타입 = 통화 -->
	💰My 월급💰: <fmt:formatNumber value="${money }" type="currency" currencySymbol="$"/>원 <br>
	
	
</body>
</html>