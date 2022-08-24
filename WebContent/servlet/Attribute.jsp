<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet/Attribute.jsp</title>
</head>
<body>
	<h1>servlet/Attribute.jsp</h1>
	<h4> == (☞ﾟヮﾟ)☞TestServlet2 (서블릿)과 연결되어 있습니다 ☜(ﾟヮﾟ☜) <br> 
		 == TestServlet2 에서 정보 공유 가능</h4>
	<p>  == java코드와 -- jsp코드(→html→js) 간에,, 서로 전달하며,, 영향을 끼칠 수 있다,, </p>
	
	<hr>
	
	<h2>🎅EL에서 썼던 개념들 다시 확인🤓</h2>
	<%
		// jsp 변수 = 해당 페이지에서만! 사용 가능 
		//             => 다른 페이지에서 쓰려면? 파라미터 전달 or 영역에 담아서 전달
		int cnt = 100;
		
		// request 영역에 저장된 정보 사용
		int cnt2 = (Integer)request.getAttribute("cnt");
					// int로 하던가,, Integer -> int 오토언박싱 ㅋ,, 하하하
		
		// session 영역에 저장된 정보 사용
		int cnt3 = (int)session.getAttribute("cnt");
		
	%>
	
	<h3> 걍 여기서 선언한 cnt (=변수) </h3>
	(JSP)cnt: <b> <%=cnt %> </b><br>
	(JSP)cnt + 200: <b> <%=cnt+200 %> </b> (연산 쌉가능) <br>
	
	<!-- 영역에서 공유되는 데이터 = 속성이니까 ,,,, ,속성값이다~~ 변수가 아니라,, ㅋ -->
	<h3>request 영역의 cnt (=속성)</h3>
	(JSP)cnt: <b> <%=cnt2 %> </b><br>
	(JSP)cnt + 2000: <b> <%=cnt2 +2000 %> </b><br> 
	(EL)cnt: <b> ${cnt } </b><br> 
			<!-- request 영역에 cnt로 저장해서 넘어온거니, cnt로 불러오기,, cnt2가 아니라~ -->
	(EL)cnt + 500: <b> ${cnt + 500 } </b> (연산 쌉가능) <br> 
	(EL)requestScope.cnt + 500: <b> ${requestScope.cnt + 500 } </b><br>
	 
	<h3>session 영역의 cnt (=속성)</h3>
	(JSP)cnt: <b><%=cnt3 %> </b> <br>
	(EL)sessionScope.cnt: <b>${sessionScope.cnt } </b> <br>
	(EL)cnt: <b> ${cnt } </b><br> 
				<!-- 영역 생략하면,, 2.request 먼저 만나니까,,, request에 있는 cnt 들고와버림 
					1. page -> 2. request -> 3. session -> 4. application 이었잖아염      -->
	
</body>
</html>