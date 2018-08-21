<%@ page contentType="text/html;charset=euc-kr"%> 
<%@ page import="com.oreilly.servlet.*"%> 
<%@ page import="com.oreilly.servlet.multipart.*"%> 
<%@ page import="java.util.*"%> 
<%@ page import="java.io.*"%>  
 
<% 
String realFolder = ""; 	//�� ���ø����̼ǻ��� ���� ��� 
String saveFolder = "temp";	//������ ���ε�Ǵ� ���� ���� 
String encType = "euc-kr";	//���ڵ�Ÿ�� 
int maxSize = 10*1024*1024;	//�ִ� ���ε� ����ũ�� 10Gb 
/* ������ ��� ������ ������ ���� �� �ִ�. */ 
/* �ѱ��� ����� �ȵ� ���ɼ��� �ִ�(�׽�Ʈ������ �� �Ǿ���) */ 
/* �Ƹ��� utf ���� ���� �ִ� ���ڸ� �ν� ������ ������ �Ǵܵ� */ 
 
ServletContext context = getServletContext();  
//���� jsp�������� �� ���ø����̼ǻ��� ���� ��θ� ���Ѵ� 
realFolder = context.getRealPath(saveFolder); 
/* ���� ��ġ�� �ٸ� �� �־� ���� ��θ� �����´� */ 
out.println("the realpath is : " + realFolder+"<br>"); 

try{ 
   MultipartRequest multi = null; 
   //������ ����� ������Ʈ�� �����ϰ� ������ �����Ѵ�. 
   //������ ���ϸ��� ������ �ִ� ��ü, �������� ������,�ִ� ���ε�� ����ũ��, �����ڵ�, �⺻ ���� ���� 
   multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy()); 
   /* DefaultFileRenamePolicy ���� ���ϸ��� ������ �ڵ����� ���ϸ� ���� */
   //Form�� �Ķ���� ����� �����´� 

   Enumeration params = multi.getParameterNames(); 
   //�Ķ���͸� ����Ѵ� 
   while(params.hasMoreElements()){  
      String name = (String)params.nextElement(); //���۵Ǵ� �Ķ�����̸� 
      String value = multi.getParameter(name);    //���۵Ǵ� �Ķ���Ͱ�   
      out.println(name + " = " + value +"<br>"); 
   } 
    out.println("-------------------------------------<br>"); 
   //������ ���� ������ ������ ����Ѵ� 

   Enumeration files = multi.getFileNames(); 
   //���� ������ �ִٸ� 
   while(files.hasMoreElements()){ 
    //input �±��� �Ӽ��� file�� �±��� name �Ӽ��� :�Ķ�����̸� 
      String name = (String)files.nextElement(); 
   //������ ����� ���� �̸� 
      String filename = multi.getFilesystemName(name); 
   //������ ������ ���� �̸� 
      String original = multi.getOriginalFileName(name); 
   //���۵� ������ ���� Ÿ�� 
      String type = multi.getContentType(name); 
   //���۵� ���� �Ӽ��� file�� �±��� name �Ӽ����� �̿��� ���� ��ü ���� 

	File file = multi.getFile(name); 
	out.println("�Ķ���� �̸� : " + name +"<br>"); 
	out.println("���� ���� �̸� : " + original +"<br>"); 
	out.println("����� ���� �̸� : " + filename +"<br>"); 
	out.println("���� Ÿ�� : " + type +"<br>"); 
       
	if(file!=null){ 
		out.println("ũ�� : " + file.length()); 
		out.println("<br>"); 
	} 
	}

}catch(IOException ioe){ 
 System.out.println(ioe); 
}catch(Exception ex){ 
 System.out.println(ex); 
} 

%> 

