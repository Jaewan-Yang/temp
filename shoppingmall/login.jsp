<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>
<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("uid");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<form action="loginOk.jsp" method="post">
<% if( id != null) {
		if( id.equals("admin")) {
%>
	<table border="1" align="center">
		<tr>
			<td width="100" height="50" align="center">
				<font size=-1><%=name %><br>님이 접속하였습니다.</font>
			</td>
		</tr>
		<tr>
			<td>				
					<a href="main.jsp" target="center"> <input type="button" value="회원관리" style="width:130px;"></a><br>
					<a href="list.jsp" target="center"><input type="button" value="게시판관리" style="width:130px;"></a><br>
					<a href="listboard.jsp" target="center"><input type="button" value="자료실관리" style="width:130px;"></a><br>
					<a href="logOut.jsp"><input type="button" value="로그아웃" style="width:130px;"></a>				
			</td>
		</tr>
	</table>
<%
		} else {
%>

	<table border="1" align="center">
		<tr height="30">
			<td width="100" height="50" align="center">
<%
				MemberDBBean manager = new MemberDBBean();
				MemberBean member = manager.getMember(id);
				name = member.getMem_name();
%>
				<font size=-1><%=name %><br>님이 접속하였습니다.</font>
			</td>
		</tr>
		<tr height="30">
			<td>				
					<a href="memberUpdate.jsp" target="center"><input type="button" value="개인정보변경" style="width:130px;"></a><br>										
					<a href="logOut.jsp"><input type="button" value="로그아웃" style="width:130px;"></a>				
			</td>
		</tr>
	</table>

<%		} %>

<% } else { %>
	<table border="1" align="center">
		<tr height="30">
			<td width="100">
				<input type="text" size=20 placeholder="아이디" name="mem_uid" value="">
			</td>
		</tr>
		<tr height="30">
			<td width="100">
				<input type="password" size=21 placeholder="●●●●●" name="mem_pwd">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<!-- <input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'"> -->
				<a href="register.jsp" target="center">
				<input type="button" value="회원가입">
				</a>
			</td>
		</tr>
	
	</table>
<% } %>
</form>

</body>
</html>
