<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 
<%
	//String id = null;
if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
	out.println("<script>");
	out.println("location.href='login.jsp'");
	out.println("</script>");
	}
	Connection conn = null; 
	PreparedStatement stmt = null; 
	ResultSet rs = null; 
	try {
		Context init = new InitialContext(); 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
		conn = ds.getConnection(); 
		String sql = "select * from info"; 
		stmt = conn.prepareStatement(sql); 
		rs = stmt.executeQuery(); 
		}
	catch (Exception e) {
		e.printStackTrace();
		}
%> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>관리자 모드</title> 
</head> 
<body> 
<table> 
	<tr> 
		<td colspan="2">회원 목록</td> 
	</tr> 
<%
	while (rs.next()) { 
%> 
	<tr> 
		<td><a href="member_info.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("id")%></a></td> 
		<td><a href="Member_delete.jsp?id=<%=rs.getString("id")%>">삭제</a></td> 
	</tr> 
<% } %> 
</table> 
</body> 
</html>

