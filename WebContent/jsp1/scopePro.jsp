<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/scopePro.jsp</title>
</head>
<body>
	<h2>파라미터 정보</h2>
	<%
	String id = request.getParameter("id");
	%>

	아이디: <%= id %>
	
	<h2>영역객체의 속성(Attribute)</h2>
	* 영역 객체에 속성을 저장 (=공유할 데이터를 저장) <br>
		[영역객체].setAttribute(키, 값); <br><br>

	* 영역객체의 속성을 사용 (=공유된 데이터의 값을 사용) <br>
		[영역객체].getAttribute(키);  키만 있으면 꺼내올 수 있잖아유 <br>
	<hr>
	<h3> EX. page 영역에 있는 객체(=pageContext) 써보기~~ </h3>
	name: <%= pageContext.getAttribute("name") %> ← name이란 키를 아직 안 썼잖아염,, 그래서 null <br> 
	pageContext 객체 안에 있는 name 키 값의 데이터를 가져와라 <br>
	
	<br>
	 	
	* 영역 객체에 정보 저장하기 (set) <br>
	<%
		pageContext.setAttribute("pValue", "🐶pageContextValue입니당🐶 ");
		request.setAttribute("rValue", "💝request Value 입니다💝");
		session.setAttribute("sValue", "🤭session Value 입니다🤭 ");
		application.setAttribute("aValue","🎅application value임🎅");
// 		application.setAttribute("aValue",109);
		/* 페이지 영역에~~~~ 저장할거다~ 키값으로   이 값을 저장!! */
	%>
	* 영역 객체에 정보 출력 <br>
	page영역의 공유데이터(Attribute) :  <%= pageContext.getAttribute("pValue") %> <br>
	request영역의 공유데이터(Attribute) :  <%= request.getAttribute("rValue") %><br>
	session영역의 공유데이터(Attribute) :  <%= session.getAttribute("sValue") %><br>
	application영역의 공유데이터(Attribute) :  <%= application.getAttribute("aValue") %><br>
	글자 길이도 길어지네~~~ <br>
	id: <%= session.getAttribute("id") %>
	
	<hr>
	영역객체 목적: 데이터 저장해서 공유하는 것 <br>
	그 영역에 저장해놓으면 그 영역 동안은 데이터 쓸 수 있더라~<br>
	그 영역 벗어나면 못 쓰는거고,,<br>
	
	<h2>⭐⭐⭐ 페이지 이동 ⭐⭐⭐</h2>
	⭐⭐⭐⭐프젝 때 많이 쓸 예정 ⭐⭐⭐⭐ <br>
	<h3>1. a태그</h3>
		: 파라미터, session, application 영역에 있는 데이터를 쓸 수 있다.. page X, request X <br>
		<!-- <a href="scopeAction.jsp"> scopeAction.jsp 페이지로 이동~ 클릭해주세요 </a> --> <br>
		<a href="scopeAction.jsp?id=<%=id%>&pw=1234"> scopeAction.jsp 페이지로 이동~ 클릭해주세요 </a> <br>
		form -> submit으로 보낼 때 받아 놓은,, id=~~~ 쓰면 안되겠니~~<br>
		표현식 < % =    % >  안에 써주세요,,,^^ ㅁㅊ <br>
		<b>ㄴ얘 쓸 때는 공백도 주의해주세요,,,,,,,,,😰 왜냐면 공백=%20..... 쨌든 뭐 값이 있다고 함.. <br>
		공백 써야 할 때만! 쓰는 습관 </b><br>
	<hr>
	<h3>2. JavaScript: </h3>
	파라미터, session, application 영역에서 쓸 수 O  <br>
	<script type="text/javascript">
		// alert('js: scopeAction.jsp 페이지 이동할거임');
<%-- 		location.href="scopeAction.jsp?id=<%=id%>&pw=1234"; --%>
		// page X, request X, session O, application O
	</script>
	<hr>
	<h3>3. JSP 코드 사용한 페이지 이동 : 파라미터, session, application 영역 데이터 공유할 수 있다</h3>
	= sendRedirect() <br>JSP니까 스크립틀릿 안에 작성<br>
	<%  
// 		response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");  
	%>
	 = 주소줄에 적혀 있는 페이지로 이동합니다 <br>
	<!-- 위에 js에서 만들었던 alert도 안뜨네? -->
	<!--  jsp 페이지 실행 순서: 
	 		java로 작성된 jsp 코드 젤 먼저 실행 -> html코드 실행 -> js 코드 실행 -->
	<!-- * jsp 페이지 실행 순서: java(jsp) -> html -> javaScript -->
	<hr>
	<h3>4. 액션태그(jsp태그에서만 쓸 수 있음,, html태그에선 못 씀) 
	- forward 써서 페이지 이동 </h3>
	: 파라미터, request, session, application영역의 데이터를 전달할 수 있다 <br>
	태그긴 한데,, 어떤 역할을 할 수 있음 뭐? 뭔데 ㅡㅡ <br>
	스크립틀릿 X  html 영역에 써야 함<br>
<%-- 	<jsp:forward page="scopeAction.jsp"/>   --%>
	<!-- 뒤에 / 적으면 닫는 태그 필요 없이 쓸 수 있음 <br> -->
	request 영역 드디어 보이네요~ request 볼 수 있는 방식 얘밖에 없음! forwarding ~~~ <br>
	forwarding 💝 request 영역 <br>
	http://localhost:8088/JSP6/jsp1/scopePro.jsp?id=kim ------ 주소가 왜 pro? action 페이지로 넘어갔는데,,
	forwarding 이동 방식의 특징때문,,
	 = url(=주소) 변경 없이 화면만 바뀜... mvc 에서 쓴다 함 <br>
	
	로그인 정보, 장바구니 정보 등등,,,, 오래 유지될 수 있게 세션 영역에 들어간다~ <br>
	
</body>
</html>