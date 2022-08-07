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
<title>review/select.jsp</title>
</head>
<body>
	<h1>review/select.jsp</h1>
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
		
// 		String sql = "select * from itwill_member";
		String sql = "select * from itwill_member where id!='admin'"; // admin 제외 출력 (방법2)
		
// 		PreparedStatement pstmt = con.prepareStatement(sql);
		PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		// 커서 자유롭게 이동하고 싶어서,,, 옵션 추가했습니데이 ㅋ
					/* 		상수명
					TYPE_FORWARD_ONLY
					커서 이동을 다음 레코드로만 이동 되도록 한다
					
					TYPE_SCROLL_SENSITIVE
					커서 이동을 자유롭게 하고 업데이트 내용을 반영한다.
					
					TYPE_SCROLL_INSENSITIVE
					커서..  자유롭게 하고 업데이트 내용을 반영하지 않는다
					
					CONCUR_UPDATABLE
					데이터 변경이 가능하도록 한다.
					
					CONCUR_READ_ONLY
					데이터 변경이 불가능 하도록 한다. */
		
// 		pstmt.executeQuery();
// 		System.out.println("회원 목록 조회 성공");
//		이렇게만 하면,, 걍 조회하고 와~ 이렇게만 시킨 거니까 뭐 출력도 안 되고~^^; 어떡하쥐?
// 		조회한 걸 rs에 저장해놓고, 그걸 꺼내오기
		ResultSet rs = pstmt.executeQuery();
		
		%>
		
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
	
		<%
		
			while(rs.next()){
				
				// 표에 넣을거라서,, int, timestamp 걍 무시할게욤 일단~
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String age = rs.getString(4);
				String gender = rs.getString(5);
				String email = rs.getString(6);
				String regdate = rs.getString(7);
				// 얘가,, while 안에 들어가야 오류 안 나네,,, 왜지??? 
				// SQLException: Before start of result set
				// 아!!! while 들어가기 전이니까, 아직 BOF 구간이라서!!! 
				// 거기는 아직 아무 데이터도 없잖아염~~ 저장할 게 없음~
				%>
				<tr>
					<td><%=id %></td>
					<td><%=pw %></td>
					<td><%=name %></td>
					<td><%=age %></td>
					<td><%=gender %></td>
					<td><%=email %></td>
					<td><%=regdate %></td>
				</tr>
			<%	
			}
			%>
		</table>
		<br>
		
		<%
// 		rs.first();
		rs.beforeFirst();
		// while 돌리면서 표 만들고, 커서는 EOF 가리키고 있을테니,, 다시 BOF로 올리려고~ 
		// 그래야 밑에 애들이 나오지 않을까?
		// 오류,,
		// java.sql.SQLException: Operation not allowed for a result set of type ResultSet.
		// TYPE_FORWARD_ONLY. = 커서 이동을 다음 레코드로만 이동 되도록 한다 라는 뜻^^ 아 그래서 안됐군~~
		// 이 옵션을 바꾸러 갈게ㅔ염~~~ 위로 
		
// 		if(rs.next()){
		while(rs.next()) { // 전체 회원 목록 출력
// 			if(rs.getString(1).equals("admin")) continue; // admin 빼고 출력 (방법1)
			out.println("id: " + rs.getString(1)+"&nbsp&nbsp&nbsp");
			out.println("pw: " + rs.getString(2)+"&nbsp&nbsp&nbsp");
			out.println("name: " + rs.getString(3)+"&nbsp&nbsp&nbsp");
			out.println("age: " + rs.getString(4)+"&nbsp&nbsp&nbsp");
			out.println("gender: " + rs.getString(5)+"&nbsp&nbsp&nbsp");
			out.println("email: " + rs.getString(6)+"&nbsp&nbsp&nbsp");
			out.println("regdate: " + rs.getString(7)+"&nbsp&nbsp&nbsp");
			out.println("<br>");
			
		}
	%>
	
</body>
</html>