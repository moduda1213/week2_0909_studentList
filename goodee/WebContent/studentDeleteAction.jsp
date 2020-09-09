<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	int stNum = Integer.parseInt(request.getParameter("stNum"));
	
	System.out.println(stNum);
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://127.0.0.1:3306/goodee",
			"root",
			"java1004");
	String sql = "delete from student where	no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,stNum);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./studentList.jsp");
%>
