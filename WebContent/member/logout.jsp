<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
	<h1>member/logout.jsp</h1>
	
	<%
		// 로그인 정보 제거 (세션 정보 초기화)
		session.invalidate();
		System.out.println("세션 초기화 완 (from logout.jsp)");
	%>
	
	<script type="text/javascript">
		alert("로그아웃 완~~ 👋👋");
		location.href = "main.jsp"; 
			// 왜 메인 페이지로? 메인 페이지 상단에 로그인 안 한 놈은 못 들어오게 되어 있으니까~
			// 세션 정보 null인 놈 -> main -> loginForm으로 가겠군
	</script>
	
</body>
</html>