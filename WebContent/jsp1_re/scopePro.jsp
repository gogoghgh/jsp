<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/scopePro.jsp</title>
</head>
<body>
	<h1>scopePro.jsp</h1>
	<h2>파라미터 정보</h2>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	%>
	
	아이디: <%=id %> <br>
	이름: <%=name %>
	<hr>
	
	페이지 영역에 있는,, name: <%= pageContext.getAttribute("name") %>
	<br>
	
	<%
		pageContext.setAttribute("pageValue", "🐶pageContextValue입니당🐶 ");
		request.setAttribute("requestValue", "💝request Value 입니다💝 ");
		session.setAttribute("sessionValue", "🤭session Value 입니다🤭 ");
		application.setAttribute("appValue", "🎅application value임🎅");
	%>
	
	page영역: <%=pageContext.getAttribute("pageValue") %> <br>
	request:  <%=request.getAttribute("requestValue") %> <br>
	session:  <%=session.getAttribute("sessionValue") %> <br>
	application: <%=application.getAttribute("appValue") %> <br>
	id: <%=session.getAttribute("id") %>  null값,,,?! 왜? 
	<hr>
	<h2>페이지 이동</h2>
	<h3>1. a태그</h3>
		<a href="scopeAction.jsp?id=<%=id%>&pw=1234"> scopeAction.jsp 페이지로 이동합니데이</a>
		<hr>
	<h3>2. JS </h3>
		<script type="text/javascript">
// 			alert('js: scopeAction.jsp 로 페이지 이동할거임');
<%-- 		location.href="scopeAction.jsp?id=<%=id%>&pw=1234"; --%>
		</script>
		<hr>
	<h3>3. JSP 코드 사용한 페이지 이동</h3>
		<%
// 			response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
		%>
	<hr>
	<h3>4. 액션태그</h3>
		<jsp:forward page="scopeAction.jsp"/> <!-- 와 에바다,, jsp: forward 여기 띄어쓰기 했다고 안되네,,^^ -->
	
	
</body>
</html>