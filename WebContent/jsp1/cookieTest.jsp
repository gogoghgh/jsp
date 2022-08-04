<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/cookieTest.jsp</title>
</head>
<body>
	<h1>cookieTest.jsp <br> 클라이언트 페이지임~ </h1>
	쿠키: HTTP 프로토콜 정보가 웹페이지의 정보를 저장 X
	     => 서버와의 상태를 저장하기 위해서 사용하는 정보(클라이언트)
	     => 이름, 값, 유효기간, 도메인, 경로와 같은 정보들로 구성되어 있다 
	     	(주로 숫자, 알파벳 등으로 만들어져 있음 + 특수기호, 공백,, 은 별도 인코딩 필요!)
	     
	     <!-- 
	     쿠폰 있으면? 울 집에 왔던 사람이네~ 확인할 수 있음., 이기 쿠키다!!
	     로그인 시, 아이디 기억하기 버튼,, 이 쿠키다!
	     쇼핑할 때, 최근 본 상품,, 떠있는 거,,가 쿠키다!!
	     팝업창 하루동안 안 보기, 일주일동안 안 보기,, 이것도 쿠키다!! 쿠키 헤더 정보 활용해서,,
	     
						담에 갔을 때 이 쿠키 보고,, 아 함 왔던 애네~ ㅎㅇ~ 
	     				(C)
	     			  -- 요청 ->

	     클라이언트        			서버 (new Cookie)
			(C)
	     			<- 응답(C) --
	     				ㄴ만들어놓은 쿠키 같이 가져감
	     				
	     	ㄴ쿠키 갖게 됨~ (그래도 연결은 끊긴다!)
	      
	     -->
	   <hr>
	   
	<%
		// 클라이언트,,
		// 서버가 준 쿠키값 가져오기 => 쿠키 정보는 쿠키 '배열'의 형태로 전달됨
		Cookie[] cookies = request.getCookies();
		
		// 쿠키값이 있는지 제어문으로 쳌쳌
		if (cookies != null){
			// 참 = 쿠키값이 존재한다면,,
			for(int i=0 ; i < cookies.length; i++ ){  // 반복문 사용! 왜냐 쿠키가 배열에 있으니까
// 				if(cookies[i].getName().equals("name")){  // new Cookie 할 때 만들었던 그 이름
				if(cookies[i].getName().equals("luvGH")){ // new Cookie 할 때 만들었던 그 이름
					//name이라는 내가 만든 그 쿠키가 존재하면~
					out.println("쿠키이름: " +cookies[i].getName()+"<br>" );
					out.println("쿠키값: " +cookies[i].getValue()+"<br>" );
				}
			}//for
		}
	   
	%>
	   <input type="button" value="쿠키 생성" onclick="location.href='cookieSet.jsp';">
	   <input type="button" value="쿠키 삭제" onclick="location.href='cookieDel.jsp';">
</body>
</html>