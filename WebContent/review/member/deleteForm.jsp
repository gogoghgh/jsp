<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/deleteForm.jsp</title>
</head>
<body>
	<h1>review/member/deleteForm.jsp</h1>
	<h2>회원 정보 탈퇴(삭제)</h2>

	<%
		// 1. 로그인 여부 체크
		String id = (String) session.getAttribute("loginID");
		
		if(id == null){
			System.out.println("(from deleteForm.jsp) 로그인 안 한 놈 왔다,, 쫓아내자");
			response.sendRedirect("loginForm.jsp");
		}
		
		// 2. 폼태그로 사용자 비번 입력받아서 -> pro 페이지로 전달
	%>
	
	<h3> 💖<%=id %>💖님,,, 탈퇴를 원하신다면,,, <br>
	비번을 다시 한 번 입력해주세요,, 😿 </h3>
	
	<form action="deletePro.jsp" method="post">
		pw: <input type="password" name="pw">
		<input type="submit" value="탈퇴하기,,😢😭">
	</form>

</body>
</html>