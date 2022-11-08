package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_selectOne { 
	public static void main(String[] args) {
		// sungjuk 테이블에서 한 행 가져오기
		int sno=61;
	
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
			sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setInt(1, sno); //sql문에서 ?문자의 첫번째는 sno변수로 지정	

			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {	//cursor가 있는지?
				System.out.println("자료 있음~");
				//1)칼럼순서 접근
				System.out.println(rs.getInt(1)); 	//1번칼럼. sno칼럼
				System.out.println(rs.getString(2));//2번칼럼. uname칼럼
				System.out.println(rs.getInt(3));	//3번칼럼. kor칼럼
				System.out.println(rs.getInt(4));	//4번칼럼. eng칼럼
				System.out.println(rs.getInt(5));	//5번칼럼. mat칼럼
				System.out.println(rs.getInt(6));	//6번칼럼. tot칼럼
				System.out.println(rs.getInt(7));	//7번칼럼. aver칼럼
				System.out.println(rs.getString(8));//8번칼럼. addr칼럼
				System.out.println(rs.getString(9));//9번칼럼. wdate칼럼
				
				//2)칼럼명 접근
				System.out.println(rs.getInt("sno"));
				System.out.println(rs.getString("uname"));
				System.out.println(rs.getInt("kor"));
				System.out.println(rs.getInt("eng"));
				System.out.println(rs.getInt("mat"));
				System.out.println(rs.getInt("tot"));
				System.out.println(rs.getInt("aver"));
				System.out.println(rs.getString("addr"));
				System.out.println(rs.getString("wdate"));

				
				
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

