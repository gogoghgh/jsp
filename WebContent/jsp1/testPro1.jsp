<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- html4에서는 number 없어가지고~~ 5로 바꿀게염 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/testPro1.jsp</title>
</head>
<body>
	<h1>testPro1.jsp</h1>
	<%
		// 주소에 전달되는 정보 = 파라미터(매개변수) = String 타입으로 처리됨
		// http 요청 정보는 파라미터 형태로 전달될 때 항상 String 타입임
		int num = Integer.parseInt(request.getParameter("num"));
						// ㄴstatic 메서드,, 문자열 짤라서(=파싱) 인트로 바꿔준다
						// 메서드가 메서드 호출 가능.. 자주 볼거임
	%>
	<%=num+100%> 정수니까 계산 가능  <br> 
	<%=request.getParameter("num")+100 %> 문자열이라서 계산 불가 <br> 
	<!-- // 표현식 안에 적어줘야! 화면에 보이넴 -->
	 
</body>
</html>