<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/testPro2.jsp</title>
</head>
<body>
	<h1>testPro2.jsp</h1>
	<%
		// get 말고 post 방식으로 한글 데이터를 전달하면?
		// 인코딩이 변경된다!! = 한글이 깨진다!!! 
		// post는 바디에 담아 보내서,, 인코딩 바뀌어 전송됨
		// 다시 살려~~~ 살려야해~~
		request.setCharacterEncoding("UTF-8");
		// 전달받을 데이터 받기 전에! 데이터 저장 전에! 
		// 가장 먼저 처리해주기

		// 받은 정보 저장 먼저!!!	
		// 이름
		String name = request.getParameter("name");
		// 나이
		int age = Integer.parseInt(request.getParameter("age"));
		// 성별
		String gender = request.getParameter("gender");

		// 취미
		String hobby = request.getParameter("hobby");
		String[] hobbies = request.getParameterValues("hobby");
		// 복수 선택해도 하나만 나오네,,

		// 강의장
		String room = request.getParameter("room");
	%>

	이름:
	<%=name%>
	<br> 나이:
	<%=age%>
	<br>
	<%-- 이렇게 바로 하니까 안되더라고,,, 데이터 저장 먼저 
	<%= 
		request.getParameter("name")
		request.getParameter("age")
	%> 
	--%>

	<!-- 20살 이상 "성인입니다" / 20살 미만 "미자입니다" -->
	<%
		if (age >= 20) {
			out.println("성인입니다");
		} else {
			out.println("미자입니다");
		}
	%>
	성별:
	<%=gender%>
	<br> 취미:
	<%=hobby%>
	<br> 찐 취미:
	<%-- 
	<%= hobbies[0] %>, 
	<%= hobbies[1] %>, 
	<%= hobbies[2] %>    --%>

	<%
		if (hobbies != null) {
			for (int i = 0; i < hobbies.length; i++) {
	%>
				<%=hobbies[i]%>	<br>
	<%
			} //for
		} //if
		// 배열 반복문에 쓸 때: 데이터 있나 없나 체크 먼저 하고 (null 판별 먼저 하고) 반복문 돌리기
	%>
	<!-- 			out.println(hobbies[i] + ", ");
		}
	%> -->
	<br> 강의장:
	<%=room%>
	<br>

</body>
</html>