<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/logout.jsp</title>
</head>
<body>
	<h1>review/member/logout.jsp</h1>
	
	<%
		// 로그인 정보 제거 (= 세션 정보 초기화)
		session.invalidate();
		System.out.println("(from logout.jsp) 로그인 세션 초기화 완");
	%>
	
	<script type="text/javascript">
		alert("로그아웃 완~~ ㅂ2 😘👋")
		location.href = "main.jsp"; 
					//main으로 보내도 session 정보 null인 놈은 -> loginForm 으로 가도록 설계해놨으니 ㄱㅊ^^
	</script>
	
</body>
</html>