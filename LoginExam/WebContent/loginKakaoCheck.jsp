<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginKakaoCheck.jsp</title>
</head>
<body>
success
<%
	String mname = request.getParameter("mname");
	String memail = request.getParameter("memail");
	String mgender = request.getParameter("mgender");
	
	session.setAttribute("sid", memail);
	String sid = (String)session.getAttribute("sid");
%>
<hr>
<%=mname %><br>
<%=memail %><br>
<%=mgender %>
</body>
</html>