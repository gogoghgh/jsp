<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/loginPro.jsp</title>
</head>
<body>
	<h1>review/member/loginPro.jsp</h1>
	<%!
	static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";
	%>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보(id, pw) 저장
/* 		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); */
		
	%>
	
	<!-- 몇 개 없더라도 필통에 담기!! -->
	<jsp:useBean id="mb" class="com.review.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	id(getProperty): <jsp:getProperty property="id" name="mb"/> <br>
	pw(getProperty): <jsp:getProperty property="pw" name="mb"/> <br>
	<hr>
	
	<%
		System.out.println(mb);
		out.println(mb);
		// 로그인에 필요한 정보 잘 들어왔나 확인 완^^
		
		// 로그인 유효성 검사 고고
		// 전에!! DB랑 연결 먼저 하고요,,
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 완");
		
		// 2. DB 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 완");
		
		// 3. SQL 쿼리 작성(select) & SQL 실행하는 객체 pstmt 생성
		String sql = "select pw from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// + 물음표 처리
		pstmt.setString(1, mb.getId()); 
			// id= 로그인 폼에서 입력받은 아이디를 멤버빈 객체에 저장해놨으니까 
			// 그거 get()으로 꺼내와서 DB에 있는 id랑 일치하는지 비교
		
		// 4. sql 쿼리 실행 + rs객체에 레코드셋 정보 저장.,,
		ResultSet rs = pstmt.executeQuery();
		
		// 5. 데이터 처리
		if(rs.next()){ //BOF에서 시작해서, 커서 한칸씩 내린다~~
			// rs(=select 날려서 가져온 레코드셋 덩어리)에 
			// where 조건절 만족(=id 일치 여부는 이미 여기서 확인 완)하는 행(row)이 있다!!
			if(rs.getString("pw").equals(mb.getPw())){ 
				// 로그인 폼에서 넘겨받은 비번 정보랑 = DB에서 가져온 pw랑 같다?! = 울 회원 맞다
				// 로그인 성공 알림창으로 얼른,, 축하해줍시다 어서 어서
				%>
				<script type="text/javascript">
					alert("로그인 성공 💖🎉🎂");
				</script>
				
				<%
				// 로그인 정보 session 영역에 저장 -> 공유
				session.setAttribute("loginID", mb.getId());
				// session.setAttribute("loginPW", mb.getPw()); 에바~~
				session.setAttribute("loginResult", "OK");
				
				// 메인 페이지로 이동시킨다~~
				response.sendRedirect("main.jsp");
			} else {
				// id는 만족인데,, (where id=? 만족했으니) pw 틀린 경우,, 로그인 실패
				%>
				<script type="text/javascript">
					alert("아이디 혹은 비번이 잘못되었습니다ㅠ 웁스");
					history.back();
				</script>
				<%
			}//if-else 안에거 끝
		} else {
			// where=id? 조건도 만족 X~~~~ 아이디부터 틀렸다~
			%>
			<script type="text/javascript">
				alert("아이디 혹은 비번이 잘못되었습니다ㅠ 웁스");
				history.back();
			</script>
			<%
		} //if-else 밖에거 끝
		
	%>
	
</body>
</html>