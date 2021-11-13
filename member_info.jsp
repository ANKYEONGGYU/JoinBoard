<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 

<% 
	String id = null; 
	
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='login.jsp'");
		out.println("</script>");
		} 
	String info_id = request.getParameter("id");
	Connection conn = null; 
	PreparedStatement stmt = null; 
	ResultSet rs = null; 
	try { 
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
		conn = ds.getConnection(); 
		String sql = "select * from info where id=?"; 
		stmt = conn.prepareStatement(sql); 
		stmt.setString(1, info_id); 
		rs = stmt.executeQuery(); 
		rs.next(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>회원 정보 보여주기</title> 
</head> 
<body> 
<table> 
	<tr> 
		<td>아이디</td>
		<td><%=rs.getString("id")%></td> 
	</tr> 
	<tr> 
		<td>비밀번호</td>
		<td><%=rs.getString("password")%></td> 
	</tr> 
	<tr> 
		<td>이메일</td> 
		<td><%=rs.getString("mail")%></td> 
	</tr> 
	<tr> 
		<td>주민등록번호</td> 
		<td><%=rs.getString("id_num")%> - <%=rs.getString("id_num_back")%> </td>
	</tr> 
	<tr> 
		<td>생일</td> 
		<td><%=rs.getString("year")%>년 <%=rs.getString("month")%>월 <%=rs.getString("day")%>일</td> 
	</tr> 
	<tr> 
		<td>취미</td> 
		<td><%=rs.getString("hobby")%></td> 
	</tr> 
	<tr> 
		<td>자기 소개</td> 
		<td><%=rs.getString("intro")%></td> 
	</tr> 
</table> 
</body> 
</html>

