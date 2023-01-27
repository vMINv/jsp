<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<script type="text/javascript">
   var searchRequest = new XMLHttpRequest();
   var registerRequest = new XMLHttpRequest();
   var certificationRequest = new XMLHttpRequest();
   
   function searchFunction() {
      searchRequest.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById('userName').value), true);
      searchRequest.onreadystatechange = searchProcess;
      searchRequest.send(null);
   }
   function searchProcess() {
      var table = document.getElementById('ajaxTable');
      table.innerHTML = "";
      if(searchRequest.readyState == 4 && searchRequest.status == 200) {
         var object = eval('(' + searchRequest.responseText + ')');
         var result = object.result;
         for(var i = 0; i < result.length; i++) {
            var row = table.insertRow(0);
            for(var j = 0; j < result[i].length; j++) {
               var cell = row.insertCell(j);
               cell.innerHTML = result[i][j].value;
            }
         }
      }
   }
   function registerFunction() {
      registerRequest.open("Post", "./UserRegisterServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
         + "&userAge=" + encodeURIComponent(document.getElementById('registerAge').value)
         + "&userGender=" + encodeURIComponent($('input[name=registerGender]:checked').val())
         + "&userEmail=" + encodeURIComponent(document.getElementById('registerEmail').value)
         , true);
      registerRequest.onreadystatechange = registerProcess;
      registerRequest.send(null);
   }
   function registerProcess() {
      if(registerRequest.readyState == 4 && registerRequest.status == 200) {
         var result = registerRequest.responseText;
         if(result != 1) {
            alert('등록에 실패했습니다.');
         } else {
            var userName = document.getElementById('userName');
            var registerName = document.getElementById('registerName');
            var registerAge = document.getElementById('registerAge');
            var registerEmail = document.getElementById('registerEmail');
            userName.value = "";
            registerName.value = "";
            registerAge.value = "";
            registerEmail.value = "";
            searchFunction();
            
            var rphone = document.getElementById('registerPhone');
        	
        	response.sendRedirect("../smsAdv/smsCheck.jsp?msg="+URLEncoder.encode(registerName +" 회원님 홈페이지 가입을 환영합니다.")+"&rphone="+rphone);
        	
         }
      }
   }
   
   function certificationFunction() {
	      var to = document.getElementById('registerEmail');
	      location.href = "userCheck.jsp?to=" + to;
	   }
   window.onload = function() {
      searchFunction();
   }
</script>

<div class="container">
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
    	<input class="form-control me-2" type="search" id="userName" onkeyup="searchFunction()" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-primary" type="submit" onclick="searchFunction();">Search</button>
    </div>
  </div>
</nav>
</div>

<div class="container">
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
        <th scope="col">Gender</th>
        <th scope="col">Email</th>
      </tr>
    </thead>
	<tbody id="ajaxTable">
    </tbody>
</table>
</div>

<div class="container">
   <table class="table">
      <thead>
         <tr>
            <th colspan="2" style="text-align: center;">Register</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td style="text-align: center;">Name</td>
            <td><input class="form-control" type="text" id="registerName"></td>
         </tr>
         <tr>
            <td style="text-align: center;">Age</td>
            <td><input class="form-control" type="text" id="registerAge"></td>
         </tr>
         <tr>
            <td style="text-align: center;">Gender</td>
            <td>
               <div class="form-group" style="text-align: center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-outline-primary">
                        <input type="radio" name="registerGender" value="male">Male
                     </label>
                     <label class="btn btn-outline-primary">
                        <input type="radio" name="registerGender" value="female" checked>Female
                     </label>
                  </div>
               </div>
            </td>
         </tr>
         <tr>
            <td style="text-align: center;">Email</td>
            <td><input class="form-control" type="text" id="registerEmail" size="20">
            <button class="btn btn-outline-primary" onclick="certificationFunction();" type="button">인증</button></td>
         </tr>
         <tr>
            <td style="text-align: center;">Phone Num</td>
            <td><input class="form-control" type="text" id="registerPhone"></td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">S e n d</button></td>
         </tr>
      </tbody>
   </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>