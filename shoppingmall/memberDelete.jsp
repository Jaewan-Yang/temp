<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="member.*" %>
<%
String uid = request.getParameter("uid");
MemberDBBean dbBean = new MemberDBBean();
dbBean.deleteMember(uid);
%>
<html>
<head>
<title>ȸ�� ����</title>
</head>
<body>
<center>ȸ���� ���� Ż��ó�� �Ǿ����ϴ�.<br><a href="main.jsp">���</a></center>
</body>
</html>
