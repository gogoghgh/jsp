<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/cookieDel.jsp</title>
</head>
<body>
	<h1>cookieDel.jsp <br> 서버입니다</h1>
	<h2> 원래는 Set + Del 같이 있어야 함!! 만들어보기</h2>
	
	<%
		// 쿠키값 삭제... (직접 HDD에 있는 파일 삭제 X) 
		// 쿠키가 어디있는디요? 사용자 컴터에,, 긍까 직접 삭제 못 함.. 그게 해킹이지~~~
		// -> 대신, 쿠키 유효기간을 재설정한다^^!!
		
		// 쿠키값 가져오기(현 쿠키정보) -> 쿠키 배열에 저장 ㄴㄱ
// 		request.getCookies();
		Cookie[] cookies = request.getCookies();
		
		// 생성한 해당 쿠키를 찾기
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				// 생성한 쿠키 이름을 사용해서 비교
				if(cookies[i].getName().equals("luvGH")){
					
					// 쿠키 사용하지 못 하게,, 삭제!! 
					cookies[i].setMaxAge(0); // 쿠키 유효기간을 0으로 해서 없애기
					
					// 변경된 쿠키 정보를 클라이언트에게 전달해야! 
					// 클라이언트가 들고 있는 쿠키 정보가 0이 돼서 못쓰게 되겠죠~~
					response.addCookie(cookies[i]);
					
				} //if
			} //for
			
		} // if
		
	%>
	<script type="text/javascript">
		alert("쿠키값 삭제 완");
		location.href="cookieTest.jsp";
	</script>
	
	
</body>
</html>