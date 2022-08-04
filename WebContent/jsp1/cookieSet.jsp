<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/cookieSet.jsp</title>
</head>
<body>
	<h1>cookieSet.jsp<br> 서버 역할 페이지,,</h1>
	<h2> p281 </h2>
	
	<%
		System.out.println("My name is 서버: 클라이언트 요청 받았음");
		System.out.println("My name is 서버: 클라이언트와의 상태를 유지!하기 위해 쿠키를 생성할 거예요 = 커피 쿠폰 줄 거");
	
		// 서블릿 API 사용
		// 쿠키 객체 생성 
		//        -> 메모리에는 로드되어 있고(=올라가있고) / 하드디스크에는 저장 안 된 상태
		Cookie cookie = new Cookie("name", "ITWILL");
								//   key     value
		Cookie cookie2 = new Cookie("luvGH", "💘🐶🤭👍🕺💫💌💝🐉🎇");

		// 쿠키 설정 (쿠키 사용기간 설정,, 초 단위,,, 얼마동안 이 쿠키 쓰도록 할거냐)
		cookie.setMaxAge(600); // 10분 동안 쓸 수 있음,, 근데!! 10분 지나도 사라지진 않음,, 
								// 유효기간 지난 쿠폰도 종이는 남아있듯이,,,, 불타 없어지진 않좌놔요 ㅋ
		cookie2.setMaxAge(6000);
		
		// 쿠키 보내기 (to 클라이언트님,,)
		response.addCookie(cookie);
		response.addCookie(cookie2);
		System.out.println("My name is 서버: 쿠키 정보 생성 -> 전달 완료");
		
	%>
	
	<script type="text/javascript">
		alert("쿠키값 생성 완");
		location.href="cookieTest.jsp";
	</script>
	
</body>
</html>