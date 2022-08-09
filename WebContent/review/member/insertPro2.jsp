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
<title>review/member/insertPro2.jsp</title>
</head>
<body>
	<h1>review/member/insertPro2.jsp</h1>
	<h2>숙제 풀이 타임</h2>
	<%!
	static final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";
	%>
	<%
		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
	%>
	
		<!-- 액션태그로 자바빈 객체 생성 -->
		<jsp:useBean id="mb" class="com.review.member.MemberBean"/>
		<!-- 자바빈 이용해서 set + regdate 따로 처리 -->
		<jsp:setProperty property="*" name="mb"/>
		
	<%
		// 잘 넘어왔나 toString으로 확인
		System.out.println(mb);
		out.println(mb+"<br>");
		
		// 잘 넘어왔군~ regdate=null << 얘 따로 처리하기,, 
				// request.setAttribute 말고!! 멤버빈 객체에 저장해야쥐
// 		request.setAttribute("regdate", new Timestamp(System.currentTimeMillis()));
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		System.out.println(mb);
		out.println(mb);

		
 		// 2. DB 연결, 정보 DB에 저장 (insert)
		// (1)
		Class.forName(DRIVER);
		// (2)
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		// (3)
		String sql = "insert into itwill_member values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		// + 멤버빈 객체에 set()으로 저장했으니까, 
		//   get()으로 꺼내와서 -> pstmt.set~으로 DB 테이블에 저장!! 
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setInt(4, mb.getAge());
		pstmt.setString(5, mb.getGender());
		pstmt.setString(6, mb.getEmail());
		pstmt.setTimestamp(7, mb.getRegdate());
		// (4)
// 		pstmt.executeUpdate();
		int result = pstmt.executeUpdate();
		
		System.out.println("회원가입 완료");
		
		// 회원가입 완료 -> 로그인
		
		if(result==1){
			// result=1 참? insert 잘 된거다 -> 로그인 페이지로 고고~ 
			response.sendRedirect("loginForm.jsp");
		}
	%>
	
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
			<td><jsp:getProperty property="id" name="mb"/> </td>
			<td><jsp:getProperty property="pw" name="mb"/> </td>
			<td><jsp:getProperty property="name" name="mb"/> </td>
			<td><jsp:getProperty property="age" name="mb"/> </td>
			<td><jsp:getProperty property="gender" name="mb"/> </td>
			<td><jsp:getProperty property="email" name="mb"/> </td>
			<td><jsp:getProperty property="regdate" name="mb"/> </td>
		<%--  <td><%=mb.getRegdate() %>  </td> 
				위에서 이미 set 해서 멤버빈 객체에 들어있는 상태고, 그걸 꺼내오는 거니까
				property="regdate"도 get으로 가져오기 쌉가능  --%>
		</tr>
	</table>

		<script type="text/javascript">
			alert("가입해주셔서 감사륑 💖😘💋✨")
// 			location.href = "../../member/login.jsp";
		</script>
	
</body>
</html>