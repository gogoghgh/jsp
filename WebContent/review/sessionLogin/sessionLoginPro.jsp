<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/sessionLoginPro.jsp</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 넘겨 받은 값들,, 세션에 저장 -> 변수에 대입
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 콘솔에 찍어서 확인
		System.out.println("id: " + id + "  / pw: " + pw);
		
		// 로그인 여부 체크
		// id: admin / pw: 1234
		if(id.equals("admin")){
			if(pw.equals("1234")){
				// id, pw 다 참이면 
				%>
					<script type="text/javascript">
						alert("로그인 성공^^ 메인 페이지로 이동합니다🏍🛵🛴🚲🛹 ");
						location.href = "sessionMain.jsp";
					</script>
				<%
				// -> 세션 영역 객체에 저장하고!(다른 페이지 갈 때도 로그인 정보 남아있도록) 
				session.setAttribute("loginResult", true);
				session.setAttribute("id", id);
				
				// -> sessionMain.jsp 페이지로 이동
// 				response.sendRedirect("sessionMain.jsp");
				// js 알림창 띄우고 싶어서~ js에서 페이지 이동할게염^^ ㅋ
				
			} else {
				// id는 참, pw는 거짓이면
				%>
				<script type="text/javascript">
					alert("비밀번호를 틀리셨습니다😰");
					location.href="sessionLogin.jsp";
				</script>
				<%
			} // if-else(pw)
		} else {
			// id 거짓이면
			%>
			<script type="text/javascript">
				alert("우리 회원님이 아니시네요,,😅");
				location.href = "sessionLogin.jsp";
			</script>
			<%
// 			response.sendRedirect("sessionLogin.jsp"); 
			// 왜,, 알림창 안뜨고 걍 가냐 ㄱ- 
			// 아!! 우선순위가 js< jsp 코드 얘가 더 높아서!!1
		} //if-else(id)
	%>
	
</body>
</html>