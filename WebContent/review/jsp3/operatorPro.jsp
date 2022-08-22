<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/jsp3/operatorPro.jsp</title>
</head>
<body>
	<h1>review/jsp3/operatorPro.jsp</h1>
	
	<h3>전달받은 두 수의 합</h3>
	<%
		int num1 = 0;
		int num2 = 0;

	// 숫자 말고 다른 애들 못 들어오게,, 하고 싶었으나 실패,,ㅋ 넘어가자 일단
// 	if ( ((Object)num1).getClass().getSimpleName().equals("Integer")
// 		 && ((Object)num2).getClass().getSimpleName().equals("Integer") ) {
		
		// String으로 파라미터에서 넘어오니까 int로 형변환 해줘야 함
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
			
	%>
	jsp 표현식: <%=num1 %> + <%=num2 %> = <%=num1+num2 %> <br> 
	EL 표현식: ${param.num1 } + ${param.num2 } = ${param.num1 + param.num2 } <br>
			<!-- EL표현식에선 자동 형변환!! String이 아니라 int라서 더하기 삽가능 -->
	
	<hr>
	
	<h3>num1, num2 모두 양수? (EL)</h3>
	${ (param.num1 gt 0) && (param.num2 gt 0) ? "예스🙆‍♀️" : "노..🙅‍♀️" }
	<!-- 			>                    > 			-->
	
</body>
</html>