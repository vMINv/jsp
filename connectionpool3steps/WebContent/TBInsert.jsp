<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>
<%-- <!-- Step 1 Import SQL Packages -->
<%@ page import="java.sql.*" %> --%>

<%
	//한글 처리 
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* //Step 2 Load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException err) {
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	//Step 3 Creare Connection Object
	Connection conn = null;
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/univ","root","0000");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	} */
	
	//Step 4 Create Statement Object
	String hakbun = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String addr = request.getParameter("addr");

	/* String sql ="INSERT student VALUES(?, ?, ?, ?)" ;

	
	PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hakbun);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, addr);
			
	//Step 5 Execute SQL Query
	pstmt.executeUpdate();
	
	//Step 6 Close Connection
	pstmt.close();
	conn.close(); */
	
	int result = StudentDAO.insert(hakbun, name, dept, addr);
	
%>
</body>
</html>