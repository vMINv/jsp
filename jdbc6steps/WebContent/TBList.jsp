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
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/univ","root","0000");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}
	
	//Step 4 Create Statement Object
	String sql = "SELECT * FROM student";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//Step 5 Execute(Query VS Update) SQL Query
	ResultSet rset = pstmt.executeQuery();
	//while 반복횟수모를때 vs for 반복횟수알때 
	while(rset.next()){//다음 데이터가 있을 때까지 next
%>

<%=rset.getString("hakbun") %>|
<%=rset.getString("name") %>|
<%=rset.getString("dept") %>|
<%=rset.getString("addr") %><br>

<% 	
	}
	//Step 6 Close Connection
	rset.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>