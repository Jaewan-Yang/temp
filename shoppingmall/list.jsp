<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>  
<%@ page import="temp.*"%> 
<%@ page import="member.*"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
String pageNUM=request.getParameter("pageNUM");
if(pageNUM == null)
	pageNUM="1";

BoardDBBean db = new BoardDBBean();
MemberDBBean mbdb = new MemberDBBean();

ArrayList<BoardBean> boardList = db.listBoard(pageNUM);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");

String b_name, b_email, b_title, b_content;
int b_id=0, b_hit=0, b_level=0;
Timestamp b_date;

int count=0 ; //페이지 카운터 변수
int i,k;
%>


<html>
<head><title></title></head>
<script type="text/javascript" src="jquery-3.3.1.js" ></script>
<script language="JavaScript" src="board.js" charset="utf-8"></script>

<body>

<center><h1>게시판에 등록된 글 목록 보기</h1>
<table width="600">
<tr>
<td align="right">
<a href="write.jsp" aligh="right"> 글 쓰 기 </a></td>
</tr>
</table>

<table width="95%" border="1" cellpadding="0" cellspacing="0">
<tr height="25">
<td width="40" align="center">번호</td>
<td width="450" align="center">글제목</td>
<td width="120" align="center">작성자</td>
<td width="160" align="center">작성일</td>
<td width="60" align="center">조회수</td>  
</tr>

<%
for(i=0; i<boardList.size(); i++) {
  BoardBean board = boardList.get(i);
  b_id=board.getB_id();
  b_level=board.getB_level();
  b_title=board.getB_title();
  b_name=board.getB_name();
  b_email=board.getB_email();
  b_date=board.getB_date();
  b_hit=board.getB_hit();
  b_content=board.getB_content().replace("\r\n","<br>"); //추가
//b_ip ref step fname fsize =board.getB_content(); //추가
%>
  <tr height="25" bgcolor="#F7F7F7" 
    onmouseover="this.style.backgroundColor='#eeeeef'" 
    onmouseout="this.style.backgroundColor='#f7f7f7'">

  <td align="center">
  <%=b_id%>
  </td>

  <td>
   <% if(b_level>0) { 
     for(k=0; k< b_level; k++){
     %>&nbsp;<%}%>
    <img src="asdf.gif" width="16" height="16"border=0> 
  <% } %>
  <a href="show.jsp?b_id=<%=b_id%>&pageNUM=<%=pageNUM%>" onmousemove="setPreviewBox();" onmouseout="hidePreview(); return true;" onmouseover="showPreview('<%=b_title%><hr>', '<%=b_content%>');return true;"> 
      <%=b_title%>
  </a>
  </td>
  
  <td align="center">
  <a href="mailto:<%=b_email %>">
  <%=b_name%>
  </a>
  </td>
  <td align="center"><%=sdf.format(b_date)%></td>
  <td align="center"><%=b_hit%></td>
  </tr>
 <%} //for의 끝... %> 
</table>

<div id="preview" style="visibility=hidden; position:absolute; left:78px; top:165px; width:200px; height:62px; z-index:1; border-width:1px; border-style:none;">
</div> 

<br><br>
<center>
 <!--  페이지 구현부 : 화면당 최대 4 개 출력 -->
<%=BoardBean.pageNumber(4)%>  
</center> 
</body>
</html>
