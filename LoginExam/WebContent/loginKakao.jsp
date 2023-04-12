<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginKakao.jsp</title>
</head>
<body>
<a href="javascript:kakaologin()" id="custom-login-btn">
	<img src="kakao.png">
</a>
<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//발급받은 키
	Kakao.init("발급받은 키");
	
	function kakaologin(){
		window.Kakao.Auth.login({
			//체크한 항목과 반드시 일치 시키기 
			scope:'profile_nickname, account_email, gender',
			success: function(authObj){window.Kakao.API.request({url:'/v2/user/me',
				success:res => {const kakaoAccount = res.kakao_account;
					location.href='loginKakaoCheck.jsp?mname='+kakaoAccount.profile.nickname
												+'&memail='+kakaoAccount.email
												+'&mgender='+kakaoAccount.gender;}
			});
			}
		});
	}
</script>
</body>
</html>
