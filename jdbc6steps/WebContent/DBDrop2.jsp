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
<%@ include file="dbconnect.inc" %>

<%
	//Step 4 Create Statement Object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test3");
	
	//Step 5 Execute SQL Query
	pstmt.executeUpdate();
%>

<%@ include file="dbclose.inc" %>
</body>
</html>