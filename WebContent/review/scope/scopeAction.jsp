<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/scopeAction.jsp</title>
</head>
<body>
	<h1>scopeAction.jsp</h1>

	page영역: <%=pageContext.getAttribute("pageValue") %> <br>
	request영역: <%=request.getAttribute("requestValue") %> <br>
	session영역: <%=session.getAttribute("sessionValue") %> <br>
	application영역: <%=application.getAttribute("appValue") %> <br>
	<hr>
	
	<%
	// 파라미터로부터,, 가져오는거!! 가져와서 id 변수에 저장
	String id = request.getParameter("id"); %>
	
	id: <%=id %> <br>
	name: <%=request.getParameter("name") %> <br>
	
	
</body>
</html>