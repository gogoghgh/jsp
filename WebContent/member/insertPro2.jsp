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
<title>member/insertPro2.jsp</title>
</head>
<body>
	<h1>member/insertPro2.jsp</h1>
	
	<%!static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";%>
	
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
	
		   // 디비연결-정보 저장
	   // 1. 드라이버 로드
	   Class.forName(DRIVER);
	   System.out.println(" 드라이버 로드 성공 ");
	   // 2. 디비 연결
	   Connection con = 
	      DriverManager.getConnection(DBURL, DBID, DBPW);
	   System.out.println(" 디비연결 성공 ");
	   // 3. SQL (insert) & pstmt 생성
	   String sql = "insert into itwill_member(id,pw,name,age,gender,email,regdate) values(?,?,?,?,?,?,?)";
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   
	   //   물음표 처리
// 		pstmt.setString(1, id);
// 	    pstmt.setString(2, pw);
// 	    pstmt.setString(3, name);
// 	    pstmt.setInt(4, age);
// 	    pstmt.setString(5, gender);
// 	    pstmt.setString(6, email);
// 	    pstmt.setTimestamp(7, regdate);
				// 왜 오류뜨남?
			   // 자바빈 객체 생성했으니 그걸 통해서 꺼내와야 하겠죠~~~ 아예~
		pstmt.setString(1, mb.getId());
	    pstmt.setString(2, mb.getPw());
	    pstmt.setString(3, mb.getName());
	    pstmt.setInt(4, mb.getAge());
	    pstmt.setString(5, mb.getGender());
	    pstmt.setString(6, mb.getEmail());
	    pstmt.setTimestamp(7, mb.getRegdate());
	    
	   // 4. SQL 실행
// 	   pstmt.executeUpdate();
	   			// 리턴 타입이 int네? 얘는 뭘까?? 
	   			// 쿼리가 적용된 row 수를 리턴한다~~ 우리가 실행한 쿼리문이 DB table 몇 row에 영향을 줬냐,,
	   // sql 쿼리의 결과가 -> DB 테이블에 영향을 준 행(row)의 수를 리턴함
	   // 그러면~ result라는 변수에 얘를 담아보자
	   int result = pstmt.executeUpdate();
	   
	   System.out.println(" 회원가입 완료 ");
	   
	   // 회원가입 완료 -> 로그인
	   if(result == 1) { 
		   // result가 1? 1행이 업데이트 됐다~ 회원가입 된거네~ 됐으니까 로그인페이지로 가라~
		   response.sendRedirect("loginForm.jsp");
	   }
			
	%>
	
</body>
</html>