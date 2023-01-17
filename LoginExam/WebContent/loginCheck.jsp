<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String mid = request.getParameter("mid");
	String mpass = request.getParameter("mpass");
	
	int result = memberDAO.login(mid, mpass);
	
	if(result==0){
		session.setAttribute("mid", mid);
		response.sendRedirect("main.jsp");
	} else if(result==1){
		response.sendRedirect("signupForm.jsp");
	} else{
		response.sendRedirect("loginForm.jsp");
	}
%>