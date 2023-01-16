<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
<%
	String hakbun = request.getParameter("hakbun");
	StudentDTO student = StudentDAO.getDetail(hakbun);
%>

<%=student.getHakbun() %>|
<%=student.getName() %>|
<%=student.getDept() %>|
<%=student.getAddr() %><br>

</body>
</html>