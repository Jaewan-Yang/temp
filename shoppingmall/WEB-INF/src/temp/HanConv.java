package temp;
 
import java.io.UnsupportedEncodingException;
 
public class HanConv {
 //8859_1 ����� euc-kr ������� ��ȯ�ϴ� �޼ҵ� ����
 public static String toKor(String str) {
  if(str==null || str.equals("") || str.equals("null")) {
   return str;
  }
  try{
   return new String(str.getBytes("8859_1"),"euc-kr");
  }catch(UnsupportedEncodingException uee) {
   uee.printStackTrace();
   return str;
  }
 }
 //uec-kr ����� 8859_1������� ��ȯ�ϴ� �޼ҵ� ����
 public static String toEng(String str) {
  if(str==null || str.equals("") || str.equals("null")) {
   return str;
  }
  try{
   return new String(str.getBytes("euc-kr"),"8859_1");
  }catch(UnsupportedEncodingException uee) {
   uee.printStackTrace();
   return str;
  }
 }
}