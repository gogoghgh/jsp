<%@page import="com.review.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/insertPro3.jsp</title>
</head>
<body>
	<h1>review/member/insertPro3.jsp</h1>
	<h2>DB 정보 다 빼기!! DAO 만들었으니 써먹어보자고욘</h2>
	<%
		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
	%>
	
		<!-- 액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="mb" class="com.review.member.MemberBean"/>
		
		<!-- 자바빈 이용해서 set + regdate 따로 처리 -->
		<jsp:setProperty property="*" name="mb"/>
		
	<%
		// regdate=null << 얘 따로 처리하기,, 
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		// 잘 넘어왔나 toString으로 확인
		System.out.println(mb);
		out.println(mb+"<hr>");

		// 회원 가입!! = DB 관련 동작
		// = MemberDAO.insertMember 메서드 호출!!!!
		// 하려면 new 객체 생성 먼저 해주고
		MemberDAO dao = new MemberDAO();
		dao.insertMember(mb);
		System.out.println("(from insertPro3.jsp) 회원가입 완료");
		
		// 회원가입 완료 -> 로그인 페이지로
// 		response.sendRedirect("loginForm.jsp");
	%>

		<script type="text/javascript">
			alert("가입해주셔서 감사륑 💖😘💋✨")
			location.href = "loginForm.jsp";
		</script>
	
</body>
</html>