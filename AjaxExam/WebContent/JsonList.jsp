<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="user.*"%>
<%
	out.print((new UserDAO()).getListJSON());
%>