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
	<h2>๐ต๏ธโโ๏ธ ํ์ ์ ๋ณด ๋ชฉ๋ก ๐ต๏ธโโ๏ธ</h2>
	
	<%
		// 1. ์๋ฌด๋ ๋ณด๋ฉด ํด๋จ,, ๋ก๊ทธ์ธ ์ฌ๋ถ + ๊ด๋ฆฌ์ ์ฌ๋ถ ์ฒดํฌ
		String id = (String) session.getAttribute("loginID");
		
		if(id == null || !id.equals("admin")) {
			System.out.println("(from memberList.jsp) admin ์๋ ๋ ๋ค์ด์ดใฑ- ์ซ์๋ด์");
			response.sendRedirect("loginForm.jsp");
		}
		
		// DB table์ ์ ์ฅ๋ผ์๋ ํ์ ์ ๋ณด ๋ชจ๋ ์ธ๊ทธ๋ฆฌ ๊ฐ์ ธ์ค๊ธฐ
		// 2. *ํ์ ์ ๋ณด ๊ฐ์ ธ์ค๋ ๊ฑฐ = select 
		//    => DB ์ธ๊ฑฐ๋๊น DAO ๊ฐ์ฒด ์์ฑ
		MemberDAO dao = new MemberDAO();
		
		// 3. *ํ์ ์ ๋ณด ์กฐํ ๋ฉ์๋ getMemberList (๋ฆฌํดํ์: ArrayList<MemberBean> ) ํธ์ถ 
		ArrayList<MemberBean> memberList = dao.getMemberList();
		
		// 4. ํ๋ฉด์ ์ถ๋ ฅํด๋ณด๊ธฐ (ํ ์์์,,)
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
				// while(memberList./*๋ค์์ด ์์ ๋๊น์ง*/) { while์ ํ์ ์์๋ค!?!??!

					for(int i = 0; i < memberList.size(); i++){
						// memberList 0๋ฒ ๋ฐ์ค๋ถํฐ ~1, 2,,, list ์ฌ์ด์ฆ ๋งํผ ๋ฐ๋ณตํ ๊ฑฐ๋ค
						// memberList ๊น๋ฉด -> MemberBean ๋ค์ด์๊ณ  ์ด๊ฑฐ ๊น๋ฉด -> id, pw, ,, ๋ฑ๊ฐ๋ค์ด ๋์จ๋ค!! 
						MemberBean mb = new MemberBean();
						mb = memberList.get(i); 
						// memberList์ ์๋ ๋ฉค๋ฒ๋น ํํต ์์๋๋ก ํ๋์ฉ ๊บผ๋ด์ -> ๋ฉค๋ฒ๋น ํ์ mb(๋น ํํต)์ ์ ์ฅ
						// ๊ทธ ๋ค์, mb ํํต ์ด๊ณ  -> get์ผ๋ก ๋ฑ๊ฐ ํ๋์ฉ ํ๋ฉด์ ์ถ๋ ฅ
						
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