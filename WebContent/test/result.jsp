<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test/result.jsp</title>
</head>
<body>
	<h1>result.jsp</h1>

	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 값들 받아서 변수에 저장
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 콘솔에 찍어서 잘 들어왔나 확인
		System.out.println("name: " + name + " / id: " + id + " / pw: " + pw);
		
		// 아이디가 collb 아닐 때는 -> '사용자를 찾을 수 없습니다' alert + 페이지 이동 X
		if (id.equals("collb")){
			// 아이디 일치 시, 비번 if 로 들어가서
				if (pw.equals("1234")){ // 비번도 참? 
						// 로그인 성공
						out.println("<h2>" + id+"님 환영합니다🤗💘 </h2>"); %>
						<br>
						이름: <%=name %> <br>
						아이디: <%=id %> <br>
						비밀번호: <%=pw %> <br>
						<%
				} // if(pw)
				else { // 비번 틀렸을 시 js 알림창
					%> 
					<script type="text/javascript">
						alert("비밀번호가 일치하지 않습니다..");
						location.href="input.jsp";
					</script>
					<%
				} // else(pw)
		} else { // 아이디 불일치 시 js 알림창
			%>
			<script type="text/javascript">
				alert("사용자를 찾을 수 없습니다..");
				location.href="input.jsp";
			</script>
			<%
		} // if(id)
	%>

</body>
</html>