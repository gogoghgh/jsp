<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
	<h1>member/updatePro.jsp</h1>
	
	<%
		// 로그인 체크
		// 세션에 로그인 정보 저장되어 있는 울 회원님만^^
		String id = (String)session.getAttribute("loginID");
		
		if(id == null){ 
			// 세션에 저장된 아이디 정보가 없다 = 로그인 안 한 놈
			System.out.println("로그인 정보 없음 (from updatePro.jsp)");
			response.sendRedirect("loginForm.jsp");
		}

		
		// updateForm 에서 수정할! 정보 가져왔으니까, 이거 저장,,해야 함
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 저장 (액션 태그-자바빈 사용해서)
	%>
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		
		<jsp:setProperty property="*" name="mb"/>
		
			
	<%
		// 수정할 데이터 확인
		System.out.println("수정할 데이터: " + mb);
	
		// MemberDAO 만들기~~ (DB 관련이니까)
		MemberDAO dao = new MemberDAO();
		
		// 정보 수정 메서드(이름, 나이, 성별, 이메일)
		dao.updateMember(mb);

		// 수정 끝나면 페이지 이동
	%>		
		<script type="text/javascript">
			alert("정보 수정 완");
			location.href="info.jsp";
		</script>
</body>
</html>