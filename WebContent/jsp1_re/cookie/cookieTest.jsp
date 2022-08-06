<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/cookieTest.jsp</title>
</head>
<body>
	<h1>
		cookieTest.jsp <br> 클라이언트 페이지
	</h1>

	<input type="button" value="🍪쿠키 생성"
		onclick="location.href='cookieSet.jsp'">
	<input type="button" value="🍪쿠키 삭제"
		onclick="location.href='cookieDel.jsp'">
	<hr>
	
	<%
		// cookieSet 서버가 보내준 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();

		// 쿠키값이 있는지 제어문으로 체크
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("name")){ // 아씨 여기 빠자먹음!!!! 
					// 쿠키 배열 i번째 놈 이름 가져와봐,, = 같냐? "name"이랑?
					out.println("🍪쿠키 이름: " + cookies[i].getName() + "<br>");
					out.println("🍪쿠키값: " + cookies[i].getValue() + "<br>");
				}// if
			}// for
		}// if
	%>

</body>
</html>