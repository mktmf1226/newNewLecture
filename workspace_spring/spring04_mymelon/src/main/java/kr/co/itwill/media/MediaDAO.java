package kr.co.itwill.media;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.mediagroup.MediagroupDTO;

//@Service    DB에 접근하는 모든 코드를 객체생성하여 모아둔다
//@Repository DB에 CRUD 작업에 집중하는 모델클래스로 지정. 스프링컨테이너가 자동으로 객체를 생성해 준다
@Repository
public class MediaDAO {

	//DBOpen dbopen=new DBOpen()와 동일한 형태
	//@Autowired 자동으로 만들어진 객체를 연결
	@Autowired
	private JdbcTemplate jt; 
	
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public MediaDAO() {
		System.out.println("-----MediaDAO() 객체 생성됨");
	}//end

	public List<MediaDTO> list(int mediagroupno){
		List<MediaDTO> list = null;
		try {
			sql=new StringBuilder();
			
			sql.append(" SELECT mediano, title, rdate, poster, filename, filesize, mview, mediagroupno "); 
			sql.append(" FROM media ");
			sql.append(" WHERE mview='Y' AND mediagroupno= " + mediagroupno);
			sql.append(" ORDER BY mediano DESC ");

			RowMapper<MediaDTO> rowMapper=new RowMapper<MediaDTO>() {
				
				@Override
				public MediaDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediaDTO dto=new MediaDTO();
					dto.setMediano(rs.getInt("mediano"));
					dto.setTitle(rs.getString("title"));
					dto.setRdate(rs.getString("rdate"));
					dto.setPoster(rs.getString("poster"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setMview(rs.getString("mview"));
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					return dto;
				}//mapRow() end
			};//RowMapper end
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("media목록 실패 : " + e);
		}//end
		return list;
	}//list() end
	
	
	public int create(MediaDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			// Oracle DB
			//sql.append(" INSERT INTO media(mediano, title, poster, filename, filesize, mediagroupno, rdate) ");
			//sql.append(" VALUES ( media_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			
			// Maria DB
			sql.append(" INSERT INTO media(mediano,");
		    sql.append("             title, rdate, poster, filename, filesize, mview, mediagroupno)");
		    sql.append(" VALUES((select ifnull(max(mediano),0)+1 from media as TB),");
		    sql.append("             ?, now(), ?, ?, ?, 'Y', ?)");
			
			cnt=jt.update(sql.toString(), dto.getTitle(), dto.getPoster(), dto.getFilename(), dto.getFilesize(), dto.getMediagroupno());
		} catch (Exception e) {
			System.out.println("음원등록실패 : " + e);
		}//end
		return cnt;
	}//create() end
	
	
	public MediaDTO read(int mediano){
		MediaDTO dto = null;
		try {
			sql=new StringBuilder();			
			sql.append(" SELECT mediano, title, rdate, poster, filename, filesize, mview, mediagroupno "); 
			sql.append(" FROM media ");
			sql.append(" WHERE mediano= " + mediano);

			RowMapper<MediaDTO> rowMapper=new RowMapper<MediaDTO>() {				
				@Override
				public MediaDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediaDTO dto=new MediaDTO();
					dto.setMediano(rs.getInt("mediano"));
					dto.setTitle(rs.getString("title"));
					dto.setRdate(rs.getString("rdate"));
					dto.setPoster(rs.getString("poster"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setMview(rs.getString("mview"));
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					return dto;
				}//mapRow() end
			};//RowMapper end
			
			dto=jt.queryForObject(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("상세보기 실패 : " + e);
		}//end
		return dto;
	}//list() end
	
	
	public int delete(int mediano) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" DELETE FROM media ");
			sql.append(" WHERE mediano=? ");
			cnt=jt.update(sql.toString(), mediano);
		} catch (Exception e) {
			System.out.println("삭제실패 : " + e);
		}//end
		return cnt;
	}//delete() end
	
	
	public int update(MediaDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" UPDATE media ");
			sql.append(" SET title=?, poster=?, filename=?, filesize=? ");
			sql.append(" WHERE mediano=? ");
			cnt=jt.update(sql.toString(), dto.getTitle(), dto.getPoster() 
										, dto.getFilename(), dto.getFilesize(), dto.getMediano());			
		} catch (Exception e) {
			System.out.println("수정실패 : " + e);
		}//end
		return cnt;
	}//update() end

	
	
}//class end
