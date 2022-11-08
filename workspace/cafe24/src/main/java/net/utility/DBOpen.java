package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	//Maria DB 연결 메소드
	public Connection getConnection() {
		Connection con=null;
		try {
			String url      = "jdbc:mysql://localhost/mktmf1226";
		    String user     = "mktmf1226";
		    String password = "sh33mimi";
		    String driver   = "org.gjt.mm.mysql.Driver";
		    
		    Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
		}catch (Exception e) {
			System.out.println("Maria DB연결실패:" + e);
		}//end
		return con;
	}//getConnection() end	
}//class end
