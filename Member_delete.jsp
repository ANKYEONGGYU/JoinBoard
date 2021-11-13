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
	String delete_id = request.getParameter("id"); 
	
	Connection conn = null; 
	PreparedStatement stmt = null; 
	ResultSet rs = null; 

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
		conn = ds.getConnection(); 
		String sql = "delete from info where id=?"; 
		stmt = conn.prepareStatement(sql); 
		stmt.setString(1, delete_id); 
		stmt.executeQuery(); 
		out.println("<script>"); 
		out.println("location.href='Member_list.jsp'"); 
		out.println("</script>"); 
	} catch (Exception e) {
		e.printStackTrace(); 
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace(); 
			}
		} 
%> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>정보 삭제</title>
</head> 
<body> 
</body> 
</html>

