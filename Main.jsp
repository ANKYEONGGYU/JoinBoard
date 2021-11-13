<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 

<% 
	String id = null; 
	if (session.getAttribute("id") != null) { //id가 존재할 때 
		id = (String) session.getAttribute("id");
	} else { //id가 존재하지 않을 때 
		out.println("<script>"); 
		out.println("location.href='login.jsp'"); 
		out.println("</script>");
	} 
%> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>관리자 메인 페이지</title> 
</head> 
<body> 
	<!-- 모든 사용자 정보 출력 / 정보 삭제 --> 
	<h3><%=id%>님이 로그인하셨습니다 </h3> 
	<% 
		if (id.equals("admin")) {
	%> 
		<a href="Member_list.jsp">관리자모드 접속</a> 
	
	<% } %> 
</body> 
</html>
