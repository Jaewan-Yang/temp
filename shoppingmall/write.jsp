<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="temp.*"%> 

<html>
<head><title></title>
<!-- ���� �Էµ� ������ �ùٸ��� �Ǵ��ϴ� �ڹٽ�ũ��Ʈ �κ� -->
<script language="JavaScript" >
function check_ok() {
	  if(document.form.b_name.value.length==0) {
	    alert("�̸��� �Է��ϼ���.");
	    form.b_name.focus();
	    return false;
	  }
	  if(document.form.b_title.value.length==0) {
	    alert("������ �Է��ϼ���.");
	    form.b_title.focus();
	    return false;
	  }
	  if(document.form.b_content.value.length==0) {
	    alert("������ �Է��ϼ���.");
	    form.b_content.focus();
	    return false;
	  }
	  if(document.form.b_pwd.value.length==0) {
	    alert("��й�ȣ�� �Է¼���.");
	    form.b_pwd.focus();
	    return false;
	  }  
	  document.form.submit();
}
function delete_ok(){
  if(document.form.b_pwd.value.length==0) {
    alert("��й�ȣ�� �Է¼���.");
    form.b_pwd.focus();
    return false;
  }  
  document.form.submit();
}

</script>
</head>
<%
int b_id=0, b_ref=1, b_step=0, b_level=0;
String b_name="", b_title="";
if(request.getParameter("b_id")!=null){  
  //�亯 ���� ��쿡�� �̺κ��� ����ȴ�.
  b_id=Integer.parseInt(request.getParameter("b_id")); 
}

BoardDBBean db= new BoardDBBean();
BoardBean board=db.getBoard(b_id, false);
if(board!=null){
	b_name=board.getB_name();       // 2. �ۼ���
	b_title=board.getB_title();     // 4. ������

	b_ref=board.getB_ref();         //10.�� �׷� ��ȣ
	b_step=board.getB_step();       //11.ȭ�鿡 ��µǴ� �� ��ġ
	b_level=board.getB_level();	    //12.�亯 ����
}	
%>
<body>

<form name=form method="post" action="write_ok.jsp">
<center><h1>�� �� �� ��</h1>

<input type="hidden" name="b_id" value="<%=b_id%>">
<input type="hidden" name="b_ref" value="<%=b_ref%>">
<input type="hidden" name="b_step" value="<%=b_step%>">
<input type="hidden" name="b_level" value="<%=b_level%>">

<table border="0" cellpadding="0" cellspacing="0">
<tr height="30">
  <td width="80">�ۼ���</td>
  <td width="140">
  <input type="text" name="b_name" maxlength="15" size="10"></td>
  
  <td width="80">�̸���</td>
  <td width="240">
  <input type="text" name="b_email" maxlength="30" size="24"></td>
</tr>

<tr height="30">
  <td width="80">������</td>
  <td colspan="3" width="460">
  <%if(b_id==0){%>
  <input type="text" name="b_title" maxlength="60" size="55">
  <%}else{%>
  <input type="text" name="b_title" maxlength="60" size="55" 
  value="re:<%=b_title%>">
  <%}%>
  </td>
</tr>

<tr>
  <td colspan="4">
  <textarea wrap="hard" name="b_content" rows="10" cols="65"></textarea>
  </td>
</tr> 
 
<tr>
  <td width="80">��&nbsp;&nbsp;ȣ</td>
  <td colspan="3" width="460">
  <input type="password" name="b_pwd" maxlength="12" size="12"></td>
  </td>
</tr> 
<tr height="50" align="center">
  <td colspan="4" width="480">
  <input type="button" value="�۾���" onClick="check_ok()"> &nbsp;   <!--  -->
  <input type="reset"  value="�ٽ��ۼ�"> &nbsp;
  <input type="button" value="�۸��" onClick="location.href='list.jsp'">&nbsp;
  </td>
</tr>        
</table>
</form>
</center>
</body>
</html>
