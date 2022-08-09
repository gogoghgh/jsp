<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/insertForm.jsp</title>
</head>
<body>
	<h1>member/insertForm.jsp</h1>
	<h2>회원 가입 페이지</h2>
	
	<!-- 아이디, 비밀번호, 이름, 나이, 성별, 이메일, 회원가입일 입력 받기-->
	<fieldset>
		<form action="insertPro3.jsp" method="post">
			아이디: <input type="text" name="id"> <br>
			비번: <input type="password" name="pw"> <br>
			이름: <input type="text" name="name"> <br>
			나이: <input type="text" name="age"> <br>
			성별: <input type="radio" name="gender" value="여">여 
				<input type="radio" name="gender" value="남">남  <br>
			이멜: <input type="text" name="email"> <br>
			<!-- 가입일: <input type="text" name="regdate"> <br> 
			회원이 선택할 수 있는 게 아니니까,,-->
			<hr>
			<input type="submit" value="가입하기🤗">
		</form>
	</fieldset>
	
</body>
</html>