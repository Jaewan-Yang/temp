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
	암호 : <input type="password" name="b_pwd"><br>
	<input type="button" value="글삭제" onclick="delete_ok()">
	<input type="reset" value="다시 작성">
	&nbsp&nbsp&nbsp&nbsp;
	<input type="button" value="글목록" onClick="location.href='list.jsp'">
</form>
</body>
</html>