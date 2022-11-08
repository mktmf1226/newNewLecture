package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class SungjukDAO { //Data Access Object
						  //데이터베이스 관련 비지니스 로직 구현
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public SungjukDAO() {
		dbopen=new DBOpen();
	}//end
	
	//행추가 메소드
	public int insert(String uname, int kor, int eng, int mat, int aver, String addr) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, aver, wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uname); // 1 -> 첫번째 물음표, uname칼럼
			pstmt.setInt(2, kor); 	  // 2 -> 두번째 물음표, kor칼럼
			pstmt.setInt(3, eng); 	  // 3 -> 세번째 물음표, eng칼럼
			pstmt.setInt(4, mat); 	  // 4 -> 네번째 물음표, mat칼럼
			pstmt.setInt(5, aver); 	  // 5 -> 다섯번째 물음표, aver칼럼
			pstmt.setString(6, addr); // 6 -> 여섯째 물음표, addr칼럼
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//insert() end
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	public int create(SungjukDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname()); // 1 -> 첫번째 물음표, uname칼럼
			pstmt.setInt(2, dto.getKor()); 	  	// 2 -> 두번째 물음표, kor칼럼
			pstmt.setInt(3, dto.getEng()); 	  	// 3 -> 세번째 물음표, eng칼럼
			pstmt.setInt(4, dto.getMat()); 	  	// 4 -> 네번째 물음표, mat칼럼
			pstmt.setInt(5, dto.getAver()); 	// 5 -> 다섯번째 물음표, aver칼럼
			pstmt.setString(6, dto.getAddr()); 	// 6 -> 여섯째 물음표, addr칼럼
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
	
	
	public ArrayList<SungjukDTO> list() {
		//DB에서 가져온 데이터(rs)를 한꺼번에 모아서(ArrayList)
		//sungjukList.jsp에 전달한다
		ArrayList<SungjukDTO> list=null;
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY sno DESC ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				list=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					SungjukDTO dto=new SungjukDTO();
					dto.setSno(rs.getInt("sno"));
					dto.setUname(rs.getString("uname"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setWdate(rs.getString("wdate"));
					list.add(dto); //list 저장
				}while(rs.next());
			}else {
				list=null;
			}//if end					
		}catch (Exception e) {
			System.out.println("목록 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return list;
	}//list() end
	
	
	public SungjukDTO read(int sno) {
		SungjukDTO dto=null;
		try {
			con=dbopen.getConnection(); //DB연결		
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setInt(1, sno); // 1 -> 첫번째 물음표, sno칼럼			
			rs=pstmt.executeQuery();//select문 실행		
			if(rs.next()) {	//cursor가 있는지?
				dto=new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
			}else {
				dto=null;
			}//if end
		}catch (Exception e) {
			System.out.println("상세보기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return dto;
	}//read() end
	
	
	public int delete(int sno) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결		
			
			sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setInt(1, sno);
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("삭제 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//delete() end
	
	
	public int updateproc(SungjukDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=? ");
			sql.append(" , kor=? ");
			sql.append(" , eng=? ");
			sql.append(" , mat=? ");
			sql.append(" , aver=? ");
			sql.append(" , addr=? ");
			sql.append(" , wdate=sysdate "); //입력일을 수정일로
			sql.append(" WHERE sno=? ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname()); // 1 -> 첫번째 물음표, uname칼럼
			pstmt.setInt(2, dto.getKor()); 	  	// 2 -> 두번째 물음표, kor칼럼
			pstmt.setInt(3, dto.getEng()); 	  	// 3 -> 세번째 물음표, eng칼럼
			pstmt.setInt(4, dto.getMat()); 	  	// 4 -> 네번째 물음표, mat칼럼
			pstmt.setInt(5, dto.getAver()); 	// 5 -> 다섯번째 물음표, aver칼럼
			pstmt.setString(6, dto.getAddr()); 	// 6 -> 여섯째 물음표, addr칼럼
			pstmt.setInt(7, dto.getSno()); 	  	// 7 -> 일곱번째 물음표, sno칼럼
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//update() end
	
}//class end

