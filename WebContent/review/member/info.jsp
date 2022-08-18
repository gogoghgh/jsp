<%@page import="com.review.member.MemberBean"%>
<%@page import="com.review.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/info.jsp</title>
</head>
<body>
	<h1>review/member/info.jsp</h1>
	
	<%
		//로그인 여부 체크!! 로그인 한 사람만 이 페이지 볼 수 있게,, 당건 당건
		String id = (String)session.getAttribute("loginID");
		
		if(id==null){
			response.sendRedirect("loginForm.jsp");
		}
	
	%>
	
	<h2> 회원 정보 조회 👀 </h2>
	<%
		// pk (nn+uk) 걸려있는 id컬럼을 기준으로 해가지고,, select 해오기!! 
		// 아하~ 그래서 id를 where에~~ 이렇게 다 DAO에 메서드로 설계해놨으니^^ new -> 메서드 호출하자
		MemberDAO dao = new MemberDAO();
		
		// 메서드 리턴값이 MemberBean 이니까~~~ 멤버빈형 변수 mb에 담아주기
		MemberBean mb = dao.getMemberInfo(id);
		
	%>
	
	<h3>id: <%=mb.getId() %></h3>
	<h3>pw: <%=mb.getPw() %></h3>
	<h3>name: <%=mb.getName() %></h3>
	<h3>age: <%=mb.getAge() %></h3>
	<h3>gender: <%=mb.getGender() %></h3>
	<h3>email: <%=mb.getEmail() %></h3>
	<h3>regdate: <%=mb.getRegdate() %></h3> 
	
	<h4><a href="main.jsp"> 메인 페이지로 가실까예🐱‍🏍🐱‍🏍🚀🚀 </a></h4>
	

</body>
</html>