package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test01_selectCount { 
	public static void main(String[] args) {
		// sungjuk 테이블의 행의 갯수를 출력하시오
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	//select문을 실행한 결과(논리테이블)을 저장

		try {
			String url		= "jdbc:oracle:thin:@localhost:1521:xe";
			String user		= "system";
			String password = "1234";
			String driver	= "oracle.jdbc.driver.OracleDriver";	//ojdbc8.jar
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			System.out.println("오라클 서버 연결 성공!");
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) AS cnt ");
			sql.append(" FROM sungjuk ");
			
			pstmt = con.prepareStatement(sql.toString());	//SQL문 변환 명령어
			rs = pstmt.executeQuery();						//select문 실행

			//cursor : 행을 가리키는 값. 이동할 수 있다.
			if(rs.next()) {		//cursor가 있는지?
				System.out.println("자료 있음~");
				//1) 칼럼 순서 접근
				//-> select 칼럼1, 칼럼2, 칼럼3 ~
				//-> 자료형을 일치하면서 가져온다. (행갯수는 정수 > int값으로 가져옴)
				System.out.println("전체 행 갯수 : " + rs.getInt(1));		//1번째 칼럼 행 갯수
			
				//2) 칼럼명으로 접근
				//-> select cnt ~
				System.out.println("전체 행 갯수 : " + rs.getInt("cnt"));	//cnt 칼럼의 행 갯수

			}else {
				System.out.println("자료 없음!");
			}//if end

		} catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		} finally {	//자원반납(순서주의)
			try {
				if(rs != null) {rs.close(); }
			}catch (Exception e) {}
			try {
				if(pstmt != null) {pstmt.close(); }
			}catch (Exception e) {}
			try {
				if(con != null) {con.close(); }
			}catch (Exception e) {}
		}//end	

		System.out.println("END");

 

		

	}//main() end

}//class end

