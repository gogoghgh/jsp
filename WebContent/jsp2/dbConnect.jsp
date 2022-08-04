<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/dbConnect.jsp</title>
</head>
<body>
	<h1>dbConnect.jsp</h1>
	<%
		// JDBC: Java와 DB를 연결하는 API(Application Platform Interface?)
		
		// 0. MySQL 드라이버(라이브러리) 설치 => 프로젝트!당! 1번 해야 함
		//   WEB-INF/lib/mysql-connector-java-8.0.30.jar 복사(추가)
		
		// 1. 설치된 드라이버를 로드 (리플렉션,, reflection 반영,,?)
		Class.forName("com.mysql.cj.jdbc.Driver"); // 이렇게 생겨먹은 드라이버를,, 갖고 온다?
		System.out.println("드라이버 로드 성공~~ ㅊㅋㅊㅋ~~");
		
		// 2. 드라이버를 사용해서 DB 접속
		DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb?servertimeZone=Asia/Seoul", "root", "1234");
			// 드라이버매니저가, /연결 정보를 가져온다,, /DB주소, ID, PW 입력받아서
			// mySQL 포트번호 3306임,,, -> jspdb DB 쓸 거 + 서버타임
		
		System.out.println("디비 연결 성공~~");
			
		// 완전 자주 쓸거라서 자동으로 외워질거임^^........
	
	%>
	
</body>
</html>