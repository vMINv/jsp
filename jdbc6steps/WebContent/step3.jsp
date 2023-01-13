<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 Import SQL Packages -->
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//Step 2 Load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException err) {
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	//Step 3 Creare Connection Object
	try {
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","0000");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}
%>
</body>
</html>