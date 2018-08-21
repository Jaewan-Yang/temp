<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="temp.*"%> 

<%
String pageNUM=request.getParameter("pageNUM");

int b_id=Integer.parseInt(request.getParameter("b_id"));
String mem_pwd=request.getParameter("mem_pwd");

BoardDBBean db= new BoardDBBean();
//BoardDBBean 객체의 deleteBoard() 메소드를 호출하여 글을 삭제한다. 
int re=db.deleteMBoard(b_id, mem_pwd);

if(re==1){        //글 삭제에 성공했다면
  response.sendRedirect("list.jsp?pageNUM="+pageNUM);
}else if(re==0){%>
  <script language="JavaScript">
   alert("비밀번호가 맞지 않습니다."); history.go(-1);
   </script>
<%}else if(re==-1){%>
  <script language="JavaScript">
   alert("삭제에 실패하였습니다.");  history.go(-1);
  </script>
<%}%>
