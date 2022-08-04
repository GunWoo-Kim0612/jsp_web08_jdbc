<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!-- 커넥션 풀 방식의경우 추가 -->
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	//쿼리문이 실행되는 시점에 ?에 값이 들어감
	String sql = "INSERT INTO product VALUES(SEQ_product.NEXTVAL, ?, ?, ?, ?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<%
		request.setCharacterEncoding("UTF-8");
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		String id = request.getParameter("id");
		String name= request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String description = request.getParameter("description");
		String category = request.getParameter("category");

		//출처 https://tomcat.apache.org/tomcat-8.5-doc/jndi-resources-howto.html
		/* 		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)
		  envCtx.lookup("jdbc/EmployeeDB");
		
		Connection conn = ds.getConnection();
		... use this connection to access the database ...
		conn.close(); */

		//scott tiger 노출이 안된다는데  나중에 출처 읽어봐요
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB2"); //context.xml에 선언한 Resource name : jdbc/OracleDB
		conn = ds.getConnection(); //커넥션 객체 생성..

		pstmt = conn.prepareStatement(sql);
		
		//쿼리문의 각각?에 해당하는 위치에 타입에 맞추어 업데이트  
				
		
		pstmt.setString(1, name);
		pstmt.setInt(2, Integer.parseInt(unitPrice) );
		pstmt.setString(3, description);
		pstmt.setString(4, category);

		//insert시 필요한 메소드.  executeUpdate   /  select는  executeQuery
		pstmt.executeUpdate();

		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, "scott", "tiger");
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<h3>회원가입 성공</h3>
	<a href="allProduct.jsp">회원 목록 전체 조회</a>
</body>
</html>