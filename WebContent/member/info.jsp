<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/info.jsp</title>
</head>
<body>
	<h1>member/info.jsp</h1>

	<%
		// like 메인 페이지, 로그인 한 사람만! 이 페이지 볼 수 있게
		// 로그인 여부 체크
		String id = (String) session.getAttribute("loginID");
		if (id == null) { 
			// 로그인 안 한 놈은 = 세션에 로그인 아이디 정보 없는 놈은.. 로그인하고 온나
			response.sendRedirect("loginForm.jsp");
			System.out.println("로그인 하고 오세요^^ (from info.jsp)");
			// jsp > html > js니까,, 여기선 js로 페이지 이동 못 함
		}
	%>

	<h2>개인정보 조회</h2>
	
	<%
		// DB에 접근해서 해당 유저(로그인 성공한 유저)의 정보만 가져오기
			// 	select.....해와서 그거랑 아이디 비교?
		// DB user 테이블에서,, PK나 UK가 걸려있나? 그런 고유한 정보여야~ 식별 가능하지
				// 예 우리 테이블에선 id가 pk입니다^^ 고유한 값 맞음 
		// DAO 쓰자~ DB 쓸거니까
		MemberDAO dao = new MemberDAO();
	
		// 회원 정보 조회 메서드 호출
		// dao.getMember(id);  // -> 리턴값: MemberBean mb!!! 만들어진거니까 
		MemberBean mb = dao.getMember(id);   // 멤버빈형 변수 mb에 저장~
		
	%>
	<h3>id: <%=mb.getId() %></h3>
	<h3>pw: <%=mb.getPw() %></h3>
	<h3>name: <%=mb.getName() %></h3>
	<h3>age: <%=mb.getAge() %></h3>
	<h3>gender: <%=mb.getGender() %></h3>
	<h3>email: <%=mb.getEmail() %></h3>
	<h3>regdate: <%=mb.getRegdate() %></h3>
	
	<h4><a href="main.jsp">메인 페이지로..🚀🚀  </a> </h4>
	
</body>
</html>