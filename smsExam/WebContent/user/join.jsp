<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<%@include file="../includes/header.jsp" %>
<div class="container">
	
	<!-- 메인 -->
	<div class="alert alert-primary" role="alert">
		<h5 class="display-5">Join</h5>
	</div>
	
	<!-- 가입 등록 폼 -->
	<form action="joinCheck.jsp">
		<div class="mb-3">
		  <label class="form-label">ID</label>
		  <input type="text" name="id" class="form-control">
		</div>
		<div class="mb-3">
		  <label class="form-label">Name</label>
		  <input type="text" name="name" class="form-control">
		</div>
		<div class="mb-3">
		  <label class="form-label">Password</label>
		  <input type="text" name="pass" class="form-control">
		</div>
		<div class="mb-3">
		  <label class="form-label">Phone</label>
		  <input type="text" name="phone" class="form-control">
		</div>
		<input type="submit" class="btn btn-primary" value="Submit">
		<input type="reset" class="btn btn-outline-primary" value="Reset">
	</form>
	
</div>
<%@include file="../includes/footer.jsp" %>
</body>
</html>