<%@ page contentType="text/html;charset=euc-kr"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	String pageNUM = request.getParameter("pageNUM");
%>
<html>
<head>
<script language="JavaScript" src="board.js" charset="utf-8"></script>
</head>
<body>
<form name="form" method="post" action="delete_ok.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>">
	��ȣ : <input type="password" name="b_pwd"><br>
	<input type="button" value="�ۻ���" onclick="delete_ok()">
	<input type="reset" value="�ٽ� �ۼ�">
	&nbsp&nbsp&nbsp&nbsp;
	<input type="button" value="�۸��" onClick="location.href='list.jsp'">
</form>
</body>
</html>