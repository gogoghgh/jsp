<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 얘를 써줘야 쓸 수 있음~~~ JSTL 문법을 사용하기 위해서!!!! 얘 추가 안 돼있으면 못 씀 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/core_set.jsp</title>
</head>
<body>
	<h1>jsp3/core_set.jsp</h1>
	<!-- 출력문 -->
	<c:out value="(from c:)안녕하세요"></c:out> <br>
	<c:out value="(from c:)안녕하세요"/> <br>
	<!--   c: ==> Core의 기능을 쓸 수 있게 만들어놓은 액션 태그!!! -->
	
	(from html)안녕ㅎ세요 <br>
	
	<hr>
	
	<%
		int num1 = 10;
		int num2 = 20;
	%>
	
	합(jsp표현식 사용): <%=num1 + num2 %> <br>
	합(EL표현식 사용): ${ document.num1 + document.num2 } 안 되죠~~~? <br>
	합(JSTL 사용): <c:out value="num1+num2"/> <br>
	num1+num2 합(JSTL 사용): <c:out value="<%=num1+num2%>"/> <br>
	num1+num2 합(JSTL 사용): <c:out value="${num1+num2 }"/> <br> <!-- jsp에서 선언한 변수는 el표현식에선 못 불러오니까 -->
	100+200 합(JSTL 사용): <c:out value="${100+200 }"/> <br> <!-- 이건 쌉가 -->
	
	<hr>
	
	<c:out value="${itwill.name }"/> <br>
				<!-- itwill 객체 안의 name을 사용하겠다~ 근데 아직 itwill 없으니까 null임 -->
	@@<c:out value="${itwill.name }"/>@@ 여기 안에 넣어봐도 null==공백이니까 암것도 안 보임~ <br>
	@@<c:out value="${itwill.name }" default="🕺null값 대신 default 설정함😅" />@@ <br>
	
	<hr>
	
	<abc>< abc >태그는 abc입니다.. </abc> <br>
	&lt;abc>태그는 abc입니다.. &lt;/abc> <br>
<!-- ㄴ 얘가 부등호 기호임!! -->
	<c:out value="<abc>태그는 abc입니다 </abc>"></c:out>    <!-- JSTL 안에 넣어서도 쌉가 -->
	
	<hr> <hr>
	
	
	<h2>JSTL - 변수</h2>
	<%
		// 자바 코드로 만든 변수: 다른 페이지에서 사용 불가능
		int a = 100;
		int b = 200;
		int sum = a+b;
	%>
	
	a+b = <%=sum %> <br>
	<hr>
	
	변수 만드는 태그 set <br>
<!-- 	변수 선언 = 속성 선언
	    ===  JSTL 변수는 EL 표현식으로만 사용 가능하다,, == 영역 객체에 정보를 저장 -->
	<%-- <c:set var="변수 이름 지정"  value="변수값" /> --%>
	<%
		// 영역에 변수, 값 저장
		pageContext.setAttribute("c", 1000); // 페이지 영역에서는 c라는 이름의 변수에 1000을 넣어서 공유해서 쓰겠다
		// ==  <c:set var="c" value="1000" />  랑 같다,, scope 생략 시, 페이지영역임
		session.setAttribute("test", "itwill(from.session)");
		request.setAttribute("test", "itwill(from.request)");
	%>
	
	<c:set var="c" value="1000" />
	<c:set var="d" value="2000" />
	<c:set var="sum2" value="c+d" />
	<!-- JSTL에서 만든 변수는 JSP에서 못 씀,, 그래 그래야 공평하지,,-->
	 <%-- <%=sum2 %> jsp 표현식 사용 불가능!! --%>
	 c+d: ${sum2 } <!-- EL 표현식은 사용가능~ 근데 걍 문자열처럼 나오네ㅠ --> <br>
	 <c:set var="sum3" value="${ c+d }"/>
	 c+d: ${sum3 }
	
	<hr>
	
	<c:set var="name" value="phone📱" scope="request" /> <!-- 아무것도 지정 안 했을 때는 페이지 영역이었음,, 지금은 request영역 -->
	 <!-- price:10000   	color:black -->
	<c:set var="price" value="10000" scope="request" />
	<c:set var="color" value="black" scope="request" />

	name: ${name }<br>
	price: ${price }<br>
	color: ${color }<br>
	
	<!-- 페이지 이동 + request 영역 값 같이 가지고 가기
			=== scope할 때 했었던,, forward,,,,, forward 특징: 주소는 안 바뀜,, 화면은 바뀜 -->
<%--  	<jsp:forward page="core_set2.jsp"/> --%>
	
	<!-- 복습시,,, 페이지 이동 4가지 방법 있짢아요,,,,,,, 배웠던 그거,,, 그거대로 다 해보기 ㅋ  
		데이터 넘어오는지, 넘어갔을 때 처리 되는지-->
	
</body>
</html>