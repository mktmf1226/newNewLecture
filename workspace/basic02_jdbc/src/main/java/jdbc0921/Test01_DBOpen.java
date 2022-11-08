package jdbc0921;

import java.sql.*; //데이터베이스연동 클래스




public class Test01_DBOpen {

	public static void main(String[] args) {
		//Oracle DB 18c XE 연결
		
		try {
			
			//1)오라클DB 서버 연결 관련 정보
			//url= jdbc:oracle:thin:@  	오라클연결 명령어
			//localhost || 127.0.0.1   	둘 다 가능
			//:1521 					소프트웨어번호 오라클전용포트
			//:xe   					버전이름
			String url	   ="jdbc:oracle:thin:@localhost:1521:xe"; 
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
			
			//2)드라이버 로딩
			Class.forName(driver);
						
			//3)오라클 DB 서버 연결
			DriverManager.getConnection(url, user, password);
			
			System.out.println("오라클 DB 연결 성공!!");		
			
			
		}catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}//end
		
		
		
		
		
		
		
		
		
		
	}//main() end
}//class end
