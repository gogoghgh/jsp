<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/sessionLoginPro.jsp</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	
	<% 
		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. 폼에서 전달된 파라미터 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
			// 값 잘 받았나 확인하기!! 콘솔창에
		System.out.println("전달된 정보: " + id + " / " + pw);
		
	
		// 2. 전달받은 값들이랑 같은지 다른지 비교  admin/1234
// 		if (id == "admin") { // 문자열 비교니까~~~,, (참조형 데이터 타입)
		if(id.equals("admin")){
			// 참 = 아이디가 있다
			if(pw.equals("1234")){
				// 회원 -> 로그인 성공!
				out.println("로그인 성공💘🎇 ");
				// -> 매 페이지 갈 때마다 로그인 정보 남아있도록,, 세션 영역 객체에 저장
				session.setAttribute("id", id);
				session.setAttribute("loginResult", true); //이런 방법도 ㅇㅋ
				
				// 문제 없으니, 메인페이지로 이동
				response.sendRedirect("sessionMain.jsp");
				
			} else {
				// 아이디는 참, 비밀번호는 다름
				out.println("비밀번호 틀리셨음"); %>
				<script type="text/javascript">
					alert("비밀번호 틀리셨삼");
				</script>
				<%
				// 문제 있으니, 로그인 페이지로 이동
				response.sendRedirect("sessionLogin.jsp");

			} //안에 if-else
		} else {
			// 거짓 = 아이디 없다
			out.println("울 회원님이 아니시네요,,,");
			%>
			<script type="text/javascript">
				alert("울 회원님이 아니시네요,.,");
			</script>
			<%
		} //밖에 if-else
	
	%>
	
</body>
</html>