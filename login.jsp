<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>로그인</title> 
</head> 
<body> 
<form action="loginProcess.jsp" name="login"> 
	<table align="center" border="1"> 
		<tr> 
			<td colspan="2" align="center" style="font-weight: bold; font-size: 25px">로그인 페이지</td> 
		</tr> 
		<tr> 
			<td>아이디</td> 
			<td><input type="text" id="id" name="id" /></td> 
		</tr> 
		<tr> 
			<td>비밀번호</td> 
			<td><input type="password" id="password" name="password" /></td> 
		</tr> 
		<tr> 
		<td colspan="2" align="center"><a href="javascript:login.submit()">로그인</a> &nbsp;&nbsp; 
			<a href="joinForm.jsp">회원가입</a></td> 
		</tr> 
	</table> 
</form> 
</body> 
</html>

