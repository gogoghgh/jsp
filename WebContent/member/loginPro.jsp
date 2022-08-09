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
<title>member/loginPro.jsp</title>
</head>
<body>
	<h1>member/loginPro.jsp</h1>
	<%!
		static final String DRIVER = "com.mysql.cj.jdbc.Driver";
		static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		static final String DBID = "root";
		static final String DBPW = "1234";
	%>
	
	<%
		// 넘겨받은 데이터가 한글일 수 있으니 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 저장 (id, pw)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 근데~~ 여기서 자바빈 객체 써도 될까요?>???/????
		// 10자루 들어가는 필통(=객체,,)에,,, 2자루만 넣는 거,, 비효율적이지 않나요?
		// 아닙니다!!! 데이터 하나라도, 한 자루라도,,, 필통에 담 아 서 다 녀 야 합 니 다 !!!
		// 그래야 나중에 스프링 하고 그럴 때~~~ 좋다
		
	%>
		
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb"/>
		
<%-- 		<jsp:getProperty property="id" name="mb"/> --%>
<%-- 		<jsp:getProperty property="pw" name="mb"/> --%>
		
	<%	
		System.out.println(mb);
		// 예 여기까지 로그인에 필요한 정보 잘 가져왔고요~		
	
		// 로그인 정보 유효성 검사~~ 하는 로직
		
			// 하기 전에 DB랑 연결~~~
			/////////////////////////////////////////////////////////////
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("드라이버 로드 완");
			
			// 2. DB 연결
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("DB 연결 완");
			
			// 3. SQL 쿼리 작성(select) & SQL 실행하는 객체 pstmt 생성
			//         DB 안에 정보 가져와서! select!!
			//     + 물음표 있으면 처리
// 			String sql = "select * from itwill_member where id=? and pw=?";
			// 근데,, 이 쿼리를 안 쓰고 아래처럼 쓸거랍니더,,,, pw만!! 가져오도록 
			String sql = "select pw from itwill_member where id=?";
							// pw: not null           // id: pk
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 물음표 처리
			pstmt.setString(1, mb.getId()); // 첫번째 물음표에 멤버빈 id값 불러와서 넣는다,,, ㅇㅋㅇㅋ
			
			// 4. SQL 쿼리 실행 + rs 객체에 정보 저장해서,,
			ResultSet rs = pstmt.executeQuery(); 
			
			// 5. 데이터 처리
			if(rs.next()){ //레코드셋 커서 이동하면서~~~ 아이디랑 같은 값 있나 쭉 내려간다~
				// 아이디 있음 = 회원임
				// + 비번도 같냐? (입력한 비번 == DB에서 꺼낸 비번?)
				if(mb.getPw().equals(rs.getString("pw"))){  /*pw컬럼에 들어있는 String 값을 가져와서, mb.getPw랑 같은가 비교*/
					//아이디 같고, 비번도 같다 = 본인이다 => 로그인 성공
					%>
					<script type="text/javascript">
						<%-- alert(<%= id %>+ "님 로그인 성공 🥰🤗 ");  ~~님 넣고 싶은데ㅠ  --%>
						alert("로그인 성공 🥰🤗 ");
					</script>
					<!-- js보다 jsp가 우선순위 높아서 알림창 안 뜨고 걍 넘어가넴 -->
					
					<%
					// 로그인 정보(id) 저장 -> 공유 (영역~~~ scope 폴더 참고)
					// session에 담을 것이냐,, application에 담을 것이냐,,,
					// application은 프로젝트 전체에 저장되는 거임,, ㄷㄷㄷ 그건 투머치니까 
					// session 영역에 저장해서 갖고 다닐거에욘
					session.setAttribute("loginID", mb.getId());
					
					session.setAttribute("loginResult", "OK");
					
					%>
					
					맞나? 체크용 id: <%= id %>
					
					<%
					response.sendRedirect("main.jsp");
					
				} else {
					//아이디는 같은데, 비번이 다르다 => 로그인 실패
					%>
					<script type="text/javascript">
						alert("아이디 혹은 비번이 잘못되었습니다,, 무슨 일이죠,,,? 😥 ");
						history.back() // 뒤로 가기!!
					</script>
					
					<%
					
				}// if-else(pw)
				
			} else{
				// 아이디 없음 = 비회원임
				%>
				<script type="text/javascript">
					alert("아이디 혹은 비번이 잘못되었습니다,, 무슨 일이죠,,,? 😥 ");
					history.back() // 뒤로 가기!!
				</script>
				<%
			}// if-else(id)
			
			////////////////////////////////////////////////////////////
		
// 		// self로 해보는 중,,,,,,,,,, 
//		넘겨받은 정보가, 울 회원 db에 이 아이디, 비번이 존재하는지 확인!! 
// 		if(mb.getId().equals(/*DB에 저장되있는 아이디*/)){
// 			//같다면~ 비번 체크 
// 			if(mb.getPw().equals(/*DB에 저장되있는 비번*/)){
// 				// 비번도 같다면~ 울 회원 맞음 로그인 성공
				
// 			} else {
// 				// 비번이 다르다면~ 로그인 ㄴㄴ
				
// 			}// if-else(pw)
// 		}// if-else(id)
		
	%>
	
</body>
</html>