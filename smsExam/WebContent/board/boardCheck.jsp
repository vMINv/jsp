<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.net.*"
    %>
<%
	request.setCharacterEncoding("UTF-8");

	//board.jsp 받아오기
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//boardDAO
//	int result = boardDAO.insert(subject, content);
	int result = 1;//가정
	
	//msg, rphone 고객 디비에서 글쓴이 폰 번호 조회
	String rphone = "010-5799-2737";//가정
	
	if(result==1){
		response.sendRedirect("../smsAdv/smsCheck.jsp?msg="+URLEncoder.encode(subject)+"&rphone="+rphone);
	} else {
 		response.sendRedirect("board.jsp");
	}
%>
