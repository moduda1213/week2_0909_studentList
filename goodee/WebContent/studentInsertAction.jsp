<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8"); //한글
	
	int stNum = Integer.parseInt(request.getParameter("stNum"));
	String stName = request.getParameter("stName");
	int stAge = Integer.parseInt(request.getParameter("stAge"));
	String stGender = request.getParameter("stGender");
	String stAddr = request.getParameter("stAddr");
	
	System.out.println(stNum);
	System.out.println(stName);
	System.out.println(stAge);
	System.out.println(stGender);
	System.out.println(stAddr);
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://127.0.0.1:3306/goodee",
			"root",
			"java1004");
	String sql = "insert into student(no,name,age,gender,addr) values(?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,stNum);
	stmt.setString(2,stName);
	stmt.setInt(3,stAge);
	stmt.setString(4,stGender);
	stmt.setString(5,stAddr);
	System.out.println(stmt +"stmt");
	
	stmt.executeUpdate();
	
	response.sendRedirect("./studentList.jsp");
%>