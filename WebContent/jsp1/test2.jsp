<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/test2.jsp</title>
</head>
<body>
	<h1>JSP 구성 </h1>
	
	<h3>1. JSP 지시어(Directive) 150p</h3>
	<%--   ⏩ <%@ %> ⏪  
	
			JSP 페이지가 실행할 때 필요한 설정을 작성하는 코오드,, 맨 윗줄!!
	
			[ page, include, taglib ]  
	
	
	--%>

	<h3>2. JSP 선언문(Declaration) 160p</h3>
	<%--
		
		⏩<%!  %>⏪ :  선언문 -> 멤버변수, 메서드를 선언하는 공간
	
	 --%>
	 
	 <%! 
	 	// java 코드 작성
	 	int a;  // 인스턴스변수?
	 
	 %>
	 
	 
	 <h3>3. 스크립틀릿(Scriptlet)</h3>
	<%--   ⏩ <%    %> ⏪ : JSP 코드 작성함(지역변수 형태임) --%>
	
	<%  int b;  /* 지역변수겠군 */ 
	/* 저장하고 컴파일해야 파일 생김 
	C:\Users\ITWILL\workspace_JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\JSP6\org\apache\jsp\jsp1 */
	
	%>
	
	
	<h3>4. 표현식(Expression)</h3>
	
	<%--	⏩ <%= %>⏪: 2선언문, 3스크립틀릿에 만들어놓은 
						변수, 메서드(리턴이 있는 애들)를 사용해서
						화면(html로 구성되어 있는//...)에 출력하는 코드 
						데이터를 좀 더 자유롭게 표현할 수 있겠군~~~ 개이득~
	--%>
	
	<%= 100000 /* 숫자만 되네; */  %>
	2000(html 영역,,)
	
	<h1> JSP 내장 객체 p177~208</h1>
	<!-- Jsp 페이지가 웹 컨테이너에 의해 서블릿으로 변환될 때, 고정된 이름의 객체로 웹 컨테이넌에 의해 자동적으로 구현되며
	사용자는 JSP 페이지에서 해당 객체의 클래스, 패키지 import와 객체의 선언 없이도 이들 객체를 자유롭게 쓸 수 있다  -->
	
	<!--  8+1 총 9개의 내장객체..  -->
		<!-- 왜 소문자죠,,? 실제 PageContext class인데,,
		PageContext pageContext = new PageContext();  -> jsp가 이걸 이미 해놨다!!
		그래서 우리는 걍  ㄴ 이걸 쓰면 되는 거 -->
	javax.servlet 패키지
	<h3>1. request: 클라이언트의 http 요청 정보를 저장하는 객체</h3>
		이 정보가 필요한데? request가 가지고 있음
		<hr>
	<h3>2. response:  http 요청에 대한 응답 정보를 저장하는 객체</h3>
		1, 2는 기본 중의 기본이죠~ 요청과 응답,, 
		웹툰 보여줘! 요청,, 네이버 본사로 가서 처리한 게 나한테
		reponse라는 객체 안에 담겨서 옴...
		<hr>
	<h3>3. session: 클라이언트의 세션정보를 저장하는 객체</h3>
		은행 어플에 세션이 만료되었습니다 다시 로그인해주세용 할 때 그 세션~~ 
		세션= 서버-클라이언트,, 저장 뭐시기
		<hr>
	<h3>4. pageContext: 페이지 실행에 필요한 컨텍스트(=내 프로젝트) 정보를 저장 객체</h3>
		<hr>
		
		 
	<h3>5. out: 응답 페이지 전송을 위한 출력 스트림 객체</h3>
		System.out.println 할 때 그 out...
		스트림? stream + ing 스트리밍할 때!! 유튜브 스트리밍,, 멜론 스트리밍,,,
			ㄴ버퍼링 buffer+ ing 버퍼: 메모리 공간,, ㅂㅓ퍼를 채우는 작업이 버퍼링 동영상 크니까 한번에 다 가져올 수 없어서 잘라서 가져오는데
			동영상 보다가 멈추고 버퍼 채우고 다시 보고 ,, 재생속도보다 가져오는 속도가 느려서 .... 
		스트림은 물 흘러가는~~ 아~~~ 데이터가 쭉 흘러가는거!! 박스로 담아가는 게 아니라,, 물처럼 흘러가는 데이터다~
		출력하는 데이터가 물처럼 계속 흘러갈 수 있게 ,,,,,,,,,, 
		<hr>
		
	<h3>6. application: 동일한 애플리케이션 컨텍스트 정보를 저장하는 객체</h3>
	jsp6 프로젝트 정보를 얘가 다 들고 있음
	나머지 애들도 들고 있긴 한데~ 얘가 제일 큰 개념임 나머지 애들 다 포함하고 있다고 보삼
		<hr>
	
	<h3>7. config: 서블릿 설정 정보(초기화 정보)</h3>
	jsp -> 자동으로 java로 바뀜 그 자바가 서블릿,, 
	jsp 만들 때 필요한 정보들이 config 안에 다 들어있다
		<hr>
	
	<h3>8. page: 해당 페이지 (서블릿 객체)</h3>
		<hr>
	
	java.lang 패키지 (자바 기본 패키지)
	<h3>9. exception: 예외처리 객체</h3>
	일반적이지 않은 상황들 처리할 수 있도록,, 왜 처리해야 하나요? 프로그램이 죽어서,, 뻗어서,,,
	프로그램 목적: 주 목적 달성하고 잘 끝나야 함 
	쇼핑몰! 중간에 서버가 뻗었다,, 하면 주문 재처리하거나 다시 연동돼서 이어져야 하는데~~~ 이런 예외들 대비한,,
		<hr>
	
	
	<hr>
	서버 도메인 명:  <%=request.getServerName() %> <br> 
	<!--   			ㄴ표현식 < % =  
						ㄴ만든 적 없지만 쓸 수 있다~ 제공해주는 거니까 
		= localhost
		= 127.0.0.1
		= 랜 카드 꼽는 그 주소,,? 
		= 192.168.6.200 << 쌤 페이지
		http://localhost:8088/JSP6/jsp1/test2.jsp
		
	-->
	서버 포트 번호: <%=request.getServerPort() %> <br>
	URL: <%=request.getRequestURL() %> <!-- http(=프로토콜), 도메인명, 포트번호 모두 포함하고 있는 --> <br>
	URI: <%=request.getRequestURI() %> <!-- http(=프로토콜), 도메인명, 포트번호 제외한 나머지 --> <br>
	<hr>
	
	<%
		// response.setHeader(arg0, arg1); 헤더에 정보 보낼 때 이렇게 보내야 된다..
		// response.addCookie(arg0);
		// response.setContentType(arg0); 맨 윗줄에 그거 
				// <%@ page language="java" contentType="text/html; charset=UTF-8"
	    		// pageEncoding="UTF-8"...
	    // response.sendRedirect(arg0);
		// response.sendRedirect(페이지 주소);
		// response.addHeader("Refresh", "3"); // 3초에 한번씩 새로고침해라~
// 		response.addHeader("Refresh", "5; url=https://www.naver.com"); // 5초 있다가 새로고침하면서 네이버로 가기
	%>
	세션 객체: <%=session.getId() %> <!-- f12 -> application -> cookies..웅앵에 있다 --><br>
	세션 생성 시간: <%=session.getCreationTime() %> <!-- 1000분의 1초 --><br>
	세션 최종 접속 시간: <%=session.getLastAccessedTime() %> <br>
	세션 유지시간: <%=session.getMaxInactiveInterval() %> <!-- 1800초 = 30분 
	은행은 왜 5분,,? 바꿀 수 있어서염--> <br>
	<% session.setMaxInactiveInterval(3600); %> <!-- 1시간 -->
	<!-- % 밑에 빨간줄은 무시하삼 ㅎ 코드 밑에 빨간줄만 신경쓰기 -->
	
	
	
	
</body>
</html>