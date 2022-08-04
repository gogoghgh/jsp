<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionDel</title>
</head>
<body>
	<h1>sessionDel.jsp <br> 서버 페이지</h1>
	
	<%
		// 세션 객체 삭제
		session.removeAttribute("name");
		System.out.println("name 세션값 삭제 완");
	
	%>
	
	<script type="text/javascript">
	alert("요청 정보 처리 완");
	alert("name 세션값 삭제 완");
	
// 	세션값 삭제하고 -> 다시 클라이언트 페이지로 돌아가기
	location.href='sessionTest.jsp'; // 작은 따옴표도 되네 ㅎ
	
	</script>
	
</body>
</html>