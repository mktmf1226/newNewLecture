package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class PdsDAO {
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public PdsDAO() {
		dbopen=new DBOpen();
	}//end
	
	public int create(PdsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, ip, regdate) ");
			sql.append(" VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());	
			pstmt.setString(6, dto.getIp());	
			
			cnt=pstmt.executeUpdate();			
		}catch (Exception e) {
			System.out.println("포토갤러리추가 실패: " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
	
	
	public ArrayList<PdsDTO> list(){
		ArrayList<PdsDTO> list=null;
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();
			sql.append(" SELECT pdsno, wname, subject, filename, filesize, regdate, readcnt ");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				list=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					PdsDTO dto=new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcnt(rs.getInt("readcnt"));
					list.add(dto); //list 저장
				}while(rs.next());
			}else {
				list=null;
			}//if end
		}catch (Exception e) {
			System.out.println("전체목록 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return list;	
	}//list() end
	
	
	public PdsDTO read(int pdsno) {
		PdsDTO dto=null;
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM tb_pds ");
			sql.append(" WHERE pdsno=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				dto=new PdsDTO();
				dto.setPdsno(pdsno);
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setIp(rs.getString("ip"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}else {
				dto=null;
			}//if end
		}catch(Exception e) {
			System.out.println("상세보기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return dto;
	}//read() end
	
	public void incrementCnt(int pdsno) {
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET readcnt=readcnt+1 ");
			sql.append(" WHERE pdsno=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
	}//incrementCnt() end
	
	public int delete (int pdsno, String passwd, String saveDir) {
		int cnt=0;
		try {
			
			
			//테이블의 행 삭제하기 전에, 삭제하고자 하는 파일명 가져온다
			String filename="";
			PdsDTO oldDTO=read(pdsno);
			if(oldDTO != null) {
				filename=oldDTO.getFilename();
			}//if end
			con=dbopen.getConnection(); //DB연결	
			sql=new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno=? AND passwd=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, passwd);
			cnt=pstmt.executeUpdate();
			if(cnt==1) {//테이블에서 행삭제가 성공했으므로, 첨부했던 파일도 삭제
				Utility.deleteFile(saveDir, filename); //return형 boolean
			}//if end
			
		}catch (Exception e) {
			System.out.println("삭제 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//delete() end
	
	
	
	public int updateProc(PdsDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결		
	
			
			int pdsno=Integer.parseInt("pdsno");
			
			dto.setPdsno(pdsno);
			
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("포토갤러리 수정 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//updateProc() end

	
	
}//class end
