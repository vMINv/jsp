<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList.jsp</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<div class="container">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Title</th>
      <th scope="col">Writer</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
<%
	ArrayList<BoardDTO> boards = BoardDAO.getList();
	for(BoardDTO board : boards){
%>
    <tr>
      <th scope="row"><%=board.getBno() %></th>
      <td><a href="boardDetail.jsp?bno=<%=board.getBno() %>"><%=board.getBtitle() %></a></td>
      <td><%=board.getBwriter() %></td>
      <td><%=board.getBdate() %></td>
    </tr>
  </tbody>
<%
}
%>
</table>
<a href="boardList.jsp" class="btn btn-primary">등록</a>
</div>
</body>
</html>