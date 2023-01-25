<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jdbc.UserDAO, java.util.*, smtp.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedReader"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
   
<%

	request.setCharacterEncoding("utf-8"); //한글 처리


	String to = request.getParameter("to");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	Map<String, String> emailInfo = new HashMap<String, String>();
	emailInfo.put("from", "hyunmin1998@naver.com");
	emailInfo.put("to", request.getParameter("to"));
	emailInfo.put("subject", "회원가입을 환영합니다.");

	content = content.replace("\r\n", "<br/>");
	String htmlContent = "";
	
	String templatePath = application.getRealPath("Welcome.html");
	BufferedReader br = new BufferedReader(new FileReader(templatePath));
	
	String oneLine;
	while((oneLine = br.readLine()) != null ){
		htmlContent += oneLine + "\n";
	}
	br.close();
	
	htmlContent = htmlContent.replace("__NAME__", name);
	htmlContent = htmlContent.replace("__TO__", to);
	htmlContent = htmlContent.replace("__PASS__", pass);
	
	emailInfo.put("content", htmlContent);//내용
	emailInfo.put("format", "text/html;charset=UTF-8");//메일의 형식
	
	NaverSMTP smtpServer = new NaverSMTP();//메일 전송 객체 생성 
	smtpServer.emailSending(emailInfo);
	
	int result = UserDAO.join(to, pass, name, content);

	
	//회원 가입 성공시 모달 창으로 "회원 가입 완료", "축하합니다."
	
	//회원 가입 실패시 모달 창으로 "회원 가입 실패", "다시 시도하세요"
	
	if(result == 1){
%>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 가입 성공</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        회원 가입을 축하합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$("#exampleModal").modal("show");
	});
</script>






<% 
	} else {
%>
		
		<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 가입 실패</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        회원 가입에 실패하였습니다. 다시 시도하세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$("#exampleModal2").modal("show");
	});
</script>

		
		
<% 		
	}
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>