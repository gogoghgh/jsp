<%@page import="com.review.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/updatePro.jsp</title>
</head>
<body>
	<h1>review/member/updatePro.jsp</h1>

	<%
		// 로그인 유효성 체크
		String id = (String) session.getAttribute("loginID");

		if (id == null) {
			System.out.println("(from updatePro.jsp) 로그인 안 한 놈 왔다,,");
			response.sendRedirect("loginForm.jsp");
		}

		// update 작업 시작
		// updateForm.jsp에서 수정할!! 정보 파라미터로 받아왔고~ 
		// 이거 저장해야 함,, 액션태그 자바빈 쓰자
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="mb" class="com.review.member.MemberBean" />
	<jsp:setProperty property="*" name="mb" />

	<%
		// 수정할 데이터 확인
		System.out.println("(from updatePro.jsp) 수정할 데이터: " + mb);

		// DB 테이블에 데이터 수정,, DB 데이터 건드리니까 DAO 생성
		MemberDAO dao = new MemberDAO();

		// 회원 정보(이름, 나이, 성별, 이메일) 수정하는 updateMember 메서드 호출 
		int result = dao.updateMember(mb);

		// 수정 끝났으면 메인 페이지로 이동
		if (result == 1) {
			// 정상 수정 완
			%>
				<script type="text/javascript">
					alert("정보 수정 완^^");
					location.href = "main.jsp";
				</script>
			<%
		} else if (result == 0) {
			// 비번 틀림,,
			%>
				<script type="text/javascript">
					alert("수정 실패,, 비밀번호 틀리셨삼 😥");
					history.back();
				</script>
			<%
		} else {
			// result==-1,, 비회원이네
					// 근데 이런 상황 거의 없긴 함~ 
					// 위쪽에서 로그인 여부 체크하고 넘어온 거니까
			%>
				<script type="text/javascript">
					alert("수정 실패,, 아이디 정보 없음 😰 😥");
					history.back();
				</script>
			<%
		}
	%>
</body>
</html>