package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBtablemaker{
	public static void main(String[] args) throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection con= null;
		Statement stmt1 = null;
		String sql = null;
		try { 
		con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "1234");
		stmt1 = con.createStatement();
		sql = "create table tboard(b_id number, b_name varchar2(15),b_email varchar2(20),b_title varchar2(80),b_content varchar2(3000),b_pwd varchar2(12),b_date date,b_hit number default 0 ,b_ip  varchar2(15),b_ref number,b_step number,b_level number,b_fname varchar(15),b_fsize number)";
		stmt1.executeUpdate(sql); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try { 
				stmt1.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}