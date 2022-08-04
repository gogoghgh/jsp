<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/insert.jsp</title>
</head>
<body>
	<h1>insert.jsp</h1>
	<%!
		// !선언문! 사용해서 기존 필요한 정보들 상수화해놓기~
		// 필요할 때마다 해당 값들 불러오면 됨
		static final String DRIVER = "com.mysql.cj.jdbc.Driver";
		static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		static final String DBID = "root";
		static final String DBPW = "1234";
	%>
	
	<%
		// 한글 처리,,
		request.setCharacterEncoding("UTF-8");
		
		// ★ 흐름 외우기~~~ ★
		// 0. 드라이버 설치 (이미 되어 있음)
		// 1. 드라이버 로드
// 		Class.forName("com.mysql.cj.jdbc.Driver");
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공");
		// 2. DB 연결 (DB 연결 정보를 가져오기)
// 		DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
// 		DriverManager.getConnection(DBURL, DBID, DBPW);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
								// 프로토콜 : // 내 컴에 있는: mysql / DB
								// http://localhost:8088/JSP6/jsp2/dbConnect.jsp
								// 프로토콜 :// 내 컴:톰캣 / 내가 만든 프로젝트~
								//        여기에 다른 사람 주소 넣으면,, 들어가지겠네~ Yes~!! 뭐 방화벽이나 이런 거만 없다면,,
		// Connection이라는 인터페이스,, 객체 생성할 수는 없잖아염 new 할 수 없는데~ 어떻게 저렇게 쓴거지?!
		// upcasting 해서 쓴거임!! 인터페이스 객체 안에 정보를 저장하는 것은,, 서브 클래스(ConnectionImpl)가 인터페이스 껍데기(Connection)를 쓴 것일 뿐~~~~~ 흠,,
		// getConnection 사용해서 DB 연결 정보를 받아온다~~ 그걸 con 변수에 넣어 놓는 것!! so 항상 연결될 수 있도록~~~
		
		System.out.println("DB 연결 성공쓰");
		System.out.println("con: " + con);  // con: com.mysql.cj.jdbc.ConnectionImpl@10471bb8
											// 앞에는 패키지~~ 클래스명: ConnectionImpl ~~~
											// implements~~~ 인터페이스 상속~~ 한 클래스다@~
		// 근데,, 연결됐긴 됐는데,,, 걍 한 번! 연결해보고 다시 돌아온거임,, 일회성임
		// 이거 성공했다고 DB 계속 사용할 수 있는건 아님,,
		// 그래서~ 계속 사용할 수 있도록~~ line 33으로 ㄱㄱ.. 
		// Connection이라는 인터페이스,, 객체 생성할 수는 없잖아염 new 할 수 없는데~ 어떻게 저렇게 쓴거지?!
		
// 		String id = "itwill01";
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));  // age가 String으로 넘어와서,, int 타입으로 바꿈 parseInt~~~
		String email = request.getParameter("email");
		
		// 3. SQL 작성 & stmt 객체
// 		String sql ="insert into itwill_member values ('admin', '1234', '가현스', 29, '여', 'aa@bb.com', '2022-08-03')";
			// 왜 안되지?! 서버 재실행하니까 됨 ㅎㅎㅎ
			// insert 여러번 하진 마시구요~~~ pk 제약조건,, not null + unique 해치니까
			// 여러번 하고싶은데~~ values 값들을 변수로 지정하자!!
// 		String sql ="insert into itwill_member values ('"+id+"', '"+pw+"', '"+name+"', '"+age+"', '여', 'aa@bb.com', '2022-08-03')";
		// 근데 statement 넘 느려서,, 요즘은 안 쓴다!?!?! 
		// 밑에처럼 씁니다,, ㅋ.... PreparedStatement 이거 씀 
		String sql ="insert into itwill_member(id, pw, name, age, gender, email, regdate) values (?, ?, ?, ?, ?, ?, ?)";
		
		// SQL 실행하는 객체 (stmt < pstmt)
// 		Statement stmt = con.createStatement();
						// DB 연결 객체(=con) 이용~
		PreparedStatement pstmt = con.prepareStatement(sql); 
		//Statement는 실행할 때 sql을 가져가는데, 얘는 이미 갖고 있음~ 더 빨리 실행 가능 +보안도 더 좋음
		
		//pstmt 만들고, ? 처리하고!!! 쿼리 실행(step 4)~
		// 컬럼명의 타입(int,, String, timestamp,,)에 따라서 메서드가 변경됨
// 		pstmt.setㅇㅇㅇ(parameterIndex = ? 위치, x = 그기에 들어갈 값);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, age); // 얘는 int!!
		pstmt.setString(5, "여");
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis())); // 시스템 현 시각!!
		
		// 4. SQL 실행
// 		stmt.executeUpdate(sql); 
		pstmt.executeUpdate(); //위에서 이미 sql 가져갔으니 걍 실행만 하면 됨
		
		System.out.println("회원가입 완료 ㅊㅋㅊㅋ");
		
	%>
</body>
</html>