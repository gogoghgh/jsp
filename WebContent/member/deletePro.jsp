<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/deletePro.jsp</title>
</head>
<body>
	<h1>member/deletePro.jsp</h1>
	
	<%
		// 로그인 정보 체크
		//    계속 반복되네,, 이것도 메서드로 뽑아낼 수 있지 않을까~~
		String id = (String)session.getAttribute("loginID");
	
		if(id == null){
			%>
			<script type="text/javascript">
				alert("로그인 하고 오세요!!!");
				location.href = "loginForm.jsp";
			</script>
			<%
		}

		
		// form에서 전달된 정보(=pw) 저장
		String pw = request.getParameter("pw");
		
		// DB table에 pw랑 같나? 비교,, select로 가져와서?
		
		// 회원 정보 탈퇴 - DB에 저장된 정보 삭제!!
		MemberDAO dao = new MemberDAO(); // DB 쓸거니까~~ DAO 객체 생성
		
		// 회원 탈퇴 메서드 호출해서 탈퇴 완 -> 메인 페이지로 이동
		int result = dao.deleteMember(id, pw); 
			// id, pw 가지고 가서 이 메서드 실행하면,, 이에 맞는 회원 삭제 처리 해주는 메서드~~~
		
		if(result == 1){
			// + 세션 정보가 남아있네,,??? 로그인 정보도 같이 지워주기 (= 세션값 삭제,, 초기화,,,)
			session.invalidate();
			%>
			<script type="text/javascript">
				alert("회원 탈퇴가 완료되었습니다,, 씨유 어게인🎅👋");
				location.href = "main.jsp";
			</script>
			<%
			
		} else if(result == 0){
			%>
			<script type="text/javascript">
				alert("회원 탈퇴 실패 : 비밀번호 오류 🚨 ");
				history.back();
			</script>
			<%
		} else {// result == -1
			%>
			<script type="text/javascript">
				alert("회원 탈퇴 실패 : 횐 정보 없음 🚨 ");
				history.back();
			</script>
			
			<%
		}
	%>
</body>
</html>