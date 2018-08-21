<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="script.js" charset="utf-8"></script>
</head>

<body>
<table border="1" align="center">
<form action="registerOk.jsp" name="reg_frm" method="post">
	<tr height="50">
		<td colspan="2" align="center">
			<h1>회원 가입 신청</h1>
			* 표시 항목은 필수 입력 항목입니다.
		</td>	
	</tr>
	<tr height="30">
		<td width="80">User ID</td>
		<td><input type="text" name="mem_uid" size="20">*</td>	
	</tr>
	<tr height="30">
		<td width="80">암 호</td>
		<td><input type="password" name="mem_pwd" size="20">*</td>
	</tr>
	<tr height="30">	
		<td width="80">암 호 확 인</td>
		<td><input type="password" name="pwd_check" size="20">*</td>
	</tr>
	<tr height="30">
		<td width="80">이 름</td>
		<td><input type="text" name="mem_name" size="20">*</td>	
	</tr>
	<tr height="30">
		<td width="80">E-mail</td>
		<td><input type="text" name="mem_email" size="20"></td>	
	</tr>
	<tr height="30">
		<td width="80">주소</td>
		<td><input type="text" name="mem_addr" size="40"></td>	
	</tr>
	<tr height="50">
		<td colspan="2" align="center">
			<input type="button" value="등록" onclick="check_ok()">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시입력">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="가입안함" onclick="javascript:window.location='login.jsp'">
		</td>	
	</tr>
</form>
</table>

</body>
</html>
