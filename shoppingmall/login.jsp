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
				<font size=-1><%=name %><br>���� �����Ͽ����ϴ�.</font>
			</td>
		</tr>
		<tr>
			<td>				
					<a href="main.jsp" target="center"> <input type="button" value="ȸ������" style="width:130px;"></a><br>
					<a href="list.jsp" target="center"><input type="button" value="�Խ��ǰ���" style="width:130px;"></a><br>
					<a href="listboard.jsp" target="center"><input type="button" value="�ڷ�ǰ���" style="width:130px;"></a><br>
					<a href="logOut.jsp"><input type="button" value="�α׾ƿ�" style="width:130px;"></a>				
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
				<font size=-1><%=name %><br>���� �����Ͽ����ϴ�.</font>
			</td>
		</tr>
		<tr height="30">
			<td>				
					<a href="memberUpdate.jsp" target="center"><input type="button" value="������������" style="width:130px;"></a><br>										
					<a href="logOut.jsp"><input type="button" value="�α׾ƿ�" style="width:130px;"></a>				
			</td>
		</tr>
	</table>

<%		} %>

<% } else { %>
	<table border="1" align="center">
		<tr height="30">
			<td width="100">
				<input type="text" size=20 placeholder="���̵�" name="mem_uid" value="">
			</td>
		</tr>
		<tr height="30">
			<td width="100">
				<input type="password" size=21 placeholder="�ܡܡܡܡ�" name="mem_pwd">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="�α���">
				<!-- <input type="button" value="ȸ������" onclick="javascript:window.location='register.jsp'"> -->
				<a href="register.jsp" target="center">
				<input type="button" value="ȸ������">
				</a>
			</td>
		</tr>
	
	</table>
<% } %>
</form>

</body>
</html>
