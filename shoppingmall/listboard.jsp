<%@ page language="java" contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
 <head>
  <title> 자료실 </title>

<script language="JavaScript">
function Check() {
	if(Form.keyword.value.length < 1) {
		alert("검색어를 입력하세요.");
		Form.keyword.focus();
		return false;
	}
}
</script>

  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
  <style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
  </style> 
 </head>
 <body>
<%

String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null) {
	pageNum = "1";
}
int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1 ) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i=0;
// int num[] = {0};	// 삭제
String strSQL = "";	// 추가

Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle
String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
Connection conn = DriverManager.getConnection(url, "scott", "tiger");

// Class.forName("com.mysql.jdbc.Driver"); // MySQL
// String url = "jdbc:mysql://localhost:3306/shop";
// Connection conn = DriverManager.getConnection(url, "root", "1234");

Statement stmt = conn.createStatement();

// String strSQL = "SELECT * from listboard";
// ResultSet rs = stmt.executeQuery(strSQL);

ResultSet rs = null;

if(key == null || keyword == null) {
	strSQL = "SELECT count(*) FROM luxuryboard";
} else {
	strSQL = "SELECT count(*) FROM luxuryboard WHERE " + key + " like '%" + keyword + "%'";
}

rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);
rs.close();

/*
while(rs.next()){
	num[i] = rs.getInt("num");
}
lastRow = num[0];
*/

%>
<td><center><font size='3'><b> 자료실 </b></font></td>
<table border='0' width='600' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1' noshade>
		</td>
	</tr>
</table>

<table border='0' width='600' cellpadding='2' cellspacing='1'>
	<tr bgcolor='cccccc'>
		<td><font size='2'><center><b> 번호 </b></center></font></td>
		<td><font size='2'><center><b> 글 제목 </b></center></font></td>
		<td><font size='2'><center><b> 작성자 </b></center></font></td>
		<td><font size='2'><center><b> 작성일 </b></center></font></td>
		<td><font size='2'><center><b> 조회 </b></center></font></td>
	</tr>
<% 
if(lastRow > 0) {
	if(key == null || keyword == null) {
		strSQL = "SELECT * FROM luxuryboard WHERE num BETWEEN "+ startRow + " and " + endRow + " ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM luxuryboard WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for(i=1; i< listSize; i++) {
		if(rs.next()) {
			int listnum = rs.getInt("num");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			int readcount = rs.getInt("readcount");
%>
	<tr bgcolor='ededed'>
		<td align=center><font size=2 color='black'><%=listnum %></font></td>
		<td align=left>
			<a href="write_output.jsp?num=<%=listnum %>"> 
			<font size=2 color='black'><%=title %></font></a>
		</td>
		<td align=center>
			<a href="<%=email %>"> 
			<font size=2 color='black'><%=name %></font></a>
		</td>
		<td align=center><font size=2><%=writedate %></font></td>
		<td align=center><font size=2><%=readcount %></font>
	</tr>
<%
		} // if(rs.next())
	} // for
%>
</table>

<table border='0' width='600' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1' noshade>
		</td>
	</tr>
</table>

<%
rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;
	if(currentPage > 1) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>
<%
	}
	for(i=setPage; i <= lastPage; i++) {
		if(i == Integer.parseInt(pageNum)) {
%>
		[<%=i%>]
<%
		} else{
%>
		<a href="listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}
%>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border=0 width=600>
<tr>
	<td align='center'>
		<TABLE border='0' cellpadding='0' cellspacing='0'>
		<FORM name='form' Method='POST' Action='listboard.jsp' OnSubmit='return Check()'>
		<input type='hidden' name='search' value='1'>
		<tr>
			<td align='right'>
			<select name='key' style="background-color:cccccc;">
			<option value='title' selected><font size='2'>글제목</font></option>
			<option value='contents'><font size='2'>글내용</font></option>
			<option value='name'><font size='2'>작성자</font></option>
			</select></td>
			<td align='left'>
				<input type='text' name='keyword' value='' size='20' maxlength='30'>
				<input type='submit' value='검색'>
			</td>
		</tr>
		</form>
		</table>
	</td>
	<td align='right'>
	<a href='write_luxuryboard.jsp'>[등록]</a>
	<a href='main.htm'>[메인화면]</a>
	</td>
</tr>
</table>

</body>
</html>























