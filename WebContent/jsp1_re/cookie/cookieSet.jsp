<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/cookieSet.jsp</title>
</head>
<body>
	<h1>cookieSet.jsp <br> 저는 서버입니당 ㅎ</h1>
	
	<%
		System.out.println("서버: 클라이언트 요청 받았음,, 클라이언트님이 쿠키 생성하라고 버튼 누름");
		System.out.println("서버: 클라이언트님과의 상태를 유지하기 위해서 쿠키를 생성하겠습니다^^ ");
		
		// 서블릿 API 사용해서 쿠키 객체 생성(new)
		//   -> 메모리에는 로드되어 있고(=올라가있고), 하드디스크에는 저장되지 않은 상태
		Cookie cookie = new Cookie("name", "가현스ghgh⛵🛫🚀🏳‍🌈🌎🌝🌞⭐🌟");
		
		// 쿠키 사용기간 설정
		cookie.setMaxAge(600);
		
		// 쿠키 보내기 (to. 클라이언트,,)
		response.addCookie(cookie);
		System.out.println("서버: 쿠키 정보 생성 -> 전달 완");
	%>
	
	<script type="text/javascript">
		alert("🍪쿠키값 생성 완");
		location.href = "cookieTest.jsp";
	</script>
	
</body>
</html>