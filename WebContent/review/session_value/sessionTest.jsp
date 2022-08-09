<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionTest</title>
</head>
<body>
	<h1>sessionTest.jsp</h1>
	<h1>클라이언트 개념 페이지다</h1>
	
	<!-- 버튼 만들고 -->
<!-- 	<input type="button" value="세션값 생성" onclick=location.href='sessionSet.jsp';> <br> -->
<!-- 	<input type="button" value="세션값 삭제" onclick=location.href='sessionDel.jsp';> <br> -->
<!-- 	<input type="button" value="세션값 초기화" onclick=location.href='sessionInv.jsp';> <br> -->

	<form action="sessionAll.jsp" method="get">
		<select>
			<option name="set">세션값 생성 </option>
			<option name="del">세션값 삭제 </option>
			<option name="inv">세션값 초기화 </option>
		</select>
<!-- 		<input type="button" name="set" value="세션값 생성" onclick=location.href='sessionAll.jsp'><br> -->
<!-- 		<input type="button" name="del" value="세션값 삭제" onclick=location.href='sessionAll.jsp'><br> -->
<!-- 		<input type="button" name="inv" value="세션값 초기화" onclick=location.href='sessionAll.jsp'> -->
		<input type="submit" value="전송">
	</form>
<!-- 
	<input type="button" name="" value="세션값 생성" onclick=location.href='sessionAll.jsp';> <br>
	<input type="button" value="세션값 삭제" onclick=location.href='sessionAll.jsp';> <br>
	<input type="button" value="세션값 초기화" onclick=location.href='sessionAll.jsp';> <br>
 -->	
 	
 	<hr>
	
	<% 
		// sessionSet 가서 세션값 저장 먼저!
		// 서버가 보내준 세션 정보 가져오기 (sessionSet -> sessionTest)
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		// null이라고 안 뜨도록,, ㅎ 보기 안 좋잖아욘
		if(id == null){
			id="세션값 없음😥";
		}

		if(name == null){
			name="세션값 없음😥";
		}
	
	%>
	
	<h3>세션값(id): <%=id %> </h3>
	<h3>세션값(name): <%=name %></h3>

</body>
</html>