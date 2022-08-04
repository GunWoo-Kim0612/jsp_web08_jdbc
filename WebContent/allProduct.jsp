<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url =  "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "scott";
	String pass = "tiger";
	String sql = "SELECT * FROM product";
	
%>

<table style="width: 800" border="1">
	<tr>
		<th>name</th>
		<th>id</th>
		<th>unitPrice</th>
		<th>description</th>
		<th>category</th>
	</tr>
	
	<% 
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>" + rs.getString("p_id") + "</td>");
		
				out.println("<td>" + rs.getString("p_name") + "</td>");
				//db 열이름 unt 으로 오타났는데 그냥 써..
				out.println("<td>" + rs.getString("p_untPrice") + "</td>");
				out.println("<td>" + rs.getString("p_description") + "</td>");
				out.println("<td>" + rs.getString("p_category") + "</td>");
				out.println("</tr>");
				
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if ( rs!=null) 
					rs.close();
				if (stmt != null)
					stmt.close();
				if( conn!= null)
					conn.close();
			}catch (Exception e){
				e.printStackTrace();	
			}
		}
	%>
</table>
</body>
</html>