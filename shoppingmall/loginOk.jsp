<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<%
	String id = request.getParameter("mem_uid");
	String pwd = request.getParameter("mem_pwd");

	if(id.equals("admin") && pwd.equals("1234")) {
		session.setAttribute("uid",id);
		session.setAttribute("name","������");
		session.setAttribute("Member","yes");
		response.sendRedirect("login.jsp");
	}
	else {
		MemberDBBean manager = new MemberDBBean();
		int check = manager.userCheck(id, pwd);
	
		if(check == 1){
			MemberBean member = manager.getMember(id);
			String name = member.getMem_name();
			session.setAttribute("uid",id);
			session.setAttribute("name",name);
			session.setAttribute("Member","yes");
			response.sendRedirect("login.jsp");		
		}else if(check == 0){	
%>
		<script>
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
		<% }else{ %>
		<script>
			alert("���� ���� �ʴ� ȸ���Դϴ�.");
			history.go(-1);
		</script>

<%
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Check</title>
</head>
<body>

</body>
</html>
