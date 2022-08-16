<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/main.jsp</title>
</head>
<body>
	<h1>review/member/main.jsp</h1>
	
	<%
		String id = (String)session.getAttribute("loginID");
		if(id == null) {
			System.out.println("(from main.jsp) 로그인 정보 없음,, 로그인 안 한 놈,, 쫓아내자!!");
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	
	<h2> 💕<%=id %>💖님~~~ 환영합니다~~🎉✨✨😘   </h2>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp';">
	
	<h3> 회원 정보 조회 👀 </h3>
	<input type="button" value="나의 정보 조회하기 버턴" onclick="location.href='info.jsp';">
	
	<h3> 회원 정보 수정 🧹 </h3>
	<input type="button" value="나의 정보 수정하기" onclick="location.href='updateForm.jsp';">

</body>
</html>