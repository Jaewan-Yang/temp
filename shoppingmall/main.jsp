<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="member.*, java.net.URLEncoder" %>
<%
	if(session.getAttribute("Member") == null){
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%	}
	String name = (String)session.getAttribute("name");
	String uid = (String)session.getAttribute("uid");


	MemberDBBean dbBean = new MemberDBBean();
	ArrayList<MemberBean> list = null;

	if(uid.equals("admin")) {
		list = dbBean.selectAll();
	}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<table border="1" align="center">
	<tr height="30">
		<td colspan=7 align="center">
			안녕하세요. <%=name %>(<%=uid %>)님 작업을 선택하세요.
		</td>
	</tr>
	
<%
	if(uid.equals("admin")) {
%>

	<tr>
		<td align="center">아이디</td>
		<td align="center">비밀번호</td>
		<td align="center">이름</td>
		<td align="center">이메일</td>
		<td align="center">등록일</td>
		<td align="center">주소</td>
		<td align="center">작업선택</td>
	</tr>
<%
		for(int i = 0; i < list.size();i++) {
	    		MemberBean bean = list.get(i);
	    		if(bean.getMem_uid().equals("admin")) continue; //관리자일경우 리스트에 보여주지 않는다 
%>    
	<tr>
		<td align="center"><%=bean.getMem_uid() %></td>
		<td align="center"><%=bean.getMem_pwd() %></td>
		<td align="center"><%=bean.getMem_name() %></td>
		<td align="center"><a href="mailto:<%=bean.getMem_email() %> onmouseover="" onmouseout=""><%=bean.getMem_email() %></td>
		<td align="center"><%=bean.getMem_regdate() %></td>
		<td align="center"><%=bean.getMem_addr() %></td>		
		<td><a href="memberDelete.jsp?uid=<%=URLEncoder.encode(bean.getMem_uid(), "UTF-8") %>">삭제</a>
		<a href="memberUpdate.jsp?uid=<%=URLEncoder.encode(bean.getMem_uid(), "UTF-8") %>">수정</a></td>
	</tr>
		
<%
		}
	}
%>
</table>
</body>
</html>
