<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="javax.sql.*"%> 
<%@ page import="javax.naming.*"%> 

<html> 
<% 
	request.setCharacterEncoding("utf-8"); 
	
	Connection conn = null; 
	PreparedStatement stmt = null; //register에서 입력한 정보들을 받음 

	String id = request.getParameter("id"); 
	String password = request.getParameter("password"); 
	String mail = request.getParameter("mail"); 	
	String name = request.getParameter("name"); 
	String id_num = request.getParameter("id_num"); 
	String id_num_back = request.getParameter("id_num_back"); 	
	String year = request.getParameter("year"); 
	String month = request.getParameter("month"); 
	String day = request.getParameter("date"); 	
	String[] hobby = request.getParameterValues("hobby"); 
	String intro = request.getParameter("intro"); 
	StringBuffer hobbies = new StringBuffer(); //배열을 하나의 String으로 보냄 
	
	for (String s : hobby) { //배열을 하나의 String으로 합침 
		hobbies.append(s).append(" "); 
	}
	try {
		Context init = new InitialContext(); 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		String sql = "INSERT INTO info(id, password, mail, name, id_num, id_num_back, year, month, day, hobby, intro) VALUES(?,?,?,?,?,?,?,?,?,?,?)"; 
		stmt = conn.prepareStatement(sql); //DB에 저장 
		stmt.setString(1, id); 
		stmt.setString(2, password); 
		stmt.setString(3, mail); 
		stmt.setString(4, name); 
		stmt.setString(5, id_num); 
		stmt.setString(6, id_num_back); 
		stmt.setString(7, year); 
		stmt.setString(8, month); 
		stmt.setString(9, day); 
		stmt.setString(10, hobbies.toString()); 
		stmt.setString(11, intro); 
		
		int result = stmt.executeUpdate(); 
		
		if (result != 0) {
			out.println("<script>"); 
			out.println("location.href='login.jsp'"); 
			out.println("</script>");
		} else {
			out.println("<script>"); 
			out.println("location.href='joinForm.jsp'"); 
			out.println("</script>"); 
		} 
		
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
<title>
</title> 
</head> 
<body> 
<%=hobby %>
</body> 
</html>