<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionSet.jsp</title>
</head>
<body>
	<h1>sessionSet.jsp  <br>서버 개념 페이지</h1>
	
	<%
	// 세션 객체 생성~ 이 아니죠 세션은 이미 존재하니까~~~ 내장객체..
	// !!!!!!!1 세션값 생성 !!!!!!!!!!
	session.setAttribute("name", "ITWILL");  // name이라는 키 값으로 ITWILL 이라는 세션값 저장쓰
	session.setAttribute("id", "BUSAN");
	
	System.out.println("name : ITWILL 세션값 생성 완");
	
	%>
	
	<script type="text/javascript">
		alert("요청 정보 처리 완료");
		alert("세션값 생성 완료");
		
		location.href = "sessionTest.jsp"; 
		
		/* 서버에 세션값 저장하고 -> 다시 클라이언트 페이지로 돌아가기 */
	
	</script>
	
</body>
</html>