<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jdbc.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String mname = request.getParameter("mname");
	String memail = request.getParameter("memail");
	String mgender = request.getParameter("mgender");
	
	int result = memberDAO.exist(memail);
	
	if(result==0){//디비에 존재 
		out.print("로그인 성공");
	} else {//디비에 없음 
		response.sendRedirect("signupForm.jsp?mname="+mname+"&memail="+memail+"&mgender="+mgender);
	}
	
	
	
	
	
	session.setAttribute("sid", memail);
%>