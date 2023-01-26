<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body class="text-center">
<%@include file="../includes/header.jsp" %>

<div class="container">
<main class="form-signin w-50 m-auto">
  
  <form action="#">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
    <div class="form-floating">
      <input type="text" class="form-control" name="#">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="#">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
  </form>
  
</main>
</div>

<%@include file="../includes/footer.jsp" %>    
</body>
</html>
