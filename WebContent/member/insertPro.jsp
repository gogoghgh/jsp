<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/insertPro.jsp</title>
</head>
<body>
	<h1>member/insertPro.jsp</h1>

	<%
		// 0. 한글로 넘어오니까,, 깨질 수도 있으니 한글 처리 char어쩌구저ㅓㅉ구
		request.setCharacterEncoding("UTF-8");
		// 1. 폼에서 submit해서 전달된 정보 저장
		// id, 비번, 이름, 나이, 성별, 이멜
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		// 회원가입일은,, 입력 안 받았지요? 따로 만들어주기 java.sql 밑에 있는 
		Timestamp regdate = new Timestamp(System.currentTimeMillis());

		// 정보 확인
		System.out.println("id: " + id + " / pw: " + pw + " / name: " + name + " / age: " + age + " / gender: "
				+ gender + " / email: " + email + " / regdate: " + regdate); 
		
		// 2. 디비 연결-정보 저장 %>
		<%!
		static final String DRIVER = "com.mysql.cj.jdbc.Driver";
		static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		static final String DBID = "root";
		static final String DBPW = "1234";
		%>
		<%
		// 1) 드라이버 로드
		Class.forName(DRIVER);

		// 2) DB 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 성공쓰");
		
		// 3) SQL 쿼리(insert) 생성 & SQL 실행하는 객체 pstmt 생성
		String sql = "insert into itwill_member values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);

		//  + ? 물음표 처리
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, regdate);
		
		// 4) SQL 실행
		pstmt.executeUpdate();
		System.out.println("횐 가입 완료");
		
		// 3. 회원가입 완료 -> 잘 됐나 확인하려고 로그인 시켜보기
// 		session.setAttribute("", arg1);
		
		%>
		
 		<script type="text/javascript">
			alert("💖💘👋회원 가입해주셔서 감사합니다. 웰컴💖💖🤗💝 ");
			location.href = "login.jsp";
		</script>

</body>
</html>