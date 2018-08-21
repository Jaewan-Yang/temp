<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mb" class="member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
<%
	mb.setMem_regdate(new Timestamp(System.currentTimeMillis()));
	MemberDBBean manager = MemberDBBean.getInstance();

	if(manager.confirmID(mb.getMem_uid())==1){
%>
	<script language="javascript">
		alert("아이디가 중복됩니다.");
		history.back();
	</script>		
<%	}else{
		int re = manager.insertMember(mb);
		if(re == 1){			
%>
		<script language="javascript">
			alert("회원가입을 축하합니다!! 로그인 해주세요.");			
			document.location.href='product_list.jsp';			
		</script>
<%		}else if(re == -1)
		{
%>
		<script>
			alert("Connection 실패");
		</script>
<%
		}else{
%>
		<script language="javascript">
			alert("회원가입에 실패했습니다 ㅠ_ㅠ");
			document.location.href='register.jsp';
		</script>
<%
		}
	}
%>

</body>
</html>
