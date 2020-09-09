<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentUpdateForm</title>
</head>
<body>
	<table border="1">
      <tr>
         <td><a href="./index.jsp">Home</a></td>
         <td><a href="./studentList.jsp">학생 리스트</a></td>
      </tr>   
   </table>
   
   <%
   		int no = Integer.parseInt(request.getParameter("stNum"));
	   	Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/goodee",
				"root",
				"java1004");
		
		String sql = "select * from student where no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,no);
		ResultSet rs = stmt.executeQuery();
		
		String name = "";
		int age = 0;
		String gender ="";
		String addr="";
		
		if(rs.next()){
			name = rs.getString("name");
			age = rs.getInt("age");
			gender = rs.getString("gender");
			addr = rs.getString("addr");
		}
   %>
   
   <form action="./studentUpdateAction.jsp" method="post">
      <table border="1">
         <tr>
            <th>번호</th>
            <td><input type="text" name="no" value ="<%=no %>"></td>
            
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" name="name" value ="<%=name %>"></td>
         </tr>
         <tr>
            <th>나이</th>
            <td><input type="text" name="age" value ="<%=age %>"></td>
         </tr>
         <tr>
            <th>성별</th>
            <td>
            	<%
            		if(gender.equals("남")){
            	%>	
            			 <input type="radio" name="gender" value="남" checked ="checked">
            			 <input type="radio" name="gender" value="여">
            	<%
            		}else{
            	%>
            			 <input type="radio" name="gender" value="남">
            			 <input type="radio" name="gender" value="여" checked ="checked">
            	<%
            		}
            	%>
            </td>
         </tr>
         <tr>
            <th>주소</th>
            <td><input type="text" name="addr" value ="<%=addr %>"></td>
         </tr>
      </table>
      <button type="submit">추가</button>
   </form>
</body>
</html>