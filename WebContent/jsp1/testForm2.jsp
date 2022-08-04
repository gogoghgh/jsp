<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/testForm2.jsp</title>
</head>
<body>
	<h1>testForm2.jsp</h1>
	
	<h2>폼 태그 이름, 나이정보를 testPro2.jsp 페이지로 전달 </h2>
	<form action="testPro2.jsp" method="get">
		이름: <input type="text" name="name"> <br>
		나이: <input type="number" name="age"> <br>
		<hr>
		성별: <input type="radio" name="gender" value="여"> 여
		     <input type="radio" name="gender" value="남"> 남
		<hr>
		취미: <input type="checkbox" name="hobby" value="겜" id="h1"> <label for="h1"> 게임 </label> 
		 <input type="checkbox" name="hobby" value="운동" id="h2"> <label for="h2"> 운동 </label>
		<input type="checkbox" name="hobby" value="영화" id="h3"> <label for="h3"> 영화 </label>
		<hr>
		강의장: 
			<select name="room">
				<option>강의장을 선택하시오 </option>
				<option value="1"> 1강의장 </option>
				<option value="2"> 2강의장 </option>
				<option value="3"> 3강의장 </option>
				<option value="4"> 4강의장 </option>
				<option value="5"> 5강의장 </option>
				<option value="6"> 6강의장 </option>
			</select>
		
		<input type="submit" value="제출합니다.. 받아주세요"> 
	</form>
	
</body>
</html>