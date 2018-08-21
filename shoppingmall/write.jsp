<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="temp.*"%> 

<html>
<head><title></title>
<!-- 폼에 입력된 정보가 올바른지 판단하는 자바스크립트 부분 -->
<script language="JavaScript" >
function check_ok() {
	  if(document.form.b_name.value.length==0) {
	    alert("이름을 입력하세요.");
	    form.b_name.focus();
	    return false;
	  }
	  if(document.form.b_title.value.length==0) {
	    alert("제목을 입력하세요.");
	    form.b_title.focus();
	    return false;
	  }
	  if(document.form.b_content.value.length==0) {
	    alert("내용을 입력하세요.");
	    form.b_content.focus();
	    return false;
	  }
	  if(document.form.b_pwd.value.length==0) {
	    alert("비밀번호를 입력세요.");
	    form.b_pwd.focus();
	    return false;
	  }  
	  document.form.submit();
}
function delete_ok(){
  if(document.form.b_pwd.value.length==0) {
    alert("비밀번호를 입력세요.");
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
  //답변 글일 경우에만 이부분이 수행된다.
  b_id=Integer.parseInt(request.getParameter("b_id")); 
}

BoardDBBean db= new BoardDBBean();
BoardBean board=db.getBoard(b_id, false);
if(board!=null){
	b_name=board.getB_name();       // 2. 작성자
	b_title=board.getB_title();     // 4. 글제목

	b_ref=board.getB_ref();         //10.글 그룹 번호
	b_step=board.getB_step();       //11.화면에 출력되는 글 위치
	b_level=board.getB_level();	    //12.답변 순위
}	
%>
<body>

<form name=form method="post" action="write_ok.jsp">
<center><h1>글 올 리 기</h1>

<input type="hidden" name="b_id" value="<%=b_id%>">
<input type="hidden" name="b_ref" value="<%=b_ref%>">
<input type="hidden" name="b_step" value="<%=b_step%>">
<input type="hidden" name="b_level" value="<%=b_level%>">

<table border="0" cellpadding="0" cellspacing="0">
<tr height="30">
  <td width="80">작성자</td>
  <td width="140">
  <input type="text" name="b_name" maxlength="15" size="10"></td>
  
  <td width="80">이메일</td>
  <td width="240">
  <input type="text" name="b_email" maxlength="30" size="24"></td>
</tr>

<tr height="30">
  <td width="80">글제목</td>
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
  <td width="80">암&nbsp;&nbsp;호</td>
  <td colspan="3" width="460">
  <input type="password" name="b_pwd" maxlength="12" size="12"></td>
  </td>
</tr> 
<tr height="50" align="center">
  <td colspan="4" width="480">
  <input type="button" value="글쓰기" onClick="check_ok()"> &nbsp;   <!--  -->
  <input type="reset"  value="다시작성"> &nbsp;
  <input type="button" value="글목록" onClick="location.href='list.jsp'">&nbsp;
  </td>
</tr>        
</table>
</form>
</center>
</body>
</html>
