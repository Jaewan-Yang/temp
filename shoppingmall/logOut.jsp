<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>

<%
	String id = request.getParameter("mem_uid");
	String pwd = request.getParameter("mem_pwd");
	
	MemberDBBean manager = MemberDBBean.getInstance();
	
	MemberBean member = manager.getMember(id);
	session.removeAttribute("uid");
	session.removeAttribute("name");
	session.removeAttribute("Member");
	response.sendRedirect("login.jsp");		
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>logout</title>
</head>
<body>

</body>
</html>
