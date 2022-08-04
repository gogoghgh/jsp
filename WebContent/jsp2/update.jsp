<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/update.jsp</title>
</head>
<body>
	<h1>update.jsp</h1>
	
	<%!static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";%>
	
	<%
		//1. 드라이버 로드
		Class.forName(DRIVER);
	
		//2. DB 연결 + 변수에 저장
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		//3. SQL 쿼리 생성 & pstmt
		String sql = "update itwill_member set age=? where id=?"; 
			// 바뀌는 값이 항상 같지 않으니, ? 로 ... 글고 쿼리에 데이터값 노출되는 게 보안적으로 ㅂㄹ
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 쿼리에 물음표 있으니까 처리하고!
		// 물음표 개수 = 쿼리 개수 같아야 함~ 그래야 전달될테니
		pstmt.setInt(1, 50);  // 첫번째 물음표(나이니까 int)에 -> 50
		pstmt.setString(2, "admin"); // 두번째 물음표에 -> admin
			
		//4. SQL 쿼리 실행
		pstmt.executeUpdate();  //테이블 내용 바뀌었으니~~
	
	%>
	
</body>
</html>