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
		alert("���̵� �ߺ��˴ϴ�.");
		history.back();
	</script>		
<%	}else{
		int re = manager.insertMember(mb);
		if(re == 1){			
%>
		<script language="javascript">
			alert("ȸ�������� �����մϴ�!! �α��� ���ּ���.");			
			document.location.href='product_list.jsp';			
		</script>
<%		}else if(re == -1)
		{
%>
		<script>
			alert("Connection ����");
		</script>
<%
		}else{
%>
		<script language="javascript">
			alert("ȸ�����Կ� �����߽��ϴ� ��_��");
			document.location.href='register.jsp';
		</script>
<%
		}
	}
%>

</body>
</html>
