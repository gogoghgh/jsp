<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/main.jsp</title>
</head>
<body>
	<h1>member/main.jsp</h1>
	
	<!-- 반드시 로그인 성공 시에만 방문 가능
		로그인 X 놈이 왔을 경우, 로그인 페이지로 이동시키기 -->
	
	<%
		// 세션 영역에 있는 로그인 아이디 정보를 가져오기
			// jsp 내장객체니까 바로 쓸 수 있음 알고 있쥐?
		String id = (String)session.getAttribute("loginID");
		
		if(id==null){ 
			// 세션에 저장된 아이디 정보가 없다 = 로그인 안 한 놈
			System.out.println("로그인 정보 없음 (from Main.jsp)");
			
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	
	<h2> 💘<%=id %>💘님~~~ <br> 환영합니다!!! 🤗😘   </h2>
	
	<input type="button" value="로그아웃" onclick=" location.href='logout.jsp'; ">	
	
	<hr>
	
	<h3>개인 정보 조회</h3>
	<input type="button" value="개인 정보 조회" onclick=" location.href='info.jsp'; ">	
	
	<h3><a href="updateForm.jsp"> 개인 정보 수정 </a></h3>
	
	
</body>
</html>