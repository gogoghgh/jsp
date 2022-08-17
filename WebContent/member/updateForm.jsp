<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/updateForm.jsp</title>

</head>
<body>
	<h1>member/updateForm.jsp</h1>
	<h2>회원 정보 수정 페이지</h2>
	<!--
	 
		현재 유저 정보 보여주고 -> 수정할 수 있도록
		DB 동작이 2가지!!
		정보 가져오고 -> 수정하고
				select -> update 
	
	-->
	
	<%
		// 로그인 체크
		// 세션에 로그인 정보 입력되어 있으면~ 로그인 되어있는 회원님쓰
		String id = (String)session.getAttribute("loginID");
		
		if(id == null){ 
			// 세션에 저장된 아이디 정보가 없다 = 로그인 안 한 놈
			System.out.println("로그인 정보 없음 (from updateForm.jsp)");
			
			response.sendRedirect("loginForm.jsp");
		}
		
		// 기존의 회원정보 화면 출력
		// DB에서 select로 가져와야지요?
		// MemberDAO 객체 생성,, DB 쓰니까
		MemberDAO dao = new MemberDAO();
		
		// 회원정보 조회 메서드 호출해서 mb변수에 담기
		MemberBean mb = dao.getMember(id);
		
			// 성별 정보가 없을 때,
			if(mb.getGender()==null){
				mb.setGender("여"); // 기본값 '여'로 설정!! 
									// 혹시 성별 정보 없어도~ 기본값으로 설정해놨으니 ㄱㅊ 에러 안 남
			}
	
	%>
	
	<!-- 로그인 한 상태로 수정 페이지 오면, 기존 정보 딱 보이게! value 안에 현 정보 넣기 -->
	<fieldset>
		<form action="updatePro.jsp" method="post" name="fr" onsubmit="return checkData();">
			아이디: <input type="text" name="id" value="<%=mb.getId()%>" readonly="readonly"> <br> 
																	<!-- disabled="disabled" 얘는 아예 이 태그가 없어지는거라,, 
																		값 넘길거니까 read only로 쓰시오~~ -->
			비번: <input type="password" name="pw" placeholder="비밀번호를 입력하세용🐉"> <br>
														<!-- html5로 바꾸고 하세용 -->
			이름: <input type="text" name="name" value="<%=mb.getName()%>"> <br>
			나이: <input type="text" name="age" value="<%=mb.getAge()%>"> <br>
					<!-- 성별,, 라디오버튼은 어떻게? checked 활용,. if? -->
			성별: 
			<input type="radio" name="gender" value="여"
			<%if(mb.getGender().equals("여")) {   // 성별이 여자면 여자에 checked %>
			checked="checked"
			<%} %>
			> 여 
			
			<input type="radio" name="gender" value="남"
			<%if(mb.getGender().equals("남")) {   // 성별이 냄져면 남에 checked %>
			checked="checked"
			<%} %>
			> 남 <br>
			
				<%-- <input type="radio" name="gender" value="<%=mb.getGender()%>">  <br> --%>
				<!-- 성별이 없을 때는요,,? null일 경우,,  -->
			
			이멜: <input type="text" name="email" value="<%=mb.getEmail()%>"> <br>
<%-- 			가입일: <input type="text" name="regdate" value="<%=mb.getRegdate()%>" readonly="readonly"> <br>  --%>
		<!-- 	회원이 선택할 수 있는 게 아니니까,, -- input에선 그랬지만~ 지금은 수정이니까 ^^ 
				엥 왜 안되지?????????????  
				메시지 org.apache.jasper.JasperException: org.apache.jasper.JasperException: org.apache.jasper.JasperException: 속성 [regdate]에 설정된 문자열 [2022-08-03 00:00:00.0]을(를), 클래스 [java.sql.Timestamp](으)로 변환할 수 없습니다: [PropertyEditorManager에 PropertyEditor가 등록되어 있지 않습니다.]-->
			<hr>
			<input type="submit" value="수정하기🤗">
		</form>
	</fieldset>
	
	<!-- ----------- 자스 공간 ------------ -->
	<script type="text/javascript">
// 	alert("document.fr.pw.value: " + document.fr.pw.value); // 확인하려고 ㅎ
		function checkData(){
			// 폼 태그 -> 비번 태그에 접근해서 
				// 비번 입력 했는지~ 안했는지~~ 체크
			var pw = document.fr.pw.value;
			
			if(pw == "" || pw.length < 1) {  //pw가 공백이거나, 길이 1보다 짧으면,,
				alert("비밀번호를 입력하세요");
				document.fr.pw.focus();
				return false;
			}
			
		}// function checkData() 끝
		
	</script>

</body>
</html>