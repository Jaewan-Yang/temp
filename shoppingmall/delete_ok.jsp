<%@page contentType="text/html;charset=euc-kr"%>
<%@ page import="temp.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	String b_pwd  = request.getParameter("b_pwd");
	
	String pageNUM = request.getParameter("pageNUM");
%>

<%
	BoardDBBean db = new BoardDBBean();
	int re =db.deleteBoard(b_id, b_pwd);
	if(re == 1){
	response.sendRedirect("list.jsp?pageNUM="+pageNUM);
	}
	else if(re == 0)
	{
%>
	<script language="javascript">
	alert("��й�ȣ�� ���� �ʽ��ϴ�."); history.go(-1);
	</script>
<%
	}
	else if( re == -1)
	{
%>
	<script language="javascript">
	alert("������ ���� �Ͽ����ϴ�."); history.go(-1);
	</script>
<%
	}
	
%>