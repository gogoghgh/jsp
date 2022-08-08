<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionAll.jsp</title>
</head>
<body>
	<h1>sessionAll.jsp</h1>
	<h2>생성, 삭제, 초기화 여기서 한방에,, 해드릴게요,,,,, how?? </h2>
	
	되긴 되는데,, 있냐 없냐? 있으면 지우고 -> 없으면 만들고 -> 또 버튼 누르면 지우고 -> 버튼 누르면 만들고,, 이것만 됨,,,, <br>
	생성, 삭제, 초기화 버튼 만든 의미가 없음,,,,,, 생각해보자 <br>
	특정 버튼 누르면 -> 그 버튼 뭔지 인식해서 -> switch문 돌리면 될 것 같은디 <br>
	<br>
	
	<input type="button" value="클릭 시 test 페이지로 갑니더" 
				onclick=location.href='sessionTest.jsp';>

	<%
		/*  클라이언트가 생성 눌렀으면 -> 생성 로직 실행
						삭제 눌렀으면 -> 삭제 로직 실행
						초기화 눌렀으면 -> 초기화 로직 실행		*/
		
// 		switch(session.getAttribute(arg0))
		if(session.getAttribute("id") == null){
			// id 세션값이 null이면,, = 아직 세션값 생성 안 됐다면? set~
			
			// 세션 객체 생성
			session.setAttribute("id", "gogoghgh🐱‍🏍");
// 			session.setAttribute("name", "BUSAN🌊");
			System.out.println("세션값 생성 완");
		%>
		
			<script type="text/javascript">
				alert("요청 정보 처리 완");
				alert("세션값 생성 완");
//	 			location.href = "sessionTest.jsp";
			</script>
		<%
		} else if(session.getAttribute("id") != null) {
			// 세션값이 null이 아니면 = 세션값이 존재하면,, 지워!!1
			// 세션값 초기화
			session.invalidate();
			System.out.println("세션값 초기화 완");
		%>
		
		<script type="text/javascript">
			alert("세션값 초기화 완");
//	 		location.href = 'sessionTest.jsp';
		</script>
		<%
		}
	%>

	
<!-- 	---------------------------------- setAttribute ----------------------------------------- -->
<%-- 	<%
		// 세션 객체 생성
		session.setAttribute("id", "gogoghgh🐱‍🏍");
		session.setAttribute("name", "BUSAN🌊");
		System.out.println("세션값 생성 완");
	%>
	
<!-- 서버에 세션값 저장하고 -> 다시 클라이언트 페이지로 돌아가기 -->
		<script type="text/javascript">
			alert("요청 정보 처리 완");
			alert("세션값 생성 완");
// 			location.href = "sessionTest.jsp";
		</script>
		
	
<!-- 	---------------------------------- invalidate ----------------------------------------- -->
	<%
		// 세션값 초기화
		session.invalidate();
		System.out.println("세션값 초기화 완");
	%>
	
	<script type="text/javascript">
		alert("세션값 초기화 완");
// 		location.href = 'sessionTest.jsp';
	</script>

	
<!-- 	---------------------------------- invalidate ----------------------------------------- -->
	<%
		// 세션 객체 삭제
		session.removeAttribute("name");
		System.out.println("name 세션값 삭제 완");
	%>
	
	<script type="text/javascript">
	alert("요청 정보 처리 완");
	alert("name 세션값 삭제 완");
// 	location.href='sessionTest.jsp'; // 작은 따옴표도 되네 ㅎ
	</script> --%>

</body>
</html>