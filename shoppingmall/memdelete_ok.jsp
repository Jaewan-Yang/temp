<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="temp.*"%> 

<%
String pageNUM=request.getParameter("pageNUM");

int b_id=Integer.parseInt(request.getParameter("b_id"));
String mem_pwd=request.getParameter("mem_pwd");

BoardDBBean db= new BoardDBBean();
//BoardDBBean ��ü�� deleteBoard() �޼ҵ带 ȣ���Ͽ� ���� �����Ѵ�. 
int re=db.deleteMBoard(b_id, mem_pwd);

if(re==1){        //�� ������ �����ߴٸ�
  response.sendRedirect("list.jsp?pageNUM="+pageNUM);
}else if(re==0){%>
  <script language="JavaScript">
   alert("��й�ȣ�� ���� �ʽ��ϴ�."); history.go(-1);
   </script>
<%}else if(re==-1){%>
  <script language="JavaScript">
   alert("������ �����Ͽ����ϴ�.");  history.go(-1);
  </script>
<%}%>
