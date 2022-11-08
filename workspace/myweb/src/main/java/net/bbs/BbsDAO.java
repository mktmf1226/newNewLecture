package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public BbsDAO() {
		dbopen=new DBOpen();
	}//end
	
	//행추가 메소드
	public int create(BbsDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno),0)+1 from tb_bbs)) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname()); 	// 1 -> 첫번째 물음표, wname칼럼
			pstmt.setString(2, dto.getSubject()); 	// 2 -> 두번째 물음표, subject칼럼
			pstmt.setString(3, dto.getContent()); 	// 3 -> 세번째 물음표, content칼럼
			pstmt.setString(4, dto.getPasswd()); 	// 4 -> 네번째 물음표, passwd칼럼
			pstmt.setString(5, dto.getIp()); 		// 5 -> 다섯번째 물음표, ip칼럼
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end	
	
	
	public ArrayList<BbsDTO> list(){
		ArrayList<BbsDTO> list=null; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent, grpno ");
			sql.append(" FROM tb_bbs ");
			sql.append(" ORDER BY grpno DESC, ansnum ASC ");

			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				list=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					BbsDTO dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					dto.setGrpno(rs.getInt("grpno"));
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
	
	
	public int count() {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM tb_bbs ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행			
			if(rs.next()) {	//cursor가 있는지?
				cnt=rs.getInt("cnt");
			}//if end
		}catch (Exception e) {
			System.out.println("전체목록 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//count() end
	
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto=null;
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();//select문 실행			
			if(rs.next()) {	//cursor가 있는지?
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIp(rs.getString("ip"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
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
	
	
	public void incrementCnt(int bbsno) {
		try {
			con=dbopen.getConnection(); //DB연결

			sql=new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET readcnt=readcnt+1 ");
			sql.append(" WHERE bbsno=? ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno); // 1 -> 첫번째 물음표, bbsno칼럼
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("조회수 증가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
	}//incrementCnt() end
	
	
	public int delete(BbsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결		
			
			sql=new StringBuilder();
			sql.append(" DELETE FROM tb_bbs ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("삭제 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//delete() end
	
	
	public int updateproc(BbsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결		
			
			sql=new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET wname=?, subject=?, content=?, ip=? ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
			pstmt.setString(1, dto.getWname()); 	// 1 -> 첫번째 물음표, wname칼럼
			pstmt.setString(2, dto.getSubject()); 	// 2 -> 두번째 물음표, subject칼럼
			pstmt.setString(3, dto.getContent()); 	// 3 -> 세번째 물음표, content칼럼
			pstmt.setString(4, dto.getIp()); 		// 4 -> 네번째 물음표, ip칼럼
			pstmt.setInt(5, dto.getBbsno());
			pstmt.setString(6, dto.getPasswd());			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("수정 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//updateProc() end
	
	
	public ArrayList<BbsDTO> hotlist(){
		ArrayList<BbsDTO> hotlist=null; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, readcnt, indent ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE readcnt>=10 ");
			sql.append(" ORDER BY readcnt DESC, ansnum ASC ");

			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				hotlist=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					BbsDTO dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setIndent(rs.getInt("indent"));
					hotlist.add(dto); //list 저장
				}while(rs.next());
			}else {
				hotlist=null;
			}//if end
		}catch (Exception e) {
			System.out.println("인기목록 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return hotlist;	
	}//list() end
	
	
	
	
	public ArrayList<BbsDTO> newlist(){
		ArrayList<BbsDTO> newlist=null; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM ( ");
			sql.append(" 		SELECT bbsno, wname, subject, readcnt, indent, rownum AS r ");
			sql.append(" 		FROM ( ");
			sql.append(" 				SELECT bbsno, wname, subject, readcnt, indent ");
			sql.append(" 				FROM tb_bbs ");
			sql.append(" 				WHERE (months_between(regdt, (SELECT sysdate FROM dual)))=0 ");
			sql.append(" 				ORDER BY regdt DESC, ansnum ASC ");
			sql.append(" 			  ) ");
			sql.append(" 	  ) ");
			sql.append(" WHERE rownum>=1 AND rownum<=5 ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				newlist=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					BbsDTO dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setIndent(rs.getInt("indent"));
					newlist.add(dto); //list 저장
				}while(rs.next());
			}else {
				newlist=null;
			}//if end
		}catch (Exception e) {
			System.out.println("새글목록 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return newlist;	
	}//list() end	
	
	
	
	public int reply(BbsDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder(); //sql문 객체생성
			
			//1)부모글 정보 가져오기(select문)
			int grpno = 0;
			int indent = 0;
			int ansnum = 0;
			sql.append(" SELECT grpno, indent, ansnum ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());			
			rs=pstmt.executeQuery();//select문 실행			
			if(rs.next()) {	//cursor가 있는지?
				//그룹번호 : 부모글 그룹번호 그대로 가져오기
				grpno=rs.getInt("grpno");
				//들여쓰기 : 부모글 들여쓰기 	+1
				indent=rs.getInt("indent")+1;
				//글순서	 : 부모글 글순서	+1
				ansnum=rs.getInt("ansnum")+1;
			}//if end
			
			//2)글순서 재조정하기(update문)
			sql.delete(0, sql.length()); //1)단계에서 사용했던 sql값 지우기
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET ansnum=ansnum+1 ");
			sql.append(" WHERE grpno=? AND ansnum>=? ");			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);			
			pstmt.setInt(2, ansnum);			
			pstmt.executeUpdate();			
			

			//3)답변글 추가하기(insert문)
			sql.delete(0, sql.length());
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname()); 	// 1 -> 첫번째 물음표, wname칼럼
			pstmt.setString(2, dto.getSubject()); 	// 2 -> 두번째 물음표, subject칼럼
			pstmt.setString(3, dto.getContent()); 	// 3 -> 세번째 물음표, content칼럼
			pstmt.setString(4, dto.getPasswd()); 	// 4 -> 네번째 물음표, passwd칼럼
			pstmt.setString(5, dto.getIp()); 		// 5 -> 다섯번째 물음표, ip칼럼
			pstmt.setInt(6, grpno); 				// 6 -> 1)단계에서 만든 그룹번호
			pstmt.setInt(7, indent); 				// 7 -> 1)단계에서 만든 들여쓰기
			pstmt.setInt(8, ansnum); 				// 8 -> 1)단계에서 만든 글순서
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("답변쓰기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//replay() end
	
	
	public int count2(String col, String word) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM tb_bbs ");
			
			if(word.length()>=1) { //검색어가 존재한다면
				String search="";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%'";
					search += " OR    content LIKE '%" + word + "%'";
				}else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				}else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				}else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				}//if end
				sql.append(search);
			}//if end
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {
				cnt=rs.getInt("cnt");//cnt컬럼의 값 반환
			}//if end
		}catch (Exception e) {
			System.out.println("검색 글갯수 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//count2() end
	
	
	public int countchild(int grpno) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT MAX(indent) AS cnt ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE grpno=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {
				cnt=rs.getInt("cnt");//cnt컬럼의 값 반환
			}//if end
		}catch (Exception e) {
			System.out.println("답변수 실패: " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//countChild() end
	
	
	
	public ArrayList<BbsDTO> list2(String col, String word){
		ArrayList<BbsDTO> list=null; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent, grpno ");
			sql.append(" FROM tb_bbs ");			

			if(word.length()>=1) { //검색어가 존재한다면
				String search="";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%'";
					search += " OR    content LIKE '%" + word + "%'";
				}else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				}else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				}else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				}//if end
				sql.append(search);
			}//if end
			
			sql.append(" ORDER BY grpno DESC, ansnum ASC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				list=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					BbsDTO dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					dto.setGrpno(rs.getInt("grpno"));
					list.add(dto); //list 저장
				}while(rs.next());
			}else {
				list=null;
			}//if end
		}catch (Exception e) {
			System.out.println("검색 리스트 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return list;	
	}//list2() end

	
	
	public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage){
		ArrayList<BbsDTO> list=null; //성공 또는 실패 여부 변환
		
		//페이지당 출력할 행의 갯수(10개를 기준)
		//1 페이지 : WHERE r>=1  AND r<=10;
		//2 페이지 : WHERE r>=11 AND r<=20;
		//3 페이지 : WHERE r>=21 AND r<=30;
		int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
		
		try {
			con=dbopen.getConnection(); //DB연결			
			sql=new StringBuilder();

			word=word.trim(); //검색어 좌우 공백 제거
			
			if(word.length()==0) {//검색하지 않는 경우				
				sql.append(" SELECT * ");
				sql.append(" FROM ( ");
				sql.append(" 		SELECT bbsno, subject, wname, readcnt, indent, regdt, grpno, rownum as r ");
				sql.append(" 		from ( ");
				sql.append(" 				SELECT bbsno, subject, wname, readcnt, indent, regdt, grpno ");
				sql.append(" 				FROM tb_bbs ");
				sql.append(" 				ORDER BY grpno DESC, ansnum ASC ");
				sql.append(" 			  ) ");
				sql.append(" 	  ) ");
				sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
				
			}else {//검색 하는 경우				

				sql.append(" SELECT * ");
				sql.append(" FROM ( ");
				sql.append(" 		SELECT bbsno, subject, wname, readcnt, indent, regdt, grpno, rownum as r ");
				sql.append(" 		from ( ");
				sql.append(" 				SELECT bbsno, subject, wname, readcnt, indent, regdt, grpno ");
				sql.append(" 				FROM tb_bbs ");
				
				String search="";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%'";
					search += " OR    content LIKE '%" + word + "%'";
				}else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				}else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				}else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				}//if end
				sql.append(search);
				
				sql.append(" 				ORDER BY grpno DESC, ansnum ASC ");
				sql.append(" 			  ) ");
				sql.append(" 	  ) ");
				sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
			}//if end
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();//select문 실행
			
			if(rs.next()) {	//cursor가 있는지?
				//전체 행을 저장
				list=new ArrayList<>();
				do {
					//커서가 가리키는 한줄 저장
					BbsDTO dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					dto.setGrpno(rs.getInt("grpno"));
					list.add(dto); //list 저장
				}while(rs.next());
			}else {
				list=null;
			}//if end
		}catch (Exception e) {
			System.out.println("검색 리스트 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return list;	
	}//list3() end
	
	
	
	
}//class end