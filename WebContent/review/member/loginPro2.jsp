<%@page import="com.review.member.MemberDAO"%>
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
<title>review/member/loginPro2.jsp</title>
</head>
<body>
	<h1>review/member/loginPro2.jsp</h1>
	<h2>DB 정보 다 빼기 ㅎ DAO 써서~~</h2>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
	%>
	
	<!-- 요소 몇 개 없더라도 필통에 담기!! -->
	<jsp:useBean id="mb" class="com.review.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		System.out.println("(from loginPro2.jsp)  id: "+ mb.getId());
		out.println("(from loginPro2.jsp)  id: "+ mb.getId());
		// 로그인에 필요한 정보 잘 들어왔나 확인 완^^
		
		// DAO 객체 생성 -> 로그인 메서드 loginMember() 쓰기!!!
		MemberDAO dao = new MemberDAO();
		int result = dao.loginMember(mb); // 1, 0, -1로 리턴되니까 result 객체에 담기
		
		if(result == 0){
			// 비번 틀림
			%>
			<script type="text/javascript">
				alert("아이디 혹은 비번이 잘못되었습니다ㅠ 웁스");
				history.back();
			</script>
			<%
			
		} else if(result == -1){
			// 아이디 틀림
			%>
			<script type="text/javascript">
				alert("아이디 혹은 비번이 잘못되었습니다ㅠ 웁스");
				history.back();
			</script>
			<%
		} else {
			// 로그인 성공!!
				
				// 로그인 정보 session 영역에 저장 + 공유
				// -> 메인 페이지로 이동쓰(jsp 말고 자스 써서)
				session.setAttribute("loginID", mb.getId());
// 				response.sendRedirect("main.jsp");
				%>
				<script type="text/javascript">
					alert("로그인 성공 💖🎉🎂");
					location.href ="main.jsp";
				</script>
				<%
		}
		
	%>
	
</body>
</html>