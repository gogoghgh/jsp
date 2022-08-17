<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/deleteForm.jsp</title>
</head>
<body>
	<h1>member/deleteForm.jsp</h1>
	<h2>회원 정보 탈퇴(삭제)</h2>
	
	<%
		// 로그인 정보 체크
		String id = (String)session.getAttribute("loginID");
		
		if(id == null){
			%>
			<script type="text/javascript">
				alert("로그인 하고 오세요!!!");
				location.href = "loginForm.jsp";
			</script>
			<%
		}
		
		// 사용자 비번 입력받아서 pro 페이지로 전달
	%>
	<form action="deletePro.jsp" method="post">
		pw: <input type="password" name="pw"> 
		<input type="submit" value="탈퇴하기,,,👋😥">
	</form>
	
</body>
</html>