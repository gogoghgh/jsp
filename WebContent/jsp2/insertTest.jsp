<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/insertTest.jsp</title>
</head>
<body>
	<h1>insertTest.jsp</h1>
	
	<form action="insert.jsp" method="post"> 
		아이디: <input type="text" name="id"> <br>
		비번:  <input type="password" name="pw"> <br>
		이름:  <input type="text" name="name"> <br>
		나이:  <input type="number" name="age"> <br>
		이메일: <input type="text" name="email"> <br>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>