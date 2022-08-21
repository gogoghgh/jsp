<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/main.jsp</title>
</head>
<body>
	<h1>review/member/main.jsp</h1>
	
	<%
		String id = (String)session.getAttribute("loginID");
		if(id == null) {
			System.out.println("(from main.jsp) 로그인 정보 없음,, 로그인 안 한 놈,, 쫓아내자!!");
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	
	<h2> 💕<%=id %>💖님~~~ 환영합니다~~🎉✨✨😘   </h2>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp';">
	
	<h3> 회원 정보 조회 👀 </h3>
	<input type="button" value="나의 정보 조회하기 버턴" onclick="location.href='info.jsp';">
	
	<h3> 회원 정보 수정 🧹 </h3>
	<input type="button" value="나의 정보 수정하기" onclick="location.href='updateForm.jsp';">

	<h3> 회원 탈퇴,, 🥶😭 </h3>
	<input type="button" value="탈퇴하기" onclick="location.href='deleteForm.jsp';">
	
	<% 
		// id = admin일 때만 클릭 가능하게 
// 		if (id.equals("admin")) { 이렇게만 했을 때는 오류나지요~~ java.lang.NullPointerException 
									// 원인: 중간에 페이지 이동 있더라도,, jsp 코드 첨부터 끝까지 다 실행하고 나서 -> 페이지 이동 하거덩!!
									// 		그니까 id null인 애가 오더라도 바로 페이지이동 못 하고 여까지 내려와서 이 if문도 실행하니까
									// 		오류나벌임~~ null != admin이니까^^
									// 우선순위 정리: jsp(첨 -> 끝 -> 페이지 이동) -> html -> js
									// 
		if (id!=null && id.equals("admin")) {
	%>
			<h2><a href="memberList.jsp"> 전체 회원 목록 조회 🕵️‍♀️ (관리자 전용) </a></h2>
	<%
		}
	%>
	

</body>
</html>