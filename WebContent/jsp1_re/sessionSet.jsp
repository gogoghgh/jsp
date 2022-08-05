<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionSet</title>
</head>
<body>
	<h1>sessionSet.jsp <br> 서버 페이지</h1>
	
	<%
		// 세션 객체 생성
		session.setAttribute("id", "gogoghgh🐱‍🏍");
		session.setAttribute("name", "BUSAN🌊");
		System.out.println("세션값 생성 완");
	%>
<!-- 	 	서버에 세션값 저장하고 -> 다시 클라이언트 페이지로 돌아가기 -->
		<script type="text/javascript">
			alert("요청 정보 처리 완");
			alert("세션값 생성 완");
			location.href = "sessionTest.jsp";
		</script>
</body>
</html>