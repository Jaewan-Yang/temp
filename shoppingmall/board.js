app.use(function (req, res, next) {
  if (req.url && req.url.indexOf('.htm') > -1) {
    res.header('Content-Type', 'text/html');
  }
  next();
});

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
function mdelete_ok(){
	  if(document.form.mem_pwd.value.length==0) {
	    alert("비밀번호를 입력세요.");
	    form.mem_pwd.focus();
	    return false;
	  }  
	  document.form.submit();
	}  
function setPreviewBox(){
  preview.style.posLeft = event.x + 30 + document.body.scrollLeft; 
  preview.style.posTop = event.y - 30 + document.body.scrollTop;
}
function showPreview(b_title, b_content){
  if(b_content!="")
  {
    var text; 
    text ='<table cellpadding="5" bgcolor="#FFFFFF" style="font-size:9pt; border-width:1; border-color:black; border-style:solid;">'; 
    text += '<tr><td><b>' + b_title + '<br></b>' + b_content + '</td></tr></table>'; 
    preview.innerHTML=text; 
    preview.style.visibility='visible'; 
  }
}
function hidePreview(){
  preview.innerHTML=''; 
  preview.style.visibility='hidden'; 
} 
