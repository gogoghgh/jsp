<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/jsp3/paramPro.jsp</title>
</head>
<body>
	<h1>review/jsp3/paramPro.jsp</h1>
	
	<h4>id</h4>
	<%
		// 한글 처리 먼저
		request.setCharacterEncoding("UTF-8");
	
		// 전달받은 애들 저장 & 화면에 출력
		String id = request.getParameter("id");
		out.print("(out.print() 사용): " + id + "<br>");
		String[] foods = request.getParameterValues("foods");
		String[] hobby = request.getParameterValues("hobby");
	%>
	
	(jsp 표현식 사용): <%=id %> <br>
	(EL 표현식 사용): ${param.id }<br> 
		<!-- jsp 변수 못 쓰니까,, param이라는 내장객체에 있는 -> id를 가져와라~ -->
	
	<hr>
	
	<h4>🥗내가 좋아하는 음식🍰 (jsp 표현식 사용)</h4>
	음식1: <%=foods[0] %> <br>
	음식2: <%=foods[1] %> <br>
	<%-- 음식3: <%=foods[2] %> <br> --%>
		<!-- 배열 범위 아니죠,, 500 에러남^^,, 
		     java.lang.ArrayIndexOutOfBoundsException: 2 -->
	음식쓰: <%=foods %> <br>
	
	<h4>🍱내가 좋아하는 음식🍜 (EL 표현식 사용)</h4>
	음식1: ${paramValues.foods[0] } <br>
	음식2: ${paramValues.foods[1] } <br>
	음식3: ${paramValues.foods[2] } <br>
		<!-- EL은 null값 공백으로 출력하니까 쌉가능^^ 에러 안 남 --> 
	음식쓰: ${paramValues.foods } <br>
		<!-- [Ljava.lang.String;@49689a05 << 새로고침 할 때마다 바뀌넴
		     [ (배열 표시) -> 클래스 -> @ 주소값~~ -->
	
	<hr>
	
	<h4>마이 하비🤿 (jsp 표현식 사용)</h4>
	취미1: <%=hobby[0] %> <br>
	취미2: <%=hobby[1] %> <br>
	취미3: <%=hobby[2] %> <br>
	취미즈: <%=hobby %> <br>
	
	<h4>마이 하비🤿 (jsp 표현식 + 반복문 사용)</h4>
	<%
		if(hobby != null){ // 취미 입력 했을 때만~ 반복
			for(int i = 0; i <hobby.length; i++) { %>
				취미<%=i+1 %>: <%=hobby[i] %> <br>
			<% }
		}
	%>
	
	<h4>마이 하비🤿 (EL 표현식 사용)</h4>
	<!-- EL은 반복문 불가 -->
	취미1: ${paramValues.hobby[0] } <br>
	취미2: ${paramValues.hobby[1] } <br>
	취미3: ${paramValues.hobby[2] } <br>
	취미즈: ${paramValues.hooby } <br> <!-- 얘는 왜 안나옴? -->
	
</body>
</html>