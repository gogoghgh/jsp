<%@page import="com.itwillbs.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
	<h1>member/loginPro.jsp</h1>
	
	<%
		// 넘겨받은 데이터가 한글일 수 있으니 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 저장 (id, pw)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 근데~~ 여기서 자바빈 객체 써도 될까요?>???/????
		// 10자루 들어가는 필통(=객체,,)에,,, 2자루만 넣는 거,, 비효율적이지 않나요?
		// 아닙니다!!! 데이터 하나라도, 한 자루라도,,, 필통에 담 아 서 다 녀 야 합 니 다 !!!
		// 그래야 나중에 스프링 하고 그럴 때~~~ 좋다
		
	%>
		
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb"/>
		
	<%	
		System.out.println(mb);
	
		// 로그인 체크하는 로직
		// MemberDAO 객체 생성 -> loginMember() 메서드 쓰기 위해!!
		MemberDAO dao = new MemberDAO();
		
		// 로그인 체크 기능 - loginMember() 메서드 호출
		// dao.loginMember(mb); 얘 실행되면, 리턴값 3개 중 하나로 리턴됨~ 0, 1, -1
		int result = dao.loginMember(mb);
		
		if(result==0){
			// result=0? 비밀번호 오류
			%>
			<script type="text/javascript">
				alert("비밀번호 오류임");
				history.back(); // 뒤로 가기
			</script>
			<%
		} else if(result == -1){
			// result = -1? 아이디 오류
			%>
			<script type="text/javascript">
				alert("아이디 없삼");
				history.back(); // 뒤로 가기
			</script>
			<%
		} else {
			// result = 1 로그인 성공쓰 -> 아이디 정보 세션에 저장, 메인 페이지로 움직이기
			session.setAttribute("loginID", mb.getId());
			// response.sendRedirect("main.jsp");
			
			%>
			<script type="text/javascript">
				alert("로그인 성공");
				location.href = "main.jsp";
			</script>
			<%
		}
	%>
	
</body>
</html>