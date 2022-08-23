<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp3/core_foreach.jsp</title>
</head>
<body>
	<h1>jsp3/core_foreach.jsp</h1>


	<h3>jsp로 1~10 출력해보기</h3>
	<%
		for (int i = 1; i <= 10; i++) {
			out.println(i +" ");
		}
	%>
	
	
	<h3>jstl forEach로 1~10 출력해보기</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		<%-- 얘는 jsp변수니까 못 쓰고 ㅠ <%=i %>
			 var 옵션으로 선언해주기  --%>
		${i } 
	</c:forEach>
	
	<hr>
	
	<h3>1~10 중 홀수만 출력</h3>
	<c:forEach var="i" begin="1" end="10" step="2">
		${i }
	</c:forEach>
	<%-- 
	<c:forEach var="i" begin="1" end="10" step="-1">
					 <!--    JspTagException: 'step' <= 0    
					 		step에 음수는 ㄴㄴ 				-->
		${i }
	</c:forEach> 	--%>
	
	<h3>1~10 중 짝수만 출력 (+if)</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${ i%2 == 0 }">
			${i }
		</c:if>
	</c:forEach>
	
	<hr>
	
	<h2>배열!!</h2>
	
	<h3>JSP로 배열변수 만들어서 출력</h3>
	<%
		String[] strArr = {"abc", "def", "ghi", "jkl", "mno", "pqr", "stu", "vwx", "yzz" };
		
		for(int i=0; i <strArr.length; i++){
			 out.println("strArr["+i+"]: " + strArr[i] + "<br>");
		}
		
		// jstl에서도 쓸 수 있도록 !!!!!영역!!!!에 저장
		pageContext.setAttribute("strArr", strArr);
	%>
	
	<h3>JSTL forEach로 --> jsp 배열 변수 출력</h3>
	EL strArr: ${strArr } <br> <!-- 주솟값 나오고요 -->
	EL strArr[0]: ${strArr[0] } <br> <!-- abc 나옴 -->
		
<%-- 	<c:forEach var="i" begin="0" end="strArr.length" step="1"> 
			jsp 변수 -- jstl에서 못 쓰니까!!ㅠ 
			그럼에도 불구하고,, 접근하게 하려면?
			jsp 배열 변수가 '영역'에 저장되어 있으면 됨!!!!!!! 오호~~  --%>
	
	<%
		// for-each (= 향상된 for문)
		//		for(변수 :배열,컬렉션){ }
						//ㄴ여기서 끄집어내서 
				// 이 변수에 저장
	%>
	
	<c:forEach items="${strArr }">
	
	</c:forEach>
	
	<c:forEach var="str" items="${strArr}"> 
		<!--    items에 배열, 컬렉션 적으면 됨 
		//어딘가에서 가져오는 애들은 다 EL표현식으로!! 
			strArr 배열 '개수'만큼 반복해서 출력됨
			var = "str" 변수에 담아서~~~ str을 출력 
			-->
		💘 ${str }
	</c:forEach>
	
	<hr>
	
	<h3> forTokens </h3>
<!-- 	입력 받은 데이터,, a.b.c.d.e.f.g.hh.ii.qq 
		하나씩 짤라서 쓰고 싶은뎀~~   -->
	<c:forTokens var="tk" items="안녕.하세요.제.이름은.중동.꿈나무.입.니다" delims=".">
		🍰	${tk }
	</c:forTokens>
	
</body>
</html>