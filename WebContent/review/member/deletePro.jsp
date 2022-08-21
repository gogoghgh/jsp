<%@page import="com.review.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/deletePro.jsp</title>
</head>
<body>
	<h1>review/member/deletePro.jsp</h1>
	
	<%
		// 1. 로그인 여부 체크
		String id = (String) session.getAttribute("loginID");
	
		if (id == null) {
			System.out.println("(from deletePro.jsp) 로그인 안 한 놈 왔다,, 쫓아내자");
			response.sendRedirect("loginForm.jsp");
		}
		
		// 2. deleteForm에서 파라미터로 전달받은 정보 저장 
		//    (자바빈 말고 getPara로 ㅎ)
		String pw = request.getParameter("pw");
		
		// 3. 넘겨받은 pw정보랑 - DB 테이블에 있는 pw랑 같나? select로 가져와서 비교!! 
		//    -> 일치하면 탈퇴시키기(=DB에 저장된 정보 삭제)   ==> 이런건 dao에서!!
		//    어쨌든 DB 건드리니까 DAO 생성
		MemberDAO dao = new MemberDAO();
		
		// 4. 회원 탈퇴 메서드 deleteMember(리턴타입 int) 호출 -> result 변수에 담기
		int result = dao.deleteMember(id, pw);
		
		// 5. 탈퇴 성공 시, 메인 페이지로 이동 (if-else)
		if (result == 1) {
			// + 탈퇴 성공했는데도 세션 정보(loginID)는 남아있어서,, main에 그대로 머무르게 됨,,
			// 세션값 삭제=초기화해주기!! 
			session.invalidate();
			%>
			<script type="text/javascript">
				alert("탈퇴가 완료되었습니다.. ㅂ2ㅂ2.. 행복하세요👼👼👋");
				location.href = "main.jsp";
			</script>
			<%
		} else if (result == 0) {
			%>
			<script type="text/javascript">
				alert("탈퇴 실패: 비번 오류 🕵️‍♀️ ");
				history.back();
			</script>
			<%
		} else { // result == -1
			%>
			<script type="text/javascript">
				alert("탈퇴 실패: 울 회원 아님 🕵️‍♀️ ");
				history.back();
			</script>
			<%
		}
	%>
</body>
</html>