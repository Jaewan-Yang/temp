<%@ page contentType="text/html; charset=EUC-KR"%>
<HTML>
<HEAD>
<SCRIPT language="javascript">

function check(f) {
blank=false;
for (i=0; i<f.elements.length;i++) {
if (f.elements[i].value=="")
if (f.elements[i].name != "large") 
blank= true;
}
if (blank==true) 
alert("��� �׸��� �Է��ϼž� �մϴ�.");
else
f.submit();
}
</SCRIPT> 
</HEAD>
<BODY>
<center>
<FORM method=post action="product_save.jsp" enctype="multipart/form-data" >
<TABLE border=0 width=300 >
<TR>
<TH bgcolor=#DFEDFF colspan=2>
<FONT size=+1 color=black> ��ǰ �ø���</FONT></TH>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black> �ۼ���</FONT></TH>
<TD bgcolor=#eeeeee> <INPUT type=text name=wname size=20>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>��ǰ �з�</FONT></TH>
<TD bgcolor=#eeeeee>
<FONT size=-1 color=white>
<SELECT name=category size=1>
<OPTION value=11>����
<OPTION value=22>����/����
<OPTION value=33>�ξ���ǰ
<OPTION value=44>�Ƿ�
<OPTION value=55>���� �� �Ǽ�����
<OPTION value=66>�ｺ�ⱸ
<OPTION value=77>��ǻ�� ����
<OPTION value=88>��Ÿ 
</SELECT>
</FONT>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>��ǰ��</FONT></TH>
<TD bgcolor=#eeeeee>
<INPUT type=text name=pname size=30>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>������</FONT></TH>
<TD bgcolor=#eeeeee>
<INPUT type=text name=sname size=30>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>���߰�</FONT>
</TH>
<TD bgcolor=#eeeeee>
<INPUT type=text name=price size=10>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>�ǸŰ�</FONT>
</TH>
<TD bgcolor=#eeeeee>
<INPUT type=text name=dprice size=10>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>�԰� ����</FONT>
</TH>
<TD bgcolor=#eeeeee>
<INPUT type=text name=stock size=10>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>���� �̹���</FONT>
</TH>
<TD bgcolor=#eeeeee>
<INPUT type=file name=small size=30>
</TD>
</TR>
<TR>
<TH width=20% bgcolor=#DFEDFF>
<FONT size=-1 color=black>ū �̹���</FONT>
</TH>
<TD bgcolor=#eeeeee>
<INPUT type=file name=large size=30>
</TD>
</TR>
<TR>
<TH bgcolor=#DFEDFF>
<FONT size=-1 color=black> ��ǰ ����</FONT>
</TH>
<TD bgcolor=#eeeeee>
</TD>
</TR>
<TR>
<TD colspan=2>
<TEXTAREA name=description cols=70 rows=5></TEXTAREA>
</TD>
</TR>
<TR>
<TD colspan=2>
<INPUT type=button value=" ���� " onClick="check(this.form)" >
<INPUT type=reset value=" �ٽþ��� " >
</TD>
</TR>
</TABLE>
</CENTER>
</FORM>
</BODY>
</HTML>