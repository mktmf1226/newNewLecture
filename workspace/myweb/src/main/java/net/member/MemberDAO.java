package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;

public class MemberDAO {//Data Access Object
						//DB 접근 객체
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public MemberDAO() {
		dbopen=new DBOpen();
	}//end

	
	//비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		String mlevel=null;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel IN('A1', 'B1', 'C1', 'D1') ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				mlevel=rs.getString("mlevel");
				System.out.println("로그인 성공");
			}else {
				mlevel=null;
				System.out.println("자료없음!");
			}//if end			
		}catch (Exception e) {
			System.out.println("로그인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return mlevel;
	}//loginProc() end
	
	
	public int duplecateID(String id) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(id) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				cnt=rs.getInt("cnt");
			}else {
				cnt=0;
				System.out.println("sql조회 실패 결과 0행");
			}//if end			
		}catch (Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//duplecateID() end
	
	
	public int duplecateEmail(String email) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(email) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				cnt=rs.getInt("cnt");
			}else {
				cnt=0;
				System.out.println("sql조회 실패 결과 0행");
			}//if end			
		}catch (Exception e) {
			System.out.println("이메일 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//duplecateEmail() end
	
	
	public int create(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" VALUES(?,?,?,?,?,?,?,?,?,'D1',sysdate) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());			
			
			cnt=pstmt.executeUpdate();			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
	
	
	public boolean findID(MemberDTO dto) {
		boolean flag=false;
		try {
			con=dbopen.getConnection();			
			sql=new StringBuilder();
			
			//이름과 이메일이 일치하는 id 가져오기
			sql.append(" SELECT id ");
			sql.append(" FROM member ");
			sql.append(" WHERE mname=? AND email=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//이름과 이메일 일치되었다면
				String id=rs.getString("id"); //1)아이디
				
				//[임시 비밀번호 발급]
				//대문자, 소문자, 숫자를 이용해서 랜덤하게 10글자를 만들기
				String[] ch= {
						"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
						"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
						"0","1","2","3","4","5","6","7","8","9"
				};//ch[0]~ch[61] 인덱스
				
				//ch배열에서 랜덤하게 10글자 뽑아서 가져오기
				StringBuilder imsiPW=new StringBuilder(); //2)임시 비밀번호
				for(int i=0; i<10; i++) { //10회 반복
					int num=(int)(Math.random()*ch.length); //0~61 난수 발생
					imsiPW.append(ch[num]); //ch[0~61] 랜덤값 append
				}//for end
				
				//임시 비밀번호로 테이블 수정하기
				sql=new StringBuilder(); //위에서 선언된 sql을 delete로 비우고 써도 됨
				sql.append(" UPDATE member ");
				sql.append(" SET passwd=? ");
				sql.append(" WHERE mname=? AND email=? ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, imsiPW.toString()); //임시비밀번호
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getEmail());			

				int cnt=pstmt.executeUpdate();//업데이트 성공한 행갯수 반환
				if(cnt==1) {
					//임시 비밀번호로 테이블 수정되었다면, 아이디와 비밀번호를 이메일 전송하기
					String content="※ 임시 비밀번호로 로그인 후, 회원 정보 수정에서 비밀번호를 변경하시기 바랍니다";
					content += "<hr>";
					content += "<table border='1'>";
					content += "<tr>";
					content += "	<th>아이디</th>";
					content += "	<td>" + id + "</td>";
					content += "</tr>";
					content += "<tr>";
					content += "	<th>임시비밀번호</th>";
					content += "	<td>" + imsiPW.toString() + "</td>";
					content += "</tr>";
					content += "</table>";
					
					
					String mailServer="mw-002.cafe24.com"; //메일서버(POP3/SMTP) 지정하기
					Properties props=new Properties();
					props.put("mail.smtp.host", mailServer);
					props.put("mail.smtp.auth", true);					
					Authenticator myAuth= new MyAuthenticator(); //메일서버에서 인증받은 계정+비번		
					Session sess=Session.getInstance(props, myAuth); //유효한지 검증
					
					InternetAddress[] address={ new InternetAddress(dto.getEmail()) } ;//받는 사람 이메일 주소
					Message msg=new MimeMessage(sess);//메일 관련 정보 작성시작
					msg.setRecipients(Message.RecipientType.TO, address);//받는사람
					msg.setFrom(new InternetAddress("mktmf1226@gmail.com"));//보내는 사람
					msg.setSubject("MyWeb 아이디/비번 입니다");//메일 제목
					msg.setContent(content, "text/html; charset=UTF-8");//메일 내용(content, 타입)
					msg.setSentDate(new Date());//메일 보낸날짜 오늘
					Transport.send(msg);//메일 전송
					
					flag=true; //최종적으로 성공
				}//if end
				
			}else {
				flag=false;
				System.out.println("아이디찾기 자료없음!");
			}//if end			
		}catch (Exception e) {
			System.out.println("아이디/비번 찾기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return flag;
	}//loginProc() end
	
	
	public MemberDTO read(String id) {
		MemberDTO dto=null;
		try {
			con=dbopen.getConnection(); //DB연결		
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();//select문 실행		
			if(rs.next()) {	//cursor가 있는지?
				dto=new MemberDTO();
				dto.setId(id);
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
			}else {
				dto=null;
			}//if end
		}catch (Exception e) {
			System.out.println("read 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return dto;
	}//read() end
	
	
	public int updateproc(MemberDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결		
			
			sql=new StringBuilder();
			sql.append(" UPDATE member ");
			sql.append(" SET passwd=? ");
			sql.append(" , tel=? ");
			sql.append(" , zipcode=? ");
			sql.append(" , address1=? ");
			sql.append(" , address2=? ");
			sql.append(" , job=? ");
			sql.append(" WHERE id=? ");
					
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());		
			pstmt.setString(7, dto.getId());		
	
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("회원정보 수정 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//updateproc() end
	
	
	public int memberWithdraw(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결					
			sql=new StringBuilder();
			sql.append(" UPDATE member ");
			sql.append(" SET mlevel='F1' ");
			sql.append(" WHERE id=? and passwd=? ");					
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());		
			pstmt.setString(2, dto.getPasswd());		
			cnt=pstmt.executeUpdate();

		}catch (Exception e) {
			System.out.println("회원탈퇴 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//memberWithdraw() end
	

	
	
	
}//class end
