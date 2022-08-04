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
	
		* 영역 객체에 정보 출력 <br>
	page영역의 공유데이터(Attribute) :  <%= pageContext.getAttribute("pValue") %> 사라짐~~ 당연,, 페이지 넘어간거니까<br><br>
	request영역의 공유데이터(Attribute) :  <%= request.getAttribute("rValue") %> 사라짐~~ 페이지 갈 때 리퀘스트로 요청한다~고 했는데 왜 얘는 안 가나? request 로 전달할 수 있는 방법이 하나 뿐이라,,<br><br>
	session영역의 공유데이터(Attribute) :  <%= session.getAttribute("sValue") %> 그대루<br><br>
	application영역의 공유데이터(Attribute) :  <%= application.getAttribute("aValue") %> 그대루 <br><br>
	
	<% String id = request.getParameter("id"); %>
<%-- 	id: <%= session.getAttribute("id") %>   이러니까 자꾸 null 뜸,,,--%>
	id: <%=id %>
	<!-- 파라미터는 언제 쓰나? 주소에 ? 붙여 보내거나, 폼태그로 서브밋하면,,
	setAttribute 하면 getAttribute로,,, -->
	pw: <%=request.getParameter("pw") %>
	
</body>
</html>