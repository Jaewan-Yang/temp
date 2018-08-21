<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
	
<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover 	{font-family:"";color:black;text-decoration:underline;}
 -->
 </style>
 </HEAD>
 <BODY>
 <%
 String num = request.getParameter("num");
 Class.forName("com.mysql.jdbc.Driver");
 String url = "jdbc:mysql://localhost:3306/shop";
 Connection conn = DriverManager.getConnection(url, "root", "1234");
 //Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle
 //String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
 //Connection conn = DriverManager.getConnection(url, "scott", "tiger");
 PreparedStatement pstmt = null;
 ResultSet rs = null;
 
 try {
	String strSQL = "SELECT * FROM luxuryboard WHERE num = ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	
	rs = pstmt.executeQuery();
	rs.next();
	rs = pstmt.executeQuery();
	rs.next();
	
	String name = rs.getString("name");
	String title = rs.getString("title");
	String contents = rs.getString("contents").trim();
	String writedate = rs.getString("writedate");
	int readcount = rs.getInt("readcount");
	String filename = rs.getString("filename");
  %>
 <center><font size='3'><b> �Խ��� </b></font>
 <TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
 	<TR>
 		<TD><hr size='1' noshade>
 		</TD>
 	</TR>
 </TABLE>
 
 <TABLE border='0' width='600'>
 	<TR>
 		<TD align='left'>
 		<font size='2'> �ۼ��� : <a href="email.jsp?num=<%=num%>"><%=name%></a></font>
 		</TD>
 		<TD align=right>
 		<font size='2'>�ۼ���: <%=writedate %>, ��ȸ��: <%=readcount %></font>
 		</TD>
 	</TR>
    	<TR>
    		<TD align=left>
      		<font size='2'>�����̸� :<a href="file_down.jsp?num=<%=num %>"> 
                <%=filename %></font>
    		</TD>
    	</TR>
</TABLE>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
	<TR bgcolor='cccccc'>
		<TD align='center'>
    		<font size='3'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
	<TR bgcolor='ededed'>
		<TD><font size='2' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
		<TD align='right'><font size='2'></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
		<TD align='left'>
			<a href="modify_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
			<a href="delete_pass.jsp?num=<%=num %>">[�����ϱ�]</a>
		</TD>
		<TD align='right'>
			<a href="reply.jsp?num=<%=num %>">[�亯�ϱ�]</a>
			<a href='write_luxuryboard.jsp'>[�۾���]</a>
			<a href='listboard.jsp'>[��Ϻ���]</a>
		</TD>
	</TR>
</TABLE>

<%
strSQL = "UPDATE luxuryboard SET readcount=readcount+1 WHERE num=?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

 } catch(SQLException e) {
	 out.print("SQL���� " + e.toString());
 } catch(Exception ex) {
	 out.print("JSP���� " + ex.toString());
 } finally {
	 rs.close();
	 pstmt.close();
	 conn.close();
 }
%>
 </center>
 </TABLE>
 </BODY>
 </HTML>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 </BODY>