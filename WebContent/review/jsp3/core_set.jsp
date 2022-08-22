<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ 얘 꼭 추가~~ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/jsp3/core_set.jsp</title>
</head>
<body>
	<h1>review/jsp3/core_set.jsp</h1>
	
	<!-- c: ==> Core의 기능을 쓸 수 있게 만들어 놓은 액션태그!! -->
	<h3>출력문</h3>
	<c:out value="(from. c:out) 안녕하세요?"/> <br>
	(from. html) 안녕하세요? <br>
	
	<hr>
	
	<%
		int num1 = 10;
		int num2 = 20;
	%>
	
	<h3>num1 + num2</h3>
	<table border="1">
		<tr> 
			<td> jsp 표현식 </td>
			<td> <%=num1 + num2 %> </td>
			<td> 늘 하던 거^^ </td>
		</tr>
		<tr>
			<td> EL 표현식 </td>
			<td> ${num1+num2 } </td>
			<td> jsp 변수 EL에선 못 쓰니까 </td>
		</tr>
		<tr>
			<td> JSTL c:out value="num1 + num2"</td>
			<td> <c:out value="num1+num2" /></td>
			<td> 걍 문자열이넴</td>
		</tr>
		<tr>
			<td> JSTL c:out value="&lt;%= num1+num2 %></td>
			<td> <c:out value="<%=num1+num2 %>"/> </td>
			<td> html 태그에서도 원래 됐으니까,,,</td>
		</tr>
		<tr>
			<td> JSTL c:out value="EL num1+num2"</td>
			<td> <c:out value="${num1+num2 }" /></td>
			<td> jsp에서 선언한 변수는 EL에서 못 불러옴</td>
		</tr>
		<tr>
			<td> JSTL c:out value="EL 100+200"</td>
			<td> <c:out value="${100+200 }" /></td>
			<td> 변수 이용X 걍 숫자 연산임</td>
		</tr>
	</table>
	
	<hr>
	
	EL itwill.name: <c:out value="${itwill.name }"/> <br>
						<!-- itwill 객체 안의 name 사용하겠다~ 
						근데 아직 itwill 객체가 없어서 null=공백 -->
	EL itwill.name: 💖💖<c:out value="${itwill.name }"/>💖💖 <br> <!-- 빼박 공백 -->
	EL itwill.name: 💖💖<c:out value="${itwill.name }" default="만약 null이라면,, 제가 보일거여요(from. default)"/>💖💖 <br>
	
	<hr>
	
	<h3>태그 < 표현하는 방법</h3>
	<table border="1">
		<tr> 
			<td> 1. 한 칸 띄우기 </td>
			<td> <abc>< abc> 태그입니다^^ </abc> </td>
		</tr>
		<tr>
			<td> 2. &lt(부등호 기호 less than) </td>
			<td> &lt;abc 태그입니다^^ </td>
		</tr>
		<tr>
			<td> 3. JSTL value " " 안에 넣어서</td>
			<td> <c:out value="<abc> abc태그 </abc>" /></td>
		</tr>
	</table>
	
	<br><hr><hr><hr>
	
	<h2>JSTL 변수</h2>
	<%
		// 자바 코드로 만든 변수: 다른 페이지에서 사용 불가!! 그래서~
		int a = 100;
		int b = 200;
		int sum = a+b;
	%>
	
	(JSP 표현식) a + b = <%=sum %> <br>
	(EL 표현식) a + b = ${sum } <br>
	(JSTL c:out) a + b = <c:out value="sum"/> <br>

	<hr>
	
	<h3> JSTL 변수 만드는 태그 c:set!!!! </h3> 
	<!-- 
		변수 선언 == 속성 선언?? 
		== JSTL 변수는 EL 표현식으로만! 사용 가능 
		== 영역 객체에 변수-값을 저장한다~~ 
	-->
	<%
		// 영역에 변수-값 저장
		// pageContext.setAttribute("c", 1000); 
			// ==페이지 영역에서, c라는 이름의 변수에 1000을 넣어서 공유해서 쓰겠다
			// == <c:set var="c" value="1000" />... scope 속성 생략 시, 페이지 영역
		session.setAttribute("test", "👋hello(from.session, JSP)");
		request.setAttribute("test", "💘hello(from.request, JSP)");
	%>
	
	<!-- JSTL c:set으로 변수-값 저장 --> 
	<c:set var="c" value="1000"/>
	<c:set var="d" value="2000"/>
	<c:set var="sum2" value="c+d"/> <!-- JSTL 변수니까 즈그끼리 연산 삽가 -->
	
	<!-- JSTL에서 만든 변수는 JSP에서 사용 불가~ 그래야 공평하지~~ 각자 살아라~ -->
	<%--   <%=sum2 %>  XXX --%>
	
	<table border="1">
		<tr> 
			<td>c:set var="c" value="1000"</td>
			<td> EL c = </td>
			<td> ${c } </td>
		</tr>
		<tr> 
			<td>c:set var="d" value="2000"</td>
			<td> EL d = </td>
			<td> ${d } </td>
		</tr>
		<tr>
			<td>c:set var="sum2" value="c+d" </td>
			<td> EL sum2 = </td>
			<td> ${sum2 } → 왜 걍 문자열처럼 나오지,,? </td>
		</tr>
		<tr>
			<td>c:set var="sum3" value="EL c+d" </td>
				<c:set var="sum3" value="${c+d }" />
			<td> EL sum3 = </td>
			<td> ${sum3 } → value 속성 안에  <br> 
				민짜로 말고 EL식으로 작성해야 출력됨!!</td>
		</tr>
	</table>
	
	<hr>
	
	<h3>c:set에 scope 옵션 개념 추가</h3>
	<!--   scope 생략 시, default == page영역   --> 
	<c:set var="name" value="iPhone14📱" scope="request"/>
	<c:set var="price" value="10000" scope="request"/>
	<c:set var="color" value="silver" scope="request"/>
		
	name: ${name } <br>
	price: ${price } <br>
	color: ${color } <br> 
	
	
	<!-- 페이지 이동 + request 영역 값도 같이 가지고 가려면? --> 
	<h3> == forward !!!!! </h3>
	<jsp:forward page="core_set2.jsp"/>

</body>
</html>