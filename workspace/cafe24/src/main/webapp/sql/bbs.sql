--Maria DB 기반

--bbs.sql

--답변형 게시판 테이블 생성
CREATE TABLE tb_bbs (
       bbsno        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
       ,wname       VARCHAR(20)   NOT NULL
       ,subject     VARCHAR(100)  NOT NULL
       ,content     TEXT          NOT NULL
       ,grpno       TINYINT       NOT NULL
       ,indent      TINYINT       DEFAULT 0    NOT NULL
	   ,ansnum      TINYINT       DEFAULT 0    NOT NULL
       ,regdt       DATETIME      NOT NULL
       ,passwd      VARCHAR(15)   NOT NULL
       ,readcnt     INT           DEFAULT 0    NOT NULL
       ,ip          VARCHAR(15)   NOT NULL
  );

--행추가 테스트
insert into tb_bbs(wname,subject,content,grpno,passwd,ip,regdt)
values('무궁화','대한민국','오필승코리아',(select ifnull(max(bbsno),0)+1 from tb_bbs as TB),'1234','127.0.0.1',now());
    
    
				sql.append(" SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt, r ");
				sql.append(" FROM( ");
				sql.append(" 		SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt, @RNUM := @RNUM + 1 AS r ");
				sql.append("       FROM ( ");
				sql.append("     		  SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt ");
				sql.append("              FROM tb_bbs ");
				
				String search = "";
				if(col.equals("subject_content")) {
					search += "
WHERE subject LIKE '%" + word + "%' ";
					search += " OR content LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				}// if end
				
				sql.append(search);
				sql.append("   ORDER BY grpno DESC, ansnum ASC ");
				sql.append("
)A, ( SELECT @RNUM := 0 ) B ");
				sql.append(" )C WHERE r>=" + startRow + "AND r<=" + endRow );
			}
    
    