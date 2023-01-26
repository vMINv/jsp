<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.net.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//join.jsp 받아오기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String phone = request.getParameter("phone");
	
	//msg, rphone 고객 디비에서 글쓴이 폰 번호 조회
	String rphone = "010-5799-2737";//가정
		
	//boardDAO
//	int result = boardDAO.join(subject, content);
	int result = 1;//가정
	
	if(result==1){
		response.sendRedirect("../smsAdv/smsCheck.jsp?msg="+URLEncoder.encode(name +" 회원님 홈페이지 가입을 환영합니다.")+"&rphone="+rphone);
	} else {
		response.sendRedirect("join.jsp");
	}
%>
