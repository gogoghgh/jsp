<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/paramPro.jsp</title>
</head>
<body>
	<h1>jsp3/paramPro.jsp</h1>
	
	
	<%
		// 한글 처리 먼저^^
		request.setCharacterEncoding("UTF-8");
		//전달받은 id 저장쓰
		String id = request.getParameter("id");
		out.print("id(out.print()): " + id + "<br>");
		
		String[] foods = request.getParameterValues("foods"); // name이 똑같이 foods니까 배열로 담아오기~~
		// 근데 이거 문제점,, 값 안 넘기면 ,,, null이 돼서 에러남,,,
// 		String foods2 = request.getParameter("foods");
	%>
	
	id(표현식 사용): <%=id %> <br>
	id(EL 표현식 사용): ${id} <br> 
		<!-- ㄴ엥 안 나오네요,,?? 그럼 그럼,, id라는 변수를 가져올 수는 없거덩,, 
			jsp 변수는 EL표현식으로 출력 X
			그럼 어덖하쥐~~??
						ㄱ param이라는 객체에 있는 id를 가져와~~~ -->
	id(EL 표현식 사용): ${param.id} <br>
	
	<hr>
	
	내가 좋아하는 음식1: <%=foods[0] %><br>
	내가 좋아하는 음식2: <%=foods[1] %><br>
	
	내가 좋아하는 음식쓰: ${paramValues.foods} <br>
						<!-- [Ljava.lang.String;@4f241199 출력됨,,
							 [(<<배열) 클래스~~~ @ 주소값  
							 ==> String 타입의 객체입니다^^ 객체 주민번호 같은 거 -->
	내가 좋아하는 음식1: ${paramValues.foods[0]} <br>
	내가 좋아하는 음식2: ${paramValues.foods[1]} <br> 
						<!-- 와 짱 편하네!~~~~~~  
						     ㄱ 없는 걸 불렀을 때는? 에러도 안 나네~~~ null인데~~!!!
						     	jsp 코드로 했을 때는 500 에러 나는데~~~ 짱이다~~ -->
	내가 좋아하는 음식3: ${paramValues.foods[2]} <br>  
	EL 표현식은 null값을 공백으로 출력함!!! 개이득 
	<hr>
	나의 취미: ${paramValues.hobby} <br>
	나의 취미1: ${paramValues.hobby[0]} <br>
	나의 취미2: ${paramValues.hobby[1]} <br>
	나의 취미3: ${paramValues.hobby[2]} <br>
	EL 표현식 단점: 반복문 불가,,
	
	<%
		String[] hobbys = request.getParameterValues("hobby");
	
		if(hobbys != null){
			for(int i=0; i<hobbys.length; i++){
				%>
				취미(用표현식): <%=hobbys[i] %> <br>
				<%
			}
		}
	%>
	
</body>
</html>