package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_selectPaging { 
	public static void main(String[] args) {
		//페이징
		//문제) sungjuk테이블에서 이름순으로 정렬 후 행번호 4~6만 조회하시오
		int start=4;
		int end=6;
	
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
			sql.append(" SELECT * ");
			sql.append(" FROM ( ");
			sql.append(" 	  SELECT uname, aver, addr, rownum AS rnum ");
			sql.append(" 	  FROM ( ");
			sql.append(" 		    SELECT uname, aver, addr ");
			sql.append(" 		    FROM sungjuk ");
			sql.append(" 		    ORDER BY uname ");
			sql.append(" 		   ) ");
			sql.append(" ) ");
			sql.append(" WHERE rnum>=? AND rnum<=? ");

			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setInt(1, start);			
			pstmt.setInt(2, end);			
			
			rs=pstmt.executeQuery();//select문 실행			
			if(rs.next()) {	//cursor가 있는지?
				System.out.println("자료 있음~");
				do {
					System.out.print(rs.getInt("rnum") + " ");
					System.out.print(rs.getString("uname") + " ");
					System.out.print(rs.getInt("aver") + " ");
					System.out.print(rs.getString("addr") + " ");
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

