<%@page import="com.itwillbs.servlet.MyServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet/testServlet.jsp</title>
</head>
<body>
	<h1>servlet/testServlet.jsp</h1>
	
	<h3>파라메타로 cnt 출력</h3>
	<%=  /* 		MyServlet ms = new MyServlet();
		out.println(ms); */ 
		request.getParameter("cnt")	%> <br>
	
	<h3>영역 객체 써서 cnt 꺼내오기</h3>
	(jsp)속성: <%=request.getAttribute("cnt") %> <br>
	(el)속성: ${cnt } <br>
	(el)속성: ${requestScope.cnt } <br>

</body>
</html>