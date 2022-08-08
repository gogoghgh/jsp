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
<title>review/member/insertPro.jsp</title>
</head>
<body>
	<h1>review/member/insertPro.jsp</h1>
	<%!
	static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";
	%>
	<%
		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. 폼에서 submit해서 넘어온 정보 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		Timestamp regdate = new Timestamp(System.currentTimeMillis());
		// 잘 넘어왔나 확인
		System.out.println("id: " + id + "/ pw: " + pw + "/ name: " + name + "/ age: " + age 
							+ "/ gender: " + gender + "/ email: " + email + "/ regdate: " + regdate);
		
		
		// 2. DB 연결, 정보 저장
		// (1)
		Class.forName(DRIVER);
		// (2)
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		// (3)
		String sql = "insert into itwill_member values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		// +
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, regdate);
		// (4)
		pstmt.executeUpdate();
	%>
	
	<h2> 숙제: 액션 태그 활용해서 자바빈 객체 사용</h2>
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="jb" class="com.review.member.MemberBean"/>
	
	<!-- set~ 전달된 파라미터 싸그리 저장 + regdate는,, 따로 저장? -->
	<jsp:setProperty property="*" name="jb"/>
<%-- 	<jsp:setProperty property="regdate" name="jb" value="regdate"/> --%>
	<% jb.setRegdate(new Timestamp(System.currentTimeMillis())); %>
	
	<!-- get~으로 출력 -->
	<table border="1px">
		<tr>
			<td>id</td>
			<td>pw</td>
			<td>name</td>
			<td>age</td>
			<td>gender</td>
			<td>email</td>
			<td>regdate</td>
		</tr>
		<tr>
			<td><jsp:getProperty property="id" name="jb"/> </td>
			<td><jsp:getProperty property="pw" name="jb"/> </td>
			<td><jsp:getProperty property="name" name="jb"/> </td>
			<td><jsp:getProperty property="age" name="jb"/> </td>
			<td><jsp:getProperty property="gender" name="jb"/> </td>
			<td><jsp:getProperty property="email" name="jb"/> </td>
<%-- 			<td><jsp:getProperty property="regdate" name="jb"/> </td> --%>
			<td><%=jb.getRegdate() %>  </td>
		</tr>
	</table>

<%--
 	id: <jsp:getProperty property="id" name="jb"/> <br>
	pw: <jsp:getProperty property="pw" name="jb"/> <br>
	name: <jsp:getProperty property="name" name="jb"/> <br>
	age: <jsp:getProperty property="age" name="jb"/> <br>
	gender: <jsp:getProperty property="gender" name="jb"/> <br>
	email: <jsp:getProperty property="email" name="jb"/> <br>
	regdate: <jsp:getProperty property="regdate" name="jb"/> <br> --%>
	
		<script type="text/javascript">
			alert("가입해주셔서 감사륑 💖😘💋✨")
// 			location.href = "../../member/login.jsp";
		</script>
	
</body>
</html>