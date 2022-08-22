<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/jsp3/paramTest.jsp</title>
</head>
<body>
	<h1>review/jsp3/paramTest.jsp</h1>
	
	<form action="paramPro.jsp" method="post">
		아이디: <input type="text" name="id"> <br>
		<hr>
		🥪내가 좋아하는 음식1: <input type="text" name="foods"><br>
		🍰내가 좋아하는 음식2: <input type="text" name="foods"><br>
		<hr>
		<input type="checkbox" name="hobby" value="게임" id="h1"><label for="h1"> 게임🎮  </label>
		<input type="checkbox" name="hobby" value="운동" id="h2"> <label for="h2">운동🏂  </label>
		<input type="checkbox" name="hobby" value="코딩" id="h3"> <label for="h3">코딩🧑‍💻 </label> <br>
		
		<input type="submit" value="전송">
	</form>

</body>
</html>