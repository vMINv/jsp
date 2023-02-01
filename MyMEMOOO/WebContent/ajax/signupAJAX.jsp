<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<br>
<div class="container">
	<div class="mb-3">
	<input type="text" class="form-control" name="id" id="id" placeholder="아이디" required> 
	</div>
	<fieldset>
	<div class="mb-3">
	<input type="password" class="form-control" name="password" id="password" class="mtop-10" placeholder="패스워드" required>
	</div>
	<div class="mb-3">
	<input type="password" class="form-control" id="passwordCheck" class="mtop-10" placeholder="패스워드 (확인)" required>
	</div>
	</fieldset>
	<div class="mb-3">
	<input type="text" class="form-control" name="name" id="name" placeholder="이름" required> 
	</div>
	<div class="mb-3">
	<button type="submit" id="signin" onclick="signinFunction();" class="form-control btn btn-outline-secondary">회원가입하기</button>
	</div>


<br><br>
<div class="mb-3">
    <label class="form-label">회원 가입 시 MyMEMO의 약관에 동의하신 것으로 간주합니다.</label>
	<button onclick="location.href='main.jsp'" type="submit" class="form-control btn btn-outline-secondary">약관보기</button>
</div>
</div>

<script>
function signinFunction(){
	$.ajax({
		type:"post",
		url:"signupCheckAJAX.jsp",
		data:{id:encodeURIComponent(document.getElementById('id').value),
			  password:encodeURIComponent(document.getElementById('password').value),
			  name:encodeURIComponent(document.getElementById('name').value)
			},
		dataType:"text",
		success:function(data){/* 성공결과 */
			var id = document.getElementById('id');
			var password = document.getElementById('password');
			var passwordCheck = document.getElementById('passwordCheck');
			var name = document.getElementById('name');
			id.value = "";
			password.value = "";
			passwordCheck.value = "";
			name.value = "";
		}
	});
}


//비밀번호 일치 체크 
var password = document.getElementById("password");
var passwordCheck = document.getElementById("passwordCheck");
function validatePassword(){
  if(password.value != passwordCheck.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    passwordCheck.setCustomValidity("Passwords Don't Match"); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    passwordCheck.setCustomValidity(''); 
  }
}
password.onchange = validatePassword;
passwordCheck.onkeyup = validatePassword;
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>