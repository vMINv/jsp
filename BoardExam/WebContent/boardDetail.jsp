<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail.jsp</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<%
	String bno = request.getParameter("bno");
	BoardDTO board = BoardDAO.getDetail(bno);
%>
<div class="container">
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Title</label>
	  <input type="text" name="btitle" class="form-control" value="<%=board.getBtitle() %>">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">Title</label>
	  <input type="text" name="bwriter" class="form-control" value="<%=board.getBwriter() %>">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">Content</label>
	  <textarea class="form-control" name="bcontent" rows="3"><%=board.getBcontent() %></textarea>
	</div>
	<a href="boardList.jsp" class="btn btn-primary">목록</a>
</div>
</body>
</html>