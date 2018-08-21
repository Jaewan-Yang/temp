package temp; 
import java.sql.Timestamp;

public class BoardBean {
   
  // 답변 형 게시판을 위한 변수	  
  private int b_id;
  private String b_name;
  private String b_email;
  private String b_title;
  private String b_content;
  private String b_pwd;
  private Timestamp b_date;
  private int b_hit;
  private String b_ip;
  private int b_ref=0;              //10. 글 그룹
  private int b_step=0;             //11. 글 위치
  private int b_level=0;            //12. 글 레벨
 
  //자료실형 게시판에 추가된 부분 시작
  private String b_fname;
  private int b_fsize;
  //자료실형 게시판에 추가된 부분 끝

//1. 글 번호
  public int getB_id() {
	return b_id;
  }
  public void setB_id(int b_id) {
	this.b_id = b_id;
  }
//2. 작성자  
  public String getB_name() {
	return b_name;
  }
  public void setB_name(String b_name) {
	this.b_name = b_name;
  }
//3. 글쓴이 이메일주소 
  public String getB_email() {
	return b_email;
  }
  public void setB_email(String b_email) {
	this.b_email = b_email;
  }
//4. 글 제목  
  public String getB_title() {
	return b_title;
  }
  public void setB_title(String b_title) {
	this.b_title = this.Replace(b_title,"'","''");
  }
//5. 글 내용  
  public String getB_content() {
	return b_content;
  }  
  public void setB_content(String b_content) {
	this.b_content = this.Replace(b_content, "'","''");
  }
//6. 비밀번호  
  public String getB_pwd() {
	return b_pwd;
  }
  public void setB_pwd(String b_pwd) {
	this.b_pwd = b_pwd;
  }
//7. 작성일	
  public Timestamp getB_date() {
	return b_date;
  }
  public void setB_date(Timestamp b_date) {
	this.b_date = b_date;
  }
// 8. 글쓴이 IP  
  public String getB_ip() {
	return b_ip;
  }
  public void setB_ip(String b_ip) {
	this.b_ip = b_ip;
  }
//9. 조회 회수
  public int getB_hit() {
	return b_hit;
  }
  public void setB_hit(int b_hit) {
	this.b_hit = b_hit;
  }
//10. 글 그룹
  public int getB_ref() {
    return b_ref;
  }
  public void setB_ref(int b_ref) {
    this.b_ref = b_ref;
  }
//11. 글 위치 
  public int getB_step() {
    return b_step;
  }
  public void setB_step(int b_step) {
	this.b_step = b_step; 
  }
//12. 글 레벨  
  public int getB_level() {
	return b_level;
  }
  public void setB_level(int b_level) {
	this.b_level = b_level;
  }
 
  // 페이지 구현을 위한 변수 
  public static  int pagesize = 10;// 한 페이지 당 10개 출력물
  public static  int pagecount= 1 ;// 페이지 개수 지정 변수
  public static  int pageNUM= 1;   // 페이지 번호
    
  // 개행처리함수 Replace
  public String Replace(String or, String ol, String ne){
    for(int i=0; (i=or.indexOf(ol,i))>=0;i+=ne.length())
      or=or.substring(0, i)+ne+or.substring(i+ol.length());
    return or;
  }
  
  //글 목록을 페이지로 구현하는 메소드  
  public static String pageNumber(int limit){ 
	String str = ""; 
	int temp = (pageNUM-1) % limit ;         //시작 페이지 구하기
	int startPage = pageNUM - temp;
	// [이전] 링크 추가하기
	if ((startPage-limit)>0){
	  str="<a href='list.jsp?pageNUM="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
	}
	//페이지 번호 나열하기
	for(int i=startPage ; i<(startPage+limit);i++){
	  if( i == pageNUM){
        str +="["+i+"]&nbsp;&nbsp;";
	  }else{
	    str += "<a href='list.jsp?pageNUM="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
	  }
	  if(i >= pagecount) break;
	}//for문 끝...
	//[다음] 링크 추가
	if ((startPage+limit)<=pagecount){ 
	  str += "<a href='list.jsp?pageNUM=" + (startPage+limit)+"'>[다음]</a>";
	}  
    return str;
  }
  
  public String getB_fname() {
	return b_fname;
  }
  public void setB_fname(String b_fname) {
	this.b_fname = b_fname;
  }
  public int getB_fsize() {
	return b_fsize;
  }
  public void setB_fsize(int b_fsize) {
	this.b_fsize = b_fsize;
  }
}

