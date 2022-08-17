<%@page import="com.itwillbs.member.MemberDAO"%>
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
<title>member/insertPro3.jsp</title>
</head>
<body>
	<h1>member/insertPro3.jsp</h1>
	<h2>DB 정보 다 빼기!!! DAO가 있잫ㅇ나요</h2>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	%>
	
		<!-- 액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<!-- 전달 정보 저장 -->
		<jsp:setProperty property="*" name="mb"/>
		
	<%
		// 날짜 정보 추가로 저장~~ 
		// 입력 폼에 없었어서 null이었잖아염
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
	
		// 정보 확인 toString 메서드로
		System.out.println(mb.toString());
		System.out.println(mb);
		
		// 회원가입 =  DB 동작하는거,, DAO 클래스가 하기로 했죠??
		// DAO class -> insertMember()메서드
		MemberDAO dao = new MemberDAO(); // 객체 생성하고 -> 메서드 써봅시다
										// DB 연결에 쓸 수 있게 준비해놓은 상태,,!!! 준비 완
		dao.insertMember(mb); // insertMember() 메서드 호출.. mb 위에서 액션태그로 객체 생성 했고,,, 
		
		
	   // 회원가입 완료 -> 로그인
// 		response.sendRedirect("loginForm.jsp"); js로 할게염
	   
		// 와~ 이렇게 간단하게 되다니~~~^^...
		// jsp는 디자이너랑 협업하는 파트라,, 로직(계산, 연산해서 결과 만들어내는 거) 쓰지 않을거에욥 ~ 아 그 말이었군
		// 데이터 연산해서 결과 보여주고,, 이런 거는 별도 형태로 빼야 ~ 객체지향에 가까운 결과를 나타낼 수 있을 것임다
		// 비효율적인 것 같다? 노노노~
		
				// form -> pro 로 넘길 때, 파라미터로 받아주고, DB 객체 만들고, 처리 메서드 만들고 거 가서(DAO) 처리하고, 다시 돌아와서 움직이는거(페이지 이동?)
	%>
		<script type="text/javascript">
			alert("회원 가입 완료!!! 웰컴 💖🎇💘 ");
			alert("로그인 페이지로 이동합니다,,,🚀🚀🚀✈✈ ");
			location.href = "loginForm.jsp";
		</script>
	
</body>
</html>