<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 

Class.forName("oracle.jdbc.driver.OracleDriver"); // OracleDB
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");

// Class.forName("com.mysql.jdbc.Driver"); // MySQL
// Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "1234");

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM tboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
	strSQL = "DELETE From tboard WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate(); 

	strSQL = "UPDATE tboard SET num = num - 1 WHERE num > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();

	response.sendRedirect("listboard.jsp");
}else{
	response.sendRedirect("delete_pass.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>
