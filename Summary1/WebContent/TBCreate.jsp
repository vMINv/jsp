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
	Connection conn = null;
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/summary","root","0000");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}
	
	//Step 4 Create Statement Object
	String sql = "CREATE TABLE `smember` ("
				  +"`sno` int NOT NULL AUTO_INCREMENT,"
				  +"`sname` varchar(50) DEFAULT NULL,"
				  +"`sid` varchar(50) DEFAULT NULL,"
				  +"`sw` varchar(50) DEFAULT NULL,"
				  +"`sgender` varchar(50) DEFAULT NULL,"
				  +"`semail` varchar(50) DEFAULT NULL,"
				  +"`sfile` varchar(50) DEFAULT NULL,"
				  +"`sjoindate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,"
			 	  +"PRIMARY KEY (`sno`))";
			
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//Step 5 Execute SQL Query
	pstmt.executeUpdate();
	
	//Step 6 Close Connection
	pstmt.close();
	conn.close();
%>
</body>
</html>