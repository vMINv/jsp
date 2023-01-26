<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
<%@include file="../includes/header.jsp" %>
<div class="container">
	
	<!-- 메인 -->
	<div class="alert alert-primary" role="alert">
		<h5 class="display-5">Board</h5>
	</div>
	
	<!-- 게시물 등록 폼 -->
	<form action="boardCheck.jsp">
		<div class="mb-3">
		  <label class="form-label">Title</label>
		  <input type="text" name="subject" class="form-control">
		</div>
		<div class="mb-3">
		  <label class="form-label">Content</label>
		  <textarea name="content" class="form-control" rows="3"></textarea>
		</div>
		<input type="submit" class="btn btn-primary" value="Submit">
		<input type="reset" class="btn btn-outline-primary" value="Reset">
	</form>
	
</div>
<%@include file="../includes/footer.jsp" %>
</body>
</html>