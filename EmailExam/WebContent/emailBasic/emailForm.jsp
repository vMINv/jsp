<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailForm.jsp</title>
</head>
<body>
<form action="emailCheck.jsp" method="post">
<table border="1">
    <tr>
    	<td>
		보내는 사람:<input type="text" name="from">
		</td>
    </tr>
    <tr>
    	<td>
		받는 사람:<input type="text" name="to">
		</td>
    </tr>
    <tr>
    	<td>
		제목:<input type="text" name="subject">
		</td>
    </tr>
    <tr>
    	<td>
		<textarea rows="10" cols="80" name="content"></textarea>
		</td>
    </tr>
    <tr>
    	<td>
		<button type="submit">전송하기</button>
		</td>
    </tr>
</table>
</form>
</body>
</html>