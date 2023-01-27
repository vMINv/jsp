<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
	<form method="post" name="smsForm" action="smsCheck.jsp">
	    <span>[SMS]</span>
	    전송메세지<br />
	    <textarea name="msg" cols="30" rows="10" style="width:455px;">내용입력</textarea>
	    <br />받는 번호
	    <input type="text" name="rphone" value="011-111-1111"> 예) 011-011-111 , '-' 포함해서 입력.<br>
        <input type="submit" value="전송">
	</form>
</body>
</html>
