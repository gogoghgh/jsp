<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionInv.jsp</title>
</head>
<body>
	<h1>sessionInv.jsp  서버 ,, </h1>
	
	<%
		session.invalidate();
		System.out.println("세션값 초기화 완"); 
	
	%>
	
	<script type="text/javascript">
		alert("세션값 초기화 완료");
		
		location.href = "sessionTest.jsp";
	</script>

</body>
</html>