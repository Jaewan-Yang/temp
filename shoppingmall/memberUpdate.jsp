<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>
<%
	String uid=(String)session.getAttribute("uid");
	if(uid.equals("admin")) {
		uid=request.getParameter("uid");
	}
	MemberDBBean manager = MemberDBBean.getInstance();
	MemberBean mb = manager.getMember(uid);	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
</head>

<body>
<table border="1" align="center">
	<form action="memberUpdateOk.jsp" name="reg_frm" method="post">
		<tr height="50">
			<td colspan="2" align="center">
				<h1>회원 정보 수정</h1>
				'*' 표시 항목은 필수 입력 항목입니다.
			</td>
		</tr>
		
		<tr height="30">
			<td width="80">User ID</td>
			<td><input name="mem_uid" size="20" value=<%= mb.getMem_uid() %>></td>
		</tr>
		
		

		<tr height="30">
			<td width="80">암호</td>
			<td><input name="mem_pwd" size="20" type="password">*</td>
		</tr>
		
		<tr height="30">
			<td width="80">암호 확인</td>
			<td><input name="pwd_check" size="20" type="password">*</td>
		</tr>
		
		<tr height="30">
			<td width="80">이름</td>
			<td><input name="mem_name" size="30" value="<%= mb.getMem_name() %>"></td>
		</tr>
		
		<tr height="30">
			<td width="80">E-mail</td>
			<td><input name="mem_email" size="30" value="<%= mb.getMem_email() %>">*</td>
		</tr>
		
		<tr height="30">
			<td width="80">주소</td>
			<td><input name="mem_addr" size="40" value="<%= mb.getMem_addr() %>"></td>
		</tr>
		
		<tr>
			<td colSpan="2" align="center">
				<input type="button" value="수정" onclick="update_check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시입력">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="수정안함" onclick="javascript:window.location='product_list.jsp'">
			</td>
		</tr>
		
		</form>
</table>
</body>
</html>
