<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/sessionLogin.jsp</title>
</head>
<body>
	<h1>sessionLogin.jsp</h1>
	
	<form action="sessionLoginPro.jsp" method="post">
		아이디: <input type="text" name="id"> <br>
		비밀번호: <input type="password" name="pw"> <br> 
		<input type="submit" value="로그인">
	</form>
</body>
</html>