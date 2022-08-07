<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/delete.jsp</title>
</head>
<body>
	<h1>review/delete.jsp</h1>
	<%!
	static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		
		Class.forName(DRIVER);
		
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		String sql = "delete from itwill_member where id =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, "lion");
		
		pstmt.executeUpdate();
		System.out.println("삭제 완");
	%>
	
	<script type="text/javascript">
		alert("삭제 완,,,, 😥👋  select.jsp로 이동합니다...🐱‍🏍");
		location.href = "select.jsp";
	</script>
	
</body>
</html>