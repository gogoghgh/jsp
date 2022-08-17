<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/memberList.jsp</title>
</head>
<body>
	<h1>member/memberList.jsp</h1>
	
	<h2> 회원 정보 목록 </h2>
	
	<%
		// 로그인 체크,, 아무나 보면 클남 + 관리자 여부 체크
		String id = (String)session.getAttribute("loginID");
		if(id == null || !(id.equals("admin"))){
			//id가 null일 때,, =로그인 안 했거나,, 또는 id가 admin이 아니면~~
			response.sendRedirect("loginForm.jsp"); // 로그인 하고 온나~
		}
		
		// DB에 저장된 회원 정보 모두 가져오기
			// DB 쓸 거니까 DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 전~~체 회원 정보를 가져오는 메서더~~ 있나? 없으니까 만들고 오삼
		// ArrayList memberList = dao.getMemberList(); // < > 생략시,, <<< Object임!! ㄷㄷㄷ
			// ArrayList is a raw type. 원시 데이터다~~~~ 제너릭 
		ArrayList<MemberBean> memberList = dao.getMemberList(); // 제너릭 안 적으면,, 형변환 일일이 해줘야 하넴
				
		// 화면에 출력쓰~~ 표 형태로
		%>
		<table border="1">
			<tr align="center">
				<th>id     </th>
				<th>pw     </th>
				<th>name   </th>
				<th>age    </th>
				<th>gender </th>
				<th>email  </th>
				<th>regdate</th>
			</tr>
			
			<% for(int i = 0; i < memberList.size(); i++){    
				// MemberBean mb = (MemberBean)memberList.get(i);  // type mismatch,, 
									// memberList가 Object타입이 되어벌여서,,, down casting 해줘야 함,,, 
									// 귀찮아~~ 위에 제너릭 적어주기
				MemberBean mb = memberList.get(i); // 1. ㅁㅁㅁㅁㅁ  ArrayList 
												//    2.  ㄴㄴㄴㄴㄴ 안에 멤버빈 필통 객체덜 get으로 하나씩 끄집어내서
												//                     mb 필통에 저장
			%>
			<tr>
				<td><%=mb.getId() %></td>  <!-- 3. 멤버빈 필통 열어서 요소들 하나씩 넣기 -->
				<td><%=mb.getPw() %></td>
				<td><%=mb.getName() %></td>
				<td><%=mb.getAge() %></td>
				<td><%=mb.getGender() %></td>
				<td><%=mb.getEmail() %></td>
				<td><%=mb.getRegdate() %></td>
			</tr>
			<% } %>
			
			
<%-- 			<% while(memberList.isEmpty()){
				%>
			<tr>
				<td><%= memberList.get(0) %></td>
				<td>pw</td>
				<td>name</td>
				<td>age</td>
				<td>gender</td>
				<td>email</td>
				<td>regdate</td>
			</tr>
	확인용	<%=memberList %>
		</table> --%>
</body>
</html>