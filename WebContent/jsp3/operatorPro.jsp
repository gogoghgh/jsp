<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/operatorPro.jsp</title>
</head>
<body>
	<h1>jsp3/operatorPro.jsp</h1>
	
	<h3>전달받은 숫자 2개 합 구하기</h3>
	🎈EL: ${param.num1 } + ${param.num2 } = <b> ${param.num1 + param.num2 } </b> <br>
												<!-- 음~ 더하기가 되군~ 얘는 int네~ String이 아니라~
												EL 표현식 사용하면 자동으로 형변환이 된다!! 개이덕 -->
	
	<%
		// int num2 = request.getParameter("num2"); String을 int로 못 담죠~ 형변환 하고 
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		// 근데 문제점,, 숫자가 아니라 문자 입력받아오면,,? 에러남,,,ㅋ 숫자인지 체크해서 전달해주기,, 
		
	%>
	
	🎈JSP: <%=num1 %> + <%=num2 %> = <b><%=num1 + num2 %></b> <br>
	
	<hr>
	
	<h3>num1, num2 데이터는 모두 양수쓰? <br> 비교 + 논리</h3>
	param.num1 > 0 ⏩  ${ param.num1 > 0 } <br>
	param.num2 > 0 ⏩  ${ param.num2 > 0 } <br>
	(param.num1 > 0) && (param.num2 > 0) ⏩  ${ (param.num1 > 0) && (param.num2 > 0) } <br>
	
	<hr>	
	
	<h3> num1, num2는 모두 양수? <br> 삼항연산자로 나타내기 쌉가</h3>
	<h1>${ ((param.num1 gt 0) && (param.num2 gt 0)) ? "🙆‍♀️🙆‍♀️🙆‍♀️" : "🙅‍♀️🙅‍♀️🙅‍♀️" }</h1>
	
	<hr>
	
</body>
</html>