<%@page import="com.itwillbs.test.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>javabean/beanPro1.jsp</title>
</head>
<body>
	<h1>javabean/beanPro1.jsp</h1>
	
	<h2> 1️⃣기존 방식 </h2>
	<%
		String id = request.getParameter("id");
		System.out.println("id: " + id);
	%>
	
	하던대로 한,, id: <%=id%>
	
	<hr>
	<h2>2️⃣ ☕JavaBean🥜  객체를 사용하여 처리</h2>
	<%
		//객체 생성하고 -> 세터메서드 사용해서 데이터 받고
		JavaBean1 jb1 = new JavaBean1();
		jb1.setId(id); // 얘나
		jb1.setId(request.getParameter("id")); // 얘나 똑같다!
		// id 변수에 담아서 넣냐, 걍 바로 넣냐,, 이거지 똑같다
		jb1.setName(request.getParameter("name"));
		jb1.setAddr(request.getParameter("addr"));
	%>
	
	<!-- 정보 화면에 출력 -->
	자바빈으로 처리한 id &nbsp&nbsp ❔ : <%=jb1.getId() %> ❕ <br>
	자바빈으로 처리한 name❔: <%=jb1.getName() %> ❕<br>
	자바빈으로 처리한 addr ❔: <%=jb1.getAddr() %> ❕
	
	<hr>
	<h2>3️⃣액션 태그⚡를 활용해서 자바빈 객체 사용</h2>
	<!-- JavaBean1 jb1 = new JavaBean1(); -->
	<!-- (==) 같은 의미다!! id가 객체 이름 / class는 만들려는 객체가 어디에 있느냐~? 
		이렇게 하면 new ~~ 한 것과 같은 의미!!!-->
	<jsp:useBean id="jb2" class="com.itwillbs.test.JavaBean1"/>
	
	<!-- 
	jb1.setId(request.getParameter("id")); 얘랑 같다!!
	전달된 파라미터를 저장쓰	-->
<%-- 	<jsp:setProperty property="id" name="jb2" param="id"/> 
	<jsp:setProperty property="name" name="jb2" param="name"/> 
	<jsp:setProperty property="addr" name="jb2"/>  --%>
	<!-- 
	property: 해당 객체 요소 = 변수 / name = 객체 이름 / (param="id") 
							    id
			property랑  ----------    전달되는 파라미터(param) 이름이 같은 경우,
			param 속성 생략 가능!!!
							     --> 
	<!-- 진짜 좋은 점???!!! 싹 생략 가능 아스타 써서
	전달되는 모~~든 파라미터의 값을 해당 프로퍼티에 저장 가넝한 와우~~
	개수, 종류 상관 없음!!! 대박 이 한 줄이면 ,,, set메서드 10줄 짜리를 대체,, 와우 -->
	<jsp:setProperty property="*" name="jb2"/>
	
	
	<!-- get도 있겠죠~~~ -->
	id &nbsp&nbsp ❔ : <jsp:getProperty property="id" name="jb2"/> <br>
	name❔: <jsp:getProperty property="name" name="jb2"/> <br>
	addr ❔: <jsp:getProperty property="addr" name="jb2"/> <br>
	<hr>
	
	<h2> 객체 생성 </h2>
	
	
	
	
</body>
</html>