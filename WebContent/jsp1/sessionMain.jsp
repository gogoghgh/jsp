<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionMain.jsp</title>
</head>
<body>
	<h1>sessionMain.jsp</h1>
<!-- sessionMain 페이지: 로그인 없이는 접근 불가능, 로그인 성공한 아이디를 출력 -->
	<% 
		/* 세션에 정보 있으면, 로그인 성공한거고,
		세션이 정보 없으면, 로그인 실패한거고 */
		
		//로그인 정보(세션값) 사용
		String id = (String)session.getAttribute("id");
	
		if(id==null){
			response.sendRedirect("sessionLogin.jsp");
		}
		
	%>
	
	<%=id  %> 회원님 반가워용 🐉🐉
	
	<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp'">
	
</body>
</html>