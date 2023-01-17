<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String mname = request.getParameter("mname");
	String mid = request.getParameter("mid");
	String mpass = request.getParameter("mpass");
	String mgender = request.getParameter("mgender");
	String memail = request.getParameter("memail");
	
	int result = memberDAO.insert(mname, mid, mpass, mgender, memail);
	
	if(result==0){
		response.sendRedirect("signupForm.jsp");
	} else{
		response.sendRedirect("loginForm.jsp");
	}
%>