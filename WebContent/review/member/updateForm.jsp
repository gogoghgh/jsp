<%@page import="com.review.member.MemberBean"%>
<%@page import="com.review.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/member/updateForm.jsp</title>
</head>
<body>
	<h1>review/member/updateForm.jsp</h1>
	<h2>회원 정보 수정 페이지</h2>
	<!-- 
	 DB 동작이 2가지!! 
	 현재 유저 정보 가져와서 보여주기(select)  + 수정하기 (update) 
	 -->
	
	<%
		// 로그인 체크
		String id = (String)session.getAttribute("loginID");
		
		if(id==null){
			// 세션에 저장된 아이디 정보가 없다?? 로그인 안 한 놈이네~~
			System.out.println("(from updateForm.jsp) 로그인 정보 없음");
			response.sendRedirect("loginForm.jsp");
		}
		
		// 기존 회원 정보 화면 출력 (select)
		// DB에서 가져와야 하네,, DB 쓰니까 DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 회원 정보 조회 메서드(리턴타입이 멤버빈) 호출해서 -> mb 변수에 담기
		MemberBean mb = dao.getMemberInfo(id);
		
			// 성별 정보 없을 때,, 
			if(mb.getGender() == null){
				mb.setGender("여"); // 성별 기본값 "여"로 설정~~
			}
	%>
	
	<!-- 로그인 한 상태로 수정 페이지 오면, 기존 정보 딱 보이게!! 
		 select해서 가져온 정보(getMemberInfo 메서드) -> value 안에 넣기   -->
	
	<fieldset>
		<form action="updatePro.jsp" method="post" name="fr" onsubmit="return checkData()"> 
																<!-- return 붙여줘야,, pro페이지로 바로 안 넘어가네? -->
			아이디: <input type="text" name="id" value="<%=mb.getId() %>" readonly="readonly"> <br>
			비번: <input type="password" name="pw" placeholder="비밀번호를 입력해주세용🐉"> <br>
			이름: <input type="text" name="name" value="<%=mb.getName() %>"> <br>
			나이: <input type="text" name="age" value="<%=mb.getAge() %>"> <br>
			성별: <input type="radio" name="gender" value="여" id="xx" 
				<% if(mb.getGender().equals("여")){  %>
					checked="checked"
				<% } %>
				><label for="xx">여</label>
				<input type="radio" name="gender" value="남" id="xy"
				<% if(mb.getGender().equals("남")){ %>
					checked="checked"
				<% } %>
				><label for="xy">남</label> <br> 
				<!-- 근데 성별이 null일 경우엔,,?! 오류나넴,,, 
				     null값 ㅇㅋ라서,, 성별 null일 수도 있는뎀,, 위로 가서 처리 -->
				
			이멜: <input type="text" name="email" value="<%=mb.getEmail() %>"> <br>
			<%-- 가입일: <input type="date" name="regdate" value="<%=mb.getRegdate()%>" readonly="readonly"> <br> --%> 
			<!--      회원이 선택할 수 있는 게 아니니까,, 하지만 함 해보자 ㅋ 
				역쉬~~ 안 됨
				속성 [regdate]에 설정된 문자열 [2022-08-07 21:48:48.0]을(를), 클래스 [java.sql.Timestamp](으)로 변환할 수 없습니다
				regdate를 여기서는 String으로 넘기는데,,, 멤버빈에서는 String이 아니라 Timestamp로 인식하니까!!!! 
			-->
			<hr>
			<input type="submit" value="나의 정보 수정하기🤗">
		</form>
	</fieldset>
	
	<!-- ---------------------자스 공간---------------------------- -->
	<script type="text/javascript">
		function checkData(){
			// 폼 태그 -> 비번 태그에 접근해서, 비번 입력 했나 안했나 체크하는 함수
			var pw = document.fr.pw.value;
			
			if(pw=="" || pw.length < 1){
				// pw가 공백이거나, 길이 1보다 짧으면,,, = pw 입력 X
				alert("비번을 입력하세요 🤫")
				document.fr.pw.focus();
				return false;
			}//if
		}//checkData()
	
	</script>
	
</body>
</html>