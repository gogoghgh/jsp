<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionTest.jsp</title>
</head>
<body>
	<h1> sessionTest.jsp   270p   <br>클라이언트 개념 페이지</h1>
	jsp내장객체, 영역객체, 단독으로도 활용되는,, 활용도 높은 세션 ^^ <br>
	<!-- 
	http 프로토콜로 통신하면,, 요청 -> 응답 -> ㅃㅇ~ 관계 소멸됨
	네이버 보여줘~ ㅇㅋ~ ㅃㅇ~~ 연결 끊음
	연결 안 끊고 쭉 연결해놓고 있으면? 관리할 게 많으니까 느려짐
	울 반이 다,, 전국민이 다,, 네이버랑 연결 중이면? 힘들어요~ 😰
	컴터뿐 아니라,, 스마트폰, 티비, 냉장고,,, 덜덜 넘 힘듦
	지 역할 잘 하기 위해 연결 한번 하면 끊어놓는ㄴ다~
	근데 내가 이전 사람이 가지고 왔떤 정보를 필요로 하는 경우는?
	이런 경우를 위해 세션과 쿠키가 있는데요,,,
	
	세션
	서버에서 ㅅ ~~ 유지하고 있는 정보
	어떻게 유지? 用세션ID  -> 클라이언트의 쿠키 영역에 sessionID 저장됨 ⭐⭐
	
	
	쿠키
	ㅋ클라이언트가 관리하는 정보.. 내 컴터에 있는 정보
	클라이언트의 쿠키 영역에 sessionID 저장됨 ⭐⭐
	
	--> 
	<h3>세션.. 니가 뭔데 </h3>
	* HTTP 통신의 특성상 상태유지가 불가능하기 때문에,
	상태를 유지하기 위해서 사용하는 개념 <br>
	* 서버측에서 관리하는 데이터 <br>
	* 브라우저 하나당 세션 하나 생성 <br>
        <!-- 1     :     1 --> 
		<!-- 크롬 100개 띄워도 세션 하나 생김.. 시크릿창은 다른 브라우저로 인식 ㅎ -->
	* 세션 생성: session.setAttribute("키", 값);  // 세션 객체 생성,, =세션 영역에 데이터 들어가 있음,,, 그 브라우저 켜져있는 동안 계속 유지됨 <br>
	* 세션 사용: session.getAttribute("키");      // 넣어 놓은 데이터 꺼내오기<br>
	* 세션 삭제: session.removeAttribute("키");   // 특정! 세션 지우기!! 여러 개 중 키 값 그 하나만~<br>
	* 세션 초기화: session.invalidate();            // 세션 초기화.. 싸그리 지움<br>
	
	<hr>
	
	<input type="button" value="세션값 생성 버턴" onclick=location.href='sessionSet.jsp';> <br> 
	<!-- 버튼 누르면 js가 실행되는데,, jsp 어떻게 열어요ㅠ event onclick 써서염 -->
	<input type="button" value="세션값 삭제 버턴" onclick=location.href='sessionDel.jsp';> <br>
	<input type="button" value="세션값 초기화 버턴" onclick=location.href='sessionInv.jsp';> <br>
	
	
	<hr>
	<!-- 세션= jsp 영역 객체,, 서버에서 저장해놓은 걸-> 클라이언트한테 보냈음  -->
	<%
		// 서버가 보내준 세션정보 가져오기
		/* String name = session.getAttribute("name"); */
						// Type mismatch: cannot convert from Object to String
						// ---> so 다운캐스팅 해주자고요^^
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		
		if(name == null){
			name="세션값 없음😅";
		}
		if(id == null){
			id ="세션값 없음😅";
		}
	
	%>
	
	<h3>세션값(name): <%=name %> </h3>
	<h3>세션값(id): <%=id %> </h3>

<%-- 	<%  --%>
// 		if (session == null){
// 			out.println("세션값 초기화 완료..");
// 		}
<%-- 	%> --%>

	원래는 생성, 삭제, 초기화 이 세 페이지를 한방에 해야 하는 것~~ <br>
	<h2>만들어보기^^</h2>
	
</body>
</html>