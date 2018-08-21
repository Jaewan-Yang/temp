package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SBtablemaker{
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
		con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");
		stmt1 = con.createStatement();
		sql = "create table tmember(mem_uid varchar2(15) primary key,mem_pwd varchar2(15) not null,mem_name varchar2(10) not null,mem_email varchar2(50),mem_regdate date,mem_address varchar2(100))";
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