<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 Import SQL Packages -->
<%@ page import="java.sql.*" %>
<%@ page import="jdbc6steps.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//Step 2,3
	Connection conn = dbconnclose.getConnection();

	//Step 4 Create Statement Object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test3");
	
	//Step 5 Execute SQL Query
	pstmt.executeUpdate();
	
	//Step 6
	dbconnclose.closeConnection(pstmt, conn);
%>

</body>
</html>