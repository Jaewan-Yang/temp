package member;
import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class MemberDBBean {
	
	static final String url = "jdbc:mysql://localhost:3306/shop";
	static final String user = "root";
	static final String password = "1234";
	
  private static MemberDBBean instance = new MemberDBBean();
  
  // 1) 전역 MemberDBBean 객체 레퍼런스를 리턴하는 메소드  
  public static MemberDBBean getInstance( ){
	  return instance;
  }

  // 2)쿼리작업에 사용할 커넥션 객체를 리턴하는 메소드 
  public Connection getConnection( ) throws Exception{
    //InitialContext 객체를 생성
	Context ctx=new InitialContext();
	//jdbc/oracle이란 이름을 객체를 찾아서 DataSource가 받는다. 
	DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB"); // OracleDB
	// DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/mysql"); // MySQL
	//ds가 생성되었으므로 Connection을 구한다. 
	
	// Connection Pool일 경우
	return ds.getConnection();
	
	// JDBC
	// return DriverManager.getConnection(url, user, password);
	
  }

  // 3)전달인자로 받은 member를 memberT 테이블에 삽입하는 메소드
  public int insertMember(MemberBean member) throws Exception{
    Connection con=null;            
	PreparedStatement pstmt=null;
	String sql="insert into tmember values(?,?,?,?,?,?)";
  
	int re=-1;
	try{ 
	  con=getConnection();
	  
	  pstmt=con.prepareStatement(sql);
	  re=-2;
	  pstmt.setString(1, member.getMem_uid());
	  pstmt.setString(2, member.getMem_pwd());
	  pstmt.setString(3, member.getMem_name());
	  pstmt.setString(4, member.getMem_email());
	  pstmt.setTimestamp(5, member.getMem_regdate());
	  pstmt.setString(6, member.getMem_addr());
		
	  pstmt.executeUpdate();
	  
	  re=1;
	  
	  pstmt.close();
  	  con.close();
	}catch (Exception e) {
		System.out.println("추가 실패");		
		e.printStackTrace();
	}	
	
	return re;
  }

  //4) 사용자 인증시 사용하는 메소드
  public int userCheck(String id, String pwd) throws Exception{
	Connection  con=null;            
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select mem_pwd from tmember where mem_uid=?"; 
	String db_mem_pwd;
	int re=-1;
	
	try{ 
	  con=getConnection();
	  pstmt=con.prepareStatement(sql);
	  pstmt.setString(1, id);
	  rs=pstmt.executeQuery();
	  if(rs.next()){ //아이디기 일치하는 로우 존재
        db_mem_pwd=rs.getString("mem_pwd");
		if(db_mem_pwd.equals(pwd)) //패스워드도  일치
			re=1;
		else   //패스워드가 불일치
			re=0;
	  }
	  else//해당 아이디가 존재하지 않음
        re=-1;
	  rs.close();   
	  pstmt.close();
	  con.close();
	}catch (Exception e) { re=2; }		
	return re;
  }
  //5) 회원 가입시 아이디 중복 확인할 때 사용하는 메소드 
  public int confirmID(String id) throws Exception{
	Connection  con=null;            
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select mem_id from tmember where mem_uid=?"; 
	int re=-1;
		
	try{ 
	  con=getConnection();
	  pstmt=con.prepareStatement(sql);
	  pstmt.setString(1, id);
	  rs=pstmt.executeQuery();
	  if(rs.next()) //아이디기 일치하는 로우 존재
     	re=1;
	  else//해당 아이디가 존재하지 않음
        re=-1;
	  rs.close();   
	  pstmt.close();
	  con.close();
	}catch (Exception e) { re=2; }		
 	  return re;
  }
  //6) 아이디가 일치하는 멤버의 정보를 얻어오는 메소드
  public MemberBean getMember(String id) throws Exception{
	Connection  con=null;            
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from tmember where mem_uid=?"; 
	MemberBean member=null;
	try{ 
		  con=getConnection();
		  pstmt=con.prepareStatement(sql);
		  pstmt.setString(1, id);
		  rs=pstmt.executeQuery();
		  if(rs.next()) {//아이디기 일치하는 로우 존재
			member=new MemberBean();
			member.setMem_uid(rs.getString("mem_uid"));
			member.setMem_pwd(rs.getString("mem_pwd"));
			member.setMem_name(rs.getString("mem_name"));
			member.setMem_email(rs.getString("mem_email"));
			member.setMem_regdate(rs.getTimestamp("mem_regdate"));
			member.setMem_addr(rs.getString("mem_address"));
		  }
		  rs.close();   
		  pstmt.close();
		  con.close();
		}catch (Exception e) {}		
	
	return member;
  }  
  //7) 회원 정보 테이블내의 특정 행의 값을 변경한다. 
  public int updateMember(MemberBean member)throws Exception{
	Connection  con=null;            
	PreparedStatement pstmt=null;
	String sql="update tmember set mem_uid=?, mem_pwd=?, mem_name=?, mem_email=?, mem_address=? where mem_uid=?"; 
	int re=-1;
	try{ 
	  con=getConnection();
	  pstmt=con.prepareStatement(sql);
	  pstmt.setString(1, member.getMem_uid());
	  pstmt.setString(2, member.getMem_pwd());
	  pstmt.setString(3, member.getMem_name());
	  pstmt.setString(4, member.getMem_email());
	  pstmt.setString(5, member.getMem_addr());
	  pstmt.setString(6, member.getMem_uid());
	  re=pstmt.executeUpdate();
	  pstmt.close();
	  con.close();
	}catch (Exception e) {
		e.printStackTrace();
	}	
	return re;
  }
  //8) 아이디로 검색하여 해당 행을 삭제한다. 
  public int deleteMember(String id)throws Exception{
	Connection con=null;            
	PreparedStatement pstmt=null;
	String sql="delete from tmember where mem_uid=?";	
	int re=-1;	
	try{ 
	  con=getConnection();
	  pstmt=con.prepareStatement(sql);
	  pstmt.setString(1, id);

	  re=pstmt.executeUpdate();
	  pstmt.close();
	  con.close();
	}catch (Exception e) {}		
	return re;
  }

public ArrayList<MemberBean> selectAll() {
	ArrayList<MemberBean> all = new ArrayList<MemberBean>();

	Connection  con=null;            
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from tmember"; 

	try{ 
		  con=getConnection();
		  pstmt=con.prepareStatement(sql);
		  rs=pstmt.executeQuery();
		  while(rs.next()) {
			MemberBean member=new MemberBean();
			member.setMem_uid(rs.getString("mem_uid"));
			member.setMem_pwd(rs.getString("mem_pwd"));
			member.setMem_name(rs.getString("mem_name"));
			member.setMem_email(rs.getString("mem_email"));
			member.setMem_regdate(rs.getTimestamp("mem_regdate"));
			member.setMem_addr(rs.getString("mem_address"));

			all.add(member);
		  }
		  rs.close();   
		  pstmt.close();
		  con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
	
	return all;
} 
}