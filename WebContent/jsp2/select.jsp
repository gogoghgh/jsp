<%@page import="java.sql.Timestamp"%>
<%@page import="javax.swing.border.Border"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp2/select.jsp</title>
</head>
<body>
	<h1>select.jsp</h1>

	<!-- 
	* 패키지 = 관련 있는 것들끼리 묶음~
	
	
	com.mysql.cj.jdbc
	역순으로 읽으면? 
	jdbc.cj.mysql.com..... ㄷㄷㄷㄷ 웹페이지 주소아냐?!
	
	A개발자 - test.jsp 생성 동작
	B개발자 - test.jsp 삭제 동작
		.. 합치면? 충돌,, 이름 바꾸자~ 패키지 바꾸자~그것도 쉽지 않음,,
		협업하기가 쉽지 않음~~ A 휴가가있고 막,, 
	
	회사 도메인주소(=고유정보!! 하나뿐)
	www.itwillbs.com
  ->    itwillbs.com.java.Test    www 다 쓰니까 생략하고, 내가 맡은 파트~~~ 
  ->    com.itwillbs.java.Test    패키지 좀 강조될 수 있게? 거꾸로 쓰자~ㅋ
	∴ 회사 도메인명 뒤집어서 + www 빼고 + 패키지명~~~ 
	  근데,, 회사마다 규칙이 있으니~^^ 회사 규칙 따라 하삼 ~~ 이게 일반적인 방식이긴 함 
	 -->

	<%!static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	static final String DBID = "root";
	static final String DBPW = "1234";%>

	<%
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공");

		// 2. DB 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 성공");
		System.out.println("con: " + con);

		// 3. SQL & pstmt
		// sql - 전체 회원목록 조회
// 		String sql = "select * from itwill_member";
		String sql = "select * from itwill_member where id != 'admin'";   //admin 빼고 출력해보기 (방법2)

		PreparedStatement pstmt = con.prepareStatement(sql);
		// 쿼리에 ? 없으니 ? 처리 안 함~~ select 자넴^^

		// 4. SQL 실행
		ResultSet rs = pstmt.executeQuery(); // ResultSet 안에 레코드셋이 있습니다^^
												// rs 안에 그,, 데이터 테이블이 들어있다고 연상하3
		// pstmt.executeUpdate();
		// -> insert,  update,  delete  => 데이터 바뀌거나 사라지거나 생기거나 해서, 테이블이 변화~
		// pstmt.executeQuery();
		// -> select => 걍 조회,, 테이블에 아무 변화 X

		// 		System.out.println("횐 목록 조회 성공");
		// 근데,, 뭐 출력도 안 되고 뭐야?!? -> 걍 우리는 조회만 시켰음,, 조회하고 와~ 
		// 조회한 걸 꺼내와야 볼 수 있쥐!!

		// select 쓰는 원리
		// select 실행하면 
		// BOF ----------------------------------- EOF
		// Begin Of Files --------------------- End Of Files
		//             사이에 select 된 애들~~
		// 이 상태로 레코드 셋이 생김,, 이 데이터들을 가져다가, 커서를 옮길거다,,,,
		// 커서가 BOF부터 시작 -> 한 줄 내리고 -> ... 가로줄 한 줄씩 조회하고 -> EOF 만나면 종료
		// 노션 그림 참고 
		%>
		<table border="1">
		<tr>
			<td>id</td>
			<td>pw</td>
			<td>name</td>
			<td>age</td>
			<td>gender</td>
			<td>email</td>
			<td>regdate</td>
		</tr>
		<%
		
		// 5. 데이터 처리 (select)

		// 		if(rs.next()){ // 커서가 다음 줄로 움직였는데~ (리턴타입:boolean)
		// 데이터가 있다면~ 커서가 보고 있는 값이 존재한다면~~ (커서는 행 기준으로 데이터 조회 가능)
		while (rs.next()) { // 전체 회원 목록 출력!!
// 			rs.getString(1);
// 			out.println("아이디: " + rs.getString("id") + "&nbsp&nbsp&nbsp|"); // id 컬럼에서 데이터 가져와라~~~ = admin
// 			// 			rs.getString(2); 필요 없었네;;;;^^;;
// 			out.println("비번: " + rs.getString(2) + "&nbsp&nbsp&nbsp|");
// 			// 			rs.getString(3);
// 			out.println("이름: " + rs.getString(3) + "&nbsp&nbsp&nbsp|");
// 			// 			rs.getInt(4);
// 			out.println("나이: " + rs.getString(4) + "&nbsp&nbsp&nbsp|");
// 			// 			rs.getString(5);
// 			out.println("성별: " + rs.getString(5) + "&nbsp&nbsp&nbsp|");
// 			// 			rs.getString(6);
// 			out.println("이멜: " + rs.getString(6) + "&nbsp&nbsp&nbsp|");
// 			out.println("가입날짜: " + rs.getString(7));
// 			out.println("<br>");
// 		if(rs.getString(1)!="admin"){ // admin 빼고 출력하기
			//표로 나타내기 위해,, 변수에 값들 저장
			String id = rs.getString("id"); // 컬럼 셀 때는 인덱스 1부터임~ 0 XXX
			String pw = rs.getString("pw"); // 인덱스 2
			String name = rs.getString("name"); // 인덱스 3
			int age = rs.getInt(4);
			String gender = rs.getString(5);
			String email = rs.getString(6);
			Timestamp regdate = rs.getTimestamp(7);
			// 인덱스 쓰는 게 더 성능에 좋으니까~ 알겠쥐?
			
			// admin 빼고 출력해보기 (방법1)
// 			if(id.equals("admin")){
// 				continue; // id가 admin이면 걍 지나쳐라~^^
// 			}
			
			%>
				<tr>
					<td><%=id %></td>
					<td><%=pw %></td>
					<td><%=name %></td>
					<td><%=age%></td>
					<td><%=gender%></td>
					<td><%=email%></td>
					<td><%=regdate%></td>
				</tr>
				<%
		}//while
	%>
	</table>
	
<%-- 	<table border="1px">
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
			<td><%= out.println(rs.getString(1))%></td>
			<td>pw</td>
			<td>name</td>
			<td>age</td>
			<td>gender</td>
			<td>email</td>
			<td>regdate</td>
		</tr> --%>
	
<!-- 	</table> -->

	<hr>
	<%=sql%>
</body>
</html>