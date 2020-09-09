<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentList</title>
</head>
<body>
	<h1>구디 오픈 플랫폼 핀테크 자바 학생 목록</h1>
	<a href="./index.jsp">메인으로</a>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/goodee",
				"root",
				"java1004");
		System.out.println(conn +"<- conn");//확인
		String sql = "select no,name,age,gender,addr from student";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	%>
	<a href="./studentInsertForm.jsp">학생 정보 입력</a>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>주소</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				while(rs.next()){
			%>
					<tr>
						<td><%=rs.getInt("no") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getInt("age") %></td>
						<td><%=rs.getString("gender") %></td>
						<td><%=rs.getString("addr") %></td>
						<td><a href="./studentUpdateForm.jsp?stNum=<%=rs.getInt("no") %>">수정</a></td>
						<td><a href = "./studentDeleteAction.jsp?stNum=<%=rs.getInt("no") %> ">삭제</a></td>
					</tr>
			<%
				}
			%>
			<tr>
		</tbody>
	</table>
</body>
</html>