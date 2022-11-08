package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_quiz { 
	public static void main(String[] args) {
		//문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
		/*
				g1001  p001  OOP
				g1001  p003  JSP
				g1001  d001  웹표준
		*/		
		String hakno="g1001";
	
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
			sql.append(" SELECT SU.hakno, SU.gcode, gname ");
			sql.append(" FROM tb_sugang SU JOIN tb_gwamok GW ");
			sql.append(" ON SU.gcode = GW.gcode ");
			sql.append(" WHERE SU.hakno=? ");			
			sql.append(" ORDER BY SU.gcode DESC ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setString(1, hakno);			
			
			rs=pstmt.executeQuery();//select문 실행			
			if(rs.next()) {	//cursor가 있는지?
				System.out.println("자료 있음~");
				do {
					System.out.print(rs.getString("hakno") + " "); //SU.hakno 에러
					System.out.print(rs.getString("gcode") + " "); //SU.gcode 에러
					System.out.print(rs.getString("gname") + " ");
					System.out.println();//한줄 끝나면 줄바꿈
				}while(rs.next());//다음 cursor가 있는지? true->반복
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

