<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionDel.jsp</title>
</head>
<body>
	<h1>sessionDel.jsp <br> 저는 서버입니다,, 나눠진것뿐,, </h1>
	<%
		//세션 객체 삭제
		session.removeAttribute("name");
		System.out.println("세션값 삭제"); // 콘솔창 출력
	
	%>
	
	<script type="text/javascript">
		alert("요청 정보 처리 완료");
		alert("name 세션값이 삭제되었삼");
		
		location.href = "sessionTest.jsp";
		
		/* 세션값 삭제하고 -> 다시 클라이언트 페이지로 돌아가기 */

	</script>
	
</body>
</html> 