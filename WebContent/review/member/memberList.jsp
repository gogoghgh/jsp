<%@page import="com.review.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.review.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/memberList.jsp</title>
</head>
<body>
	<h1>review/member/memberList.jsp</h1>
	<h2>🕵️‍♀️ 회원 정보 목록 🕵️‍♂️</h2>
	
	<%
		// 1. 아무나 보면 클남,, 로그인 여부 + 관리자 여부 체크
		String id = (String) session.getAttribute("loginID");
		
		if(id == null || !id.equals("admin")) {
			System.out.println("(from memberList.jsp) admin 아닌 놈 들어옴ㄱ- 쫓아내자");
			response.sendRedirect("loginForm.jsp");
		}
		
		// DB table에 저장돼있는 회원 정보 모두 싸그리 가져오기
		// 2. *회원 정보 가져오는 거 = select 
		//    => DB 쓸거니까 DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 3. *회원 정보 조회 메서드 getMemberList (리턴타입: ArrayList<MemberBean> ) 호출 
		ArrayList<MemberBean> memberList = dao.getMemberList();
		
		// 4. 화면에 출력해보기 (표 양식에,,)
	%>
		<b>memberList.get(0): </b><br> <%=memberList.get(0) %> <br><br>
	
	<table border="1">
		<tr>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>age</th>
			<th>gender</th>
			<th>email</th>
			<th>regdate</th>
		</tr>
			
			<%
				// while(memberList./*다음이 없을 때까지*/) { while은 필요 없었네!?!??!

					for(int i = 0; i < memberList.size(); i++){
						// memberList 0번 박스부터 ~1, 2,,, list 사이즈 만큼 반복할거다
						// memberList 까면 -> MemberBean 들어있고 이거 까면 -> id, pw, ,, 낱개들이 나온다!! 
						MemberBean mb = new MemberBean();
						mb = memberList.get(i); 
						// memberList에 있던 멤버빈 필통 순서대로 하나씩 꺼내서 -> 멤버빈 타입 mb(빈 필통)에 저장
						// 그 다음, mb 필통 열고 -> get으로 낱개 하나씩 화면에 출력
						
						%>
						<tr>
							<td><%=mb.getId()%> </td>
							<td><%=mb.getPw()%> </td>
							<td><%=mb.getName()%> </td>
							<td><%=mb.getAge()%> </td>
							<td align="center"><%=mb.getGender()%> </td>
							<td><%=mb.getEmail()%> </td>
							<td><%=mb.getRegdate()%> </td>
						</tr>
						<%
					} // for
			%> 
	</table>
</body>
</html>