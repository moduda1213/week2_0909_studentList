<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentInsertForm</title>
</head>
<body>
	<h1>학생 정보 입력</h1>
	<a href="./index.jsp">메인으로</a>
	<a href="./studentList.jsp">학생 목록으로</a>
	
	<form method = "post" action = "./studentInsertAction.jsp">
		<div>번호 : <input type = "text" name = "stNum"></div>
		<div>이름 : <input type = "text" name = "stName"></div>
		<div>나이 : <input type = "text" name = "stAge"></div>
		<div>성별 : <input type = "text" name = "stGender"></div>
		<div>주소 : <input type = "text" name = "stAddr"></div>
		<button type ="submit">등록</button>
	</form>
</body>
</html>