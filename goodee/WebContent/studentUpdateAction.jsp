<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");	

	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://127.0.0.1:3306/goodee",
			"root",
			"java1004");
	String sql = "update student set name=?, age=?, gender=?, addr=? where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1,name);
	stmt.setInt(2,age);
	stmt.setString(3,gender);
	stmt.setString(4,addr);
	stmt.setInt(5,no);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./studentList.jsp");
%>