<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="member.*" %>
<%
String uid = request.getParameter("uid");
MemberDBBean dbBean = new MemberDBBean();
dbBean.deleteMember(uid);
%>
<html>
<head>
<title>회원 삭제</title>
</head>
<body>
<center>회원이 강제 탈퇴처리 되었습니다.<br><a href="main.jsp">목록</a></center>
</body>
</html>
