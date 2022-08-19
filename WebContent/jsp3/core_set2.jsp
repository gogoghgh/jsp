<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/core_set2.jsp</title>
</head>
<body>
	<h1>jsp3/core_set2.jsp</h1>
	<!-- core_set에서 저장한 정보 여기서 받아보기,, -->
	
	<%
		//set1에서 forward로 전달된 정보 저장
		String name = (String) request.getAttribute("name");
// 		int price = (Integer) request.getAttribute("price");  //오류나네요,,ㅋ 
		int price = Integer.parseInt((String)request.getAttribute("price")); // ㅇㅋ 
// 		String price = (String) request.getAttribute("price");  // ㅇㅋ
		String color = (String) request.getAttribute("color");
	%>
	
	이름: <%=name %> <br>
	price: <%=price %> <br>
	color: <%=color %> <br>
	
	<hr>
	
	<h3>EL 표현식으로,, 쌉편함</h3>
	<!-- 위에처럼 형변환 할 필요도 없이 걍 바로 불러주면 됨!!! -->
	
	<!--  EL 표현식 => 영역객체.변수명으로 호출 가능
				 (영역객체.)변수명
				 	ㄴ 생략 가능!! 
				 		=> 영역객체 생략 시, 모든 영역을 뒤져서 값을 가져옴
				 		1. page가서 뒤져서 있으면 가져오고 없으면 다음 단계 -> 2. request -> 3. session -> 4. application
				 	  															ex.	1 저장       2 저장
				 	  		걍 애초에 동일한 이름으로 영역 객체에 저장하지 맙시다~~!!!!ㄱ- 대략 난감
				 	  	정리----- 
				 	  	위 순서대로 영역을 돌면서 데이터 검색함. 
				 	  	동일한 이름의 속성이 존재하는 경우, 가장 먼저 만나는 데이터를 사용. 
				 	  	이후의 데이터는 접근 불가능함(접근하려면 영역을 명시하삼)
				 	  	
				 	  	JSP 영역객체와~~~~~ EL 영역객체가 연결되는 단계,,, 중요!!!!!!!!!! 
				 	  		
	--> 
	이름: ${requestScope.name } <br> <!-- requestScope 생략 가능  .............................. 1 가져옴 -->
	이름: ${sessionScope.name } <br> <!-- 안 뜨죠~~ session 영역에 name 있으면 가져와달라~ ..... 2 가져옴 -->
	이름: ${name } <br> <!-- 모든 영역 중에서 name 있으면 꺼내와~~ ..............................1 출력!! request 먼저 만났으니-->
	가격: ${price } <br>
	색상: ${color } <br>
	
	test: ${test } <br>
	test: ${requestScope.test } <br>
	test: ${sessionScope.test } <br>
	
	<hr>
	
	<!-- 지우기~~~ -->
	<%-- <c:remove var="test"/> --%>
	<c:remove var="test" scope="session"/>
	@@${sessionScope.test }@@ <br> <!-- 뒤져서 test라는 애 있으면 지움,, 긍까 영역까지 같이 적기  -->
	
	jsp코드와 java 파일 간에 데이터를 주고 받을 것이다,, 뭔 솔 ㅋㅋㅋㅋ,,,,,^^.............
</body>
</html>