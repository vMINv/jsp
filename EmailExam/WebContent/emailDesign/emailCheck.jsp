<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, smtp.*"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<%
	request.setCharacterEncoding("UTF-8");

	Map<String, String> emailInfo = new HashMap<String, String>();
	emailInfo.put("from", request.getParameter("from"));//보내는 사람 변경 불가, 반드시 본인의 네이버 메일주소 
	emailInfo.put("to", request.getParameter("to"));//받는 사람 
	emailInfo.put("subject", request.getParameter("subject"));//제목 
//	emailInfo.put("content", request.getParameter("content"));//내용
	
//	emailInfo.put("format", "text/plain;charset=UTF-8");//메일의 형식 설정 일단 text로 고정 
	
	String format = request.getParameter("format");
	String content = request.getParameter("content");
	
	if(format.equals("text")){//TEXT
		emailInfo.put("content", request.getParameter("content"));//내용
		emailInfo.put("format", "text/plain;charset=UTF-8");//메일의 형식 설정 일단 text로 고정 
	} else if(format.equals("html")){//HTML
		content = content.replace("\r\n", "<br/>");
		String htmlContent = "";
		
		String templatePath = application.getRealPath("/emailDesign/emailDesign.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while((oneLine = br.readLine()) != null ){
			htmlContent += oneLine + "\n";
		}
		br.close();
		
		htmlContent = htmlContent.replace("__CONTENT__", content);
		
		emailInfo.put("content", htmlContent);//내용
		emailInfo.put("format", "text/html;charset=UTF-8");//메일의 형식 설정 일단 text로 고정 
	}
	
	try {
		NaverSMTP smtpServer = new NaverSMTP();//메일 전송 객체 생성 
		smtpServer.emailSending(emailInfo);
%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">이메일 전송 결과</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      메일 발송 성공
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		
<%	} catch(Exception e) {%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">이메일 전송 결과</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      메일 발송 실패
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		
<%		e.printStackTrace();
	}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#exampleModal").modal("show");
	});
</script>
