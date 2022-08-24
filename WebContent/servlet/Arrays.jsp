<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet/Arrays.jsp</title>
<style type="text/css">
h1 {
	background-color: skyblue;
	color: white;
	display: inline;
}
</style>
</head>
<body>
	<h1>servlet/Arrays.jsp</h1>
	
	<%
		int number = (int)request.getAttribute("number");
	%>
	
	<h3>request 영역의 number(=속성) 출력</h3>
	(JSP) number: <b> <%=number %> </b><br>
	(EL) number: <b>${number } </b><br>
	
	<hr>
	
	<h3>request 영역의 배열 menu 출력</h3>
	(EL) menu: <b>${menu } </b><br>
	
<%-- 	
	<c:forEach var="i" begin="1" end="menu.length" step="1">
		(EL) menu: <b>${menu[i] } </b><br>
	</c:forEach>  얜 안 됨~~~~~~~   --%>
	
	<h4>forEach</h4>
	c:forEach var="str" items= "EL menu" <br>
	<c:forEach var="str" items="${menu }">
<!--	     	ㄴ2. 받을 거       ㄴ1. 반복할 거
			
		 ㄱ 3. 출력 
-->
		<b> ${str } 😘 </b>
	</c:forEach>
	
	<br><br>
	
	<h4>(JSP) for, for-each</h4>
	<%
		String[] menuArr = (String[])request.getAttribute("menu");
			// String이 아니라 String배열 타입이니까 String[]로 형변환
	
		if(menuArr !=null){
			for(int i=0; i<menuArr.length; i++){
				out.print("<b> menuArr[" + i + "]: " + menuArr[i] +"</b><br>");
			}
			
			// for-each
			for(String s:menuArr){
				out.print(s +"<br>");
			}
			
		}// if
	%>
	
	<hr>
	
	<h3>request 영역의 배열 movies 출력</h3>
	(EL) menu: <b>${menu } </b><br>
	(EL) movies: <b>${movies } </b> (ArrayList는 기본적으로 toString이 내장되어 있어서,, ^^ 따봉)<br><br>
	
	c:forEach var="str" items= "EL movies" <br>
	<c:forEach var="str" items="${movies }">
						<!-- EL로 적기!!! 뭐 불러오는 건 다 EL이랬나-->
		<b>${str} 🚀</b>
	</c:forEach>
	
</body>
</html>