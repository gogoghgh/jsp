<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/scopeForm.jsp</title>
</head>
<body>
	<h1>개 중 요 함</h1>
	<h1>scopeForm.jsp</h1>

	<h2>영역 : 데이터의 공유되는 범위</h2>
	[page, request, session, application]
	<h2>영역객체 : 데이터의 공유되는 범위에 접근가능한 객체</h2>
	[pageContext, request, session, application]
	<h2>유효범위</h2>
	[해당페이지, 요청이 처리되는페이지, 세션유지되는 페이지, 서버실행되는 모든페이지]
	
	<hr>
	
	<form action="scopePro.jsp" method="get">
		아이디: <input type="text" name="id">
		이름: 
		<input type="submit" value="전송하기">
		
	</form>
</body>
</html>