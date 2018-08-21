<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
	com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
	java.util.*, java.io.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String realFolder = "";
String saveFolder = "temp";
String encType = "euc-kr";

int sizeLimit = 10 * 1024 * 1024;
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);

MultipartRequest multi = null;
multi = new MultipartRequest(request, realFolder, sizeLimit, encType, new DefaultFileRenamePolicy());
			
String fileName = multi.getFilesystemName("userFile");
String originFileName = multi.getOriginalFileName("userFile");
File file = multi.getFile("userFile");
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String email = multi.getParameter("email");
String title = multi.getParameter("title");
String contents = multi.getParameter("contents");

Class.forName("com.mysql.jdbc.Driver"); // mysql
String url = "jdbc:mysql://localhost:3306/shop";
Connection conn = DriverManager.getConnection(url, "root", "1234");
//Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle
//String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
//Connection conn = DriverManager.getConnection(url, "scott", "tiger");
Statement stmt = conn.createStatement();
Calendar dateln = Calendar.getInstance();
String indate = Integer.toString(dateln.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateln.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateln.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateln.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateln.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateln.get(Calendar.SECOND));

String strSQL = "SELECT Max(num) FROM luxuryboard";
ResultSet rs = stmt.executeQuery(strSQL);
int num = 1;

//if(!rs.wasNull()) { // Oracle 에서는 다르게 사용해야됨
if(rs != null) {
	rs.next();
	num = rs.getInt(1) + 1;
}


strSQL = "INSERT INTO luxuryboard(num, name, pass, email, title, contents, writedate, readcount, filename) ";
strSQL = strSQL + "VALUES('" + num + "', '" + name + "', '" + pass + "', '" + email + "',";
strSQL = strSQL + "'" + title + "', '" + contents + "', '" + indate + "', '0', '" + fileName + "')";
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("listboard.jsp");
%>
