<%@page import="com.review.test.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/javabean/beanPro1.jsp</title>
</head>
<body>
	<h1>review/javabean/beanPro1.jsp</h1>
	
	<h2>😒기존 방식..... </h2>
	<h3>request.getParameter~~~</h3>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	%>
	id: <%=id %> <br>
	name: <%=name %> <br>
	addr: <%=addr %> <br>
	<hr>
	
	<h2>😊JavaBean 객체를 사용하여 처리</h2>
	<h3>set() -> get()</h3>
	<%
		JavaBean1 jb1 = new JavaBean1();
		jb1.setId(request.getParameter("id"));
		jb1.setName(request.getParameter("name"));
		jb1.setAddr(request.getParameter("addr"));
	%>
	id: <%=jb1.getId() %> <br>
	name: <%=jb1.getName() %> <br>
	addr: <%=jb1.getAddr() %> <br>
	<hr>
	
	<h2>✨액션 태그를 활용해서 자바빈 객체 사용🐱‍🏍</h2>
	<h3>jsp :useBean~~</h3>
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="jb2" class="com.review.test.JavaBean1"/>
	
	<!-- 전달된 파라미터 싸그리 저장 (setProperty)
		= 전달된 모든 파라미터 값을 
		    -> property(자바빈 객체의 요소=변수들!! id, name, addr)에 싹 저장  -->
	<jsp:setProperty property="*" name="jb2" /> 
	<%-- 
	<jsp:setProperty property="*" name="jb2" param="*"/>   property=param 이름 같으면 생략 가능  --%>
	
	<!-- getProperty로 출력~~ get에선 * 안 됨 -->
	id: <jsp:getProperty property="id" name="jb2"/> <br>
	name: <jsp:getProperty property="name" name="jb2"/> <br>
	addr: <jsp:getProperty property="addr" name="jb2"/> <br>
	
	
</body>
</html>