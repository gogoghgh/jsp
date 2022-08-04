<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionLogin.jsp</title>
</head>
<body>
	<h1>sessionLogin.jsp</h1>
	
	<!-- 
		1. sessionLogin.jsp   아이디, 비밀번호 입력 (유효성 체크 생략)
		2. sessionLoginPro.jsp에서 로그인 여부 체크
			(아이디 존재 여부, 비밀번호 동일한가 등)
			ID: admin,  PW: 1234
		3. 문제가 있는 경우, 다시 로그인 페이지로 이동
		4. 문제가 없는 경우(=로그인 성공), sessionMain.jsp 이동
		  (sessionMain 페이지: 로그인 없이는 접근 불가능, 로그인 성공한 아이디를 출력)
		5. 로그아웃 버튼
	 -->
	 
	 <form action="sessionLoginPro.jsp" method="post">
	 	아이디 <input type="text" name="id"> <br>
	 	비밀번호 <input type="password" name="pw"> <br>
	 	<input type="submit" value="로그인">
	 </form>
	 
</body>
</html>