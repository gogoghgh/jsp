<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/insert.jsp</title>
</head>
<body>
	<h1>review/insert.jsp</h1>
	<%!
		static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
								//'D'river는 클래스, 그 앞에는 패키지명
		static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
								// 프로토콜://내컴에있는:mySQL포트/DB명
		static final String DBID = "root";
		static final String DBPW = "1234";
	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		// 1.
		Class.forName(DRIVER);
		// 2.
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 성공");
		System.out.println("con: " + con);

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		
		// 3.
		String sql = "insert into itwill_member(id, pw, name, age, gender, email, regdate) values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// + 물음표 처리
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, "여");
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
		
		// 4.
		pstmt.executeUpdate();
		
	%>
	
	<script type="text/javascript">
		alert("💖😘 회원가입이 완료되었습니다. 웰컴!! 😘💖");
		alert("select.jsp 페이지로 이동합니다^^🚀🏍🛫");
		location.href = "select.jsp";
	</script>
	
</body>
</html>