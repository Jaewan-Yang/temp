package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBtablemaker_mysql{
	public static void main(String[] args) throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection con= null;
		Statement stmt1 = null;
		String sql = null;
		try { 
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "1234");
		stmt1 = con.createStatement();
		// Oracle
		//sql = "create table tboard(b_id number, b_name varchar2(15),b_email varchar2(20),b_title varchar2(80),b_content varchar2(3000),b_pwd varchar2(12),b_date date,b_hit number default 0 ,b_ip  varchar2(15),b_ref number,b_step number,b_level number,b_fname varchar(15),b_fsize number)";
		// MySQL
		sql = "create table tboard(b_id int(5), b_name varchar(15),b_email varchar(20),b_title varchar(80),b_content varchar(3000),b_pwd varchar(12),b_date date,b_hit int(5) default 0,b_ip varchar(15),b_ref int(5),b_step int(5),b_level int(5),b_fname varchar(15),b_fsize int(5))";
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