<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 

<% 
	String id = request.getParameter("id"); //id를 받음 
	String password = request.getParameter("password"); //password를 받음 
	
	Connection conn = null; 
	PreparedStatement stmt = null; 
	ResultSet rs = null; 

	try { 
		Context init = new InitialContext(); 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
		conn = ds.getConnection(); 
		
		String sql = "select * from info where id=?"; //id에 대한 정보 전체 출력 
		stmt = conn.prepareStatement(sql); 
		stmt.setString(1, id); 
		rs = stmt.executeQuery(); 
		
		if (rs.next()) {
			if (password.equals(rs.getString("PASSWORD"))) { //입력한 password가 DB에 있는 password가 같으면 
				session.setAttribute("id", id); 
				out.println("<script>"); 
				out.println("location.href='Main.jsp'"); //admin으로 넘김
				out.println("</script>"); 
			} 
		} 
		
		out.println("<script>"); 
		out.println("location.href='login.jsp'"); //실패시 login으로 넘김 
		out.println("</script>"); 
		
	} catch (Exception e) {
			e.printStackTrace(); 
	} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} 
%>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>

