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
	
	<h2>๐๊ธฐ์กด ๋ฐฉ์..... </h2>
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
	
	<h2>๐JavaBean ๊ฐ์ฒด๋ฅผ ์ฌ์ฉํ์ฌ ์ฒ๋ฆฌ</h2>
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
	
	<h2>โจ์ก์ ํ๊ทธ๋ฅผ ํ์ฉํด์ ์๋ฐ๋น ๊ฐ์ฒด ์ฌ์ฉ๐ฑโ๐</h2>
	<h3>jsp :useBean~~</h3>
	<!-- ์๋ฐ๋น ๊ฐ์ฒด ์์ฑ -->
	<jsp:useBean id="jb2" class="com.review.test.JavaBean1"/>
	
	<!-- ์ ๋ฌ๋ ํ๋ผ๋ฏธํฐ ์ธ๊ทธ๋ฆฌ ์ ์ฅ (setProperty)
		= ์ ๋ฌ๋ ๋ชจ๋  ํ๋ผ๋ฏธํฐ ๊ฐ์ 
		    -> property(์๋ฐ๋น ๊ฐ์ฒด์ ์์=๋ณ์๋ค!! id, name, addr)์ ์น ์ ์ฅ  -->
	<jsp:setProperty property="*" name="jb2" /> 
	<%-- 
	<jsp:setProperty property="*" name="jb2" param="*"/>   property=param ์ด๋ฆ ๊ฐ์ผ๋ฉด ์๋ต ๊ฐ๋ฅ  --%>
	
	<!-- getProperty๋ก ์ถ๋ ฅ~~ get์์  * ์ ๋จ -->
	id: <jsp:getProperty property="id" name="jb2"/> <br>
	name: <jsp:getProperty property="name" name="jb2"/> <br>
	addr: <jsp:getProperty property="addr" name="jb2"/> <br>
	
	
</body>
</html>