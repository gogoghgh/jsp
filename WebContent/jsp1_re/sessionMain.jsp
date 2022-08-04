<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/sessionMain.jsp</title>
</head>
<body>
	<h1>sessionMain.jsp</h1>
		// 로그인 성공 못 했으면 접근 불가능하게(다시 Login페이지로 이동)
		// 로그인 성공 시, 아이디 출력 + 환영 멘트~~
	
	<%
		// 넘어온 값을 세션에 저장해야 할텐데??? 따로 set 해서 세션에 저장 안 해도 되는건가?
		//	-> 세션에 정보 있으면, 로그인 성공한거고
		//     세션에 정보 없으면, 로그인 실패한거고
		
		// 로그인 정보(세션값) 사용
		String id = (String)session.getAttribute("id");
		System.out.println("로그인 성공쓰한 id" + id);
		
		// id가 null이면,,,, 세션값 없는 거니까,, 로그인 성공 X,,,
		if(id == null){
			response.sendRedirect("sessionLogin.jsp");
		}
	%>
	
	<%=id %> 회원님 반가워용 🐉🐉💝💝
	
	<input type="button" value="로그아웃" onclick="location.href='sessionLogin.jsp'">
	
</body>
</html>