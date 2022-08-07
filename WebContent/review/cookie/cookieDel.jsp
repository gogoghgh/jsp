<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>re/cookieDel.jsp</title>
</head>
<body>
	<h1>
		cookieDel.jsp <br> 서버 페이지
	</h1>

	<%
		Cookie[] cookies = request.getCookies();

		// 생성한 쿠키 찾아서, 더이상 사용하지 못하게,, 유효기간을 0으로!!
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("name")) {
					cookies[i].setMaxAge(0);
					System.out.println("서버: 쿠키값 삭제 완");

					// 변경된 쿠키 정보를 다시 클라이언트에게 전달!!
					response.addCookie(cookies[i]);
				} // if
			} // for
		} // if
	%>

	<script type="text/javascript">
		alert("쿠키값 삭제 완");
		location.href = "cookieTest.jsp";
	</script>

</body>
</html>