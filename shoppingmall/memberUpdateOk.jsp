<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<jsp:useBean id="mb" class="member.MemberBean" scope="page">
<jsp:setProperty property="*" name="mb"/>
</jsp:useBean>
<%
	//String uid=(String)session.getAttribute("uid");
	String uid=request.getParameter("mem_uid");
	mb.setMem_uid(uid);
	
	MemberDBBean manager=MemberDBBean.getInstance();
	
	if(manager.confirmID(mb.getMem_uid())==1){
%>
	<script language="javascript">
		alert("���̵� �ߺ��˴ϴ�.");
		history.back();
	</script>		
<%
	}
	
	int re=manager.updateMember(mb);
	
	if(re==1){
%>
<script type="text/javascript">
	alert("�Է��ϽŴ�� ȸ�� ������ �����Ǿ����ϴ�.");
	document.location.href='main.jsp';
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("������ ���еǾ����ϴ�.");
	history.go(-1);
</script>
<%
}
%>
</body>
</html>
