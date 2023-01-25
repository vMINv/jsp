<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="includes/header.jsp" %>
<div id="layoutSidenav_content">
<main>
    <div class="container-fluid px-4">
        <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="sid" name="sid" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="spw" name="spw" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Me</label>
                                            </div>
                                            <a href="javascript:kakaologin()" id="custom-login-btn">
											<center><img src="kakao.png"></center>
											</a>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html">Forgot Password?</a>
                                                <a class="btn btn-primary" href="index.html">Login</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </div>
</main>
<%@ include file="../includes/footer.jsp" %>
</body>
<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//발급받은 키
	Kakao.init("fc7abe9b9479ffa297474094a4964dcf");
	
	function kakaologin(){
		window.Kakao.Auth.login({
			//체크한 항목과 반드시 일치 시키기 
			scope:'profile_nickname, account_email, gender',
			success: function(authObj){window.Kakao.API.request({url:'/v2/user/me',
				success:res => {const kakaoAccount = res.kakao_account;
					location.href='loginCheckKakao.jsp?mname='+kakaoAccount.profile.nickname
												+'&memail='+kakaoAccount.email
												+'&mgender='+kakaoAccount.gender;}
			});
			}
		});
	}
</script>
</html>