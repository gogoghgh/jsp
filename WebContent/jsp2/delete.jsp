<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/delete.jsp</title>
</head>
<body>
	<h1>delete.jsp</h1>
	
	<%!static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";%>
	
	<%
		//1. 드라이버 로드
		Class.forName(DRIVER);
	
		//2. DB연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		//3. SQL 쿼리 생성 & pstmt
		String sql = "delete from itwill_member where id=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 물음표 처리
		pstmt.setString(1, "hello"); // 첫번째 물음표 -> id가 hello인 회원 지움
		
		//4. SQL 쿼리 실행
		pstmt.executeUpdate();
		
		System.out.println("삭제 완...");
	%>
	
</body>
</html>