<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ⭐ MIME 타입.. 마임 타입.... 이미지든~ 텍스트든~ 그냥 데이터! 로 인식.. 
    받는 쪽에서 잘 알아볼 수 있도록~~ 
    자바, html로 만들어진 페이지입니다^^ 라고 알려주면
    받는 애들이 그걸 기반으로 읽겠지,,,, 더 편하겠죠-->
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/test1.jsp</title>
</head>
<body>
	<h1>test1.jsp</h1>
	
	// <-- java, js 주석 표시라서...... 
	<br> 본문에 나타남...
	<br> 여기는 html 영역!!
	<%  out.println("<br>"); %>  
		<%-- ㄴ---- "<%  %>" 열고 자바 안에 문자열로 html 태그 쓸 수 있음 --%> 

	<%
		// java, js 주석
		// 안녕하삼 ㅎㅎ
		
		// JSP = java + html(JavaScript)
		// <%  이 안에 자바 적잖아
		// + 거따가 --만 추가하면 주석됨
	%>
	
	<!-- html 주석 -->
	<!-- 안녕하삼? -->
	
	<%-- JSP 주석 --%>
	<%-- 안녕하삼? --%>
	
	<script type="text/javascript">
		// 여 안에 쓰는 건 JavaScript 주석..
		// html, JS 주석만 f12 -> elements에 나오네~
		// 자바는 안 나옴,, 자바는 따로 돌려야 함
		// C:\Users\ITWILL\workspace_JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\JSP6\org\apache\jsp\jsp1
		// 워크스페이스 가서,, 여기 가면 ,,, .java 파일이 보이네염
		// jsp -> java로 변경한 애를 서블릿이라고 부른다,,  서블릿을 컴파일 -> .class -> 얘가 우리 화면으로 보여지는 게 jsp..?
		// jsp -> java로 바뀌어서 웹에서 실행되는 거라면,, 왜 바로 java로 안 만들고?
				// ∵ 자바 특징= 컴파일 언어,, 코드 하나 바꿔도 컴파일을 해야 함 .. 인터프리터 언어가 아님!!~ 바뀐걸 바로 적용할 수 없음,.. 바꿀 때마다 컴파일 실행해야 하니까~~~ 넘 오래 걸리고 구려~~
				// 그런 걸 막기 위해서~ html 처리 할 거는 html로 처리하고 + java로 처리할 건 java로 처리하자~ 이게 jsp ..
	</script>
	
	<%
	//스크립틀릿 : java 코드 작성 영역!!!!
	// 이 안에 적은 거는 컴파일하면 -> 자바가 된다!!
	// 영역 구분이 x <% ,,, 얘네가 다~~ 한 뭉탱이로 이어짐.. 
	
	//int a = 100;  << 얘는... 뭘까요..? 전역X 지역변수임... jspService()라는 메서드 안에 있는^^ 하하...
	
	// 규태샘의 Quiz Time~~~
	// Q. 문자열 배열 생성 -> 데이터 입력, 출력
	String[] array = {"aaa", "bbb", "ccc"};

	for(int i=0; i<array.length; i++){
	%>
		<!-- 	이 안은 누구 영역? html 영역..
			 여 안에 내용이 반복돼서 3번 돌아가네~  -->
		<hr>.. 안녕하세용 🐉
	<%
		System.out.println("System 붙인 array[i]: " + array[i]);
			// ㄴ-- System 있어서 .... 콘솔창에만 출력됨
	} System.out.println("-----------");
	
	
	// System 지우면? 웹 화면에 보임
			// 근데 이걸,, html요소로 넣는 거라서... 
	for(int i=0; i<array.length; i++){
		out.println("<h3> array[i]: " + array[i] + "</h3> <br>"); 
// 		document.out("<br>"); 이렇게 하면 안 됨~~~
	} out.println("----------- <br>");
	out.println("for 완 <hr>");
	out.println("<hr>");
	

	for(int i=0; i<array.length;i++){
	%>
		<h2> <%= array[i] %> </h1> <hr>
	<%
	}
	%>
	
</body>
</html>