<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 Import SQL Packages -->
<%@ page import="java.sql.*" %>

<%
	//한글 처리 
	request.setCharacterEncoding("utf-8");

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
	String hakbun = request.getParameter("hakbun");
	String sql = "SELECT * FROM student WHERE hakbun=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, hakbun);
	
	//Step 5 Execute(Query VS Update) SQL Query
	ResultSet rset = pstmt.executeQuery();
	
	//디비에서 학번에 해당하는 자료가 있어서 반환되었는지 확인
	if(!rset.isBeforeFirst()) {//없으면
		out.print("<script>alert('해당 학번은 존재하지 않습니다.');"
				+"history.back();"
				+"</script>");
		return;
	}
	rset.next();//있으면 다음 자료
	String dbhakbun = rset.getString("hakbun");
	String dbname = rset.getString("name");
	
	//dbhakbun hakbun 같으면 session 생성
	if(dbhakbun.equals(hakbun)) {//문자열 비교 
	    session.setAttribute("hakbun", dbhakbun); 
	    session.setAttribute("name", dbname); 
	    
	    out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.<br>");
	}
	
	//Step 6 Close Connection
	rset.close();
	pstmt.close();
	conn.close();
%>
