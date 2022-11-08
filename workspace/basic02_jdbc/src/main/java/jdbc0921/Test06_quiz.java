package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test06_quiz {

	public static void main(String[] args) {
		//문제) sno=61 행의 데이터를 아래의 내용으로 수정하시오
		//	   int sno=61;
		//	   String uname="JSPark";
		//	   int kor=90, eng=85, mat=100;
		//	   int tot=(kor+eng+mat);
		//	   int aver=tot/3;
		//	   String addr="Suwon";			

		
		
		
		
		
					
		try {

			String url	   ="jdbc:oracle:thin:@localhost:1521:xe"; 
			String user	   ="system";
			String password="1234";
			String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 연결 성공!!");			
			
			int sno=61;
			String uname="JSPark";
			int kor=90, eng=85, mat=100;
			int tot=(kor+eng+mat);
			int aver=tot/3;
			String addr="Suwon";			
			
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=? ");
			sql.append(" , kor=? ");
			sql.append(" , eng=? ");
			sql.append(" , mat=? ");
			sql.append(" , tot=? ");
			sql.append(" , aver=? ");
			sql.append(" , addr=? ");
			sql.append(" , wdate=sysdate ");
			sql.append(" WHERE sno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			//->  ?의 갯수, 순서, 자료형이 일치해야 한다
			pstmt.setString(1, uname);// 1 -> 첫번째 물음표, uname칼럼
			pstmt.setInt(2, kor); 	  // 2 -> 두번째 물음표, kor칼럼
			pstmt.setInt(3, eng); 	  // 3 -> 세번째 물음표, eng칼럼
			pstmt.setInt(4, mat); 	  // 4 -> 네번째 물음표, mat칼럼
			pstmt.setInt(5, tot); 	  // 5 -> 다섯번째 물음표, tot칼럼
			pstmt.setInt(6, aver); 	  // 6 -> 여섯번째 물음표, aver칼럼
			pstmt.setString(7, addr); // 7 -> 일곱번째 물음표, addr칼럼
			pstmt.setInt(8, sno); 	  // 8 -> 여덟번째 물음표, sno칼럼
			
			int cnt=pstmt.executeUpdate();
			if(cnt==0) {
				System.out.println("행 수정 실패!!");
			}else {
				System.out.println("행 수정 성공~~");
			}//if end
			
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		}//end
		
		System.out.println("END");
		
	}//main() end
}//class end

