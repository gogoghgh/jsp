<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/main.jsp</title>
</head>
<body>
	<h1>member/main.jsp</h1>
	
	<!-- 반드시 로그인 성공 시에만 방문 가능
		로그인 X 놈이 왔을 경우, 로그인 페이지로 이동시키기 -->
	
	<%
		// 세션 영역에 있는 로그인 아이디 정보를 가져오기
			// jsp 내장객체니까 바로 쓸 수 있음 알고 있쥐?
		String id = (String)session.getAttribute("loginID");
		
		if(id==null){ 
			// 세션에 저장된 아이디 정보가 없다 = 로그인 안 한 놈
			System.out.println("로그인 정보 없음 (from Main.jsp)");
			
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	
	<h2> 💘<%=id %>💘님~~~ <br> 환영합니다!!! 🤗😘   </h2>
	
	<input type="button" value="로그아웃" onclick=" location.href='logout.jsp'; ">	
	
	<hr>
	
	<h3>개인 정보 조회</h3>
	<input type="button" value="개인 정보 조회" onclick=" location.href='info.jsp'; ">	
	
	<h3><a href="updateForm.jsp"> 개인 정보 수정 </a></h3>
	
	<h3><a href="deleteForm.jsp"> 개인 정보 삭제 </a></h3>
	
	
	<% 
		// 관리자 id가 admin일 때만!! 이 링크 보이도록~~
// 	if(id != null){ // id가 nn 이면서 + admin일 때~~  << 이 조건 추가해서,, 오류 해결 ㅋ 하 먼솔 ,, ㅇㅋㅇㅋ 이해 완
					// if(id != null && id.equals("admin")).. 이렇게 합쳐도 똑같죠
// 		if (id.equals("admin")){				  // 구
		if (id != null && id.equals("admin")){	  // 신
			// 엥 근데 로그아웃 하니까 오류 뜨네,, java.lang.NullPointerException
			// 여기선 null값 가질 만한 게 id뿐인뎀?? logout 눌러서-> 세션 정보 invalidate 초기화했음,, 
					// -> null 이 돼서 -> main -> loginForm.jsp로 보내왔는데~~?? 얘는 왜 동작 안 하나?
			// jsp 코드는 jsp 처음부터~~ 끝까지~~~ 실행한 후에 -> html 코드 부름..
			// 중간에 페이지 이동이 걸려있더라도,, 무조건 jsp 다른 코드들 다 실행하고! 움직임 아하~~
			// 위에 로그인 유효 체크하고~ 밑에 보니까? jsp 코드 또 있네,, 실행해보자~~ 했는데 에러 나는거임
			// id=null이랑 ~~~ admin이랑~~ 같지 않으니까,,,,,
		%>
		<h3><a href="memberList.jsp"> 회원 정보 목록 (관리자(admin) 전용쓰)</a></h3>
		<% }
// 	 }
	%>
</body>
</html>