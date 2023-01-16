<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String btitle = request.getParameter("btitle");
	String bwriter = "작성자";
	String bcontent = request.getParameter("bcontent");
	
	int result = BoardDAO.insert(btitle, bwriter, bcontent);
%>
