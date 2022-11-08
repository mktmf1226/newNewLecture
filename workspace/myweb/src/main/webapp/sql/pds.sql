--pds.sql
--포토갤러리 게시판

--테이블 생성
CREATE TABLE tb_pds (
   pdsno      NUMBER         NOT NULL
  ,wname      VARCHAR2(100)  NOT NULL
  ,subject    VARCHAR2(250)  NOT NULL
  ,regdate    DATE           NOT NULL
  ,passwd     VARCHAR2(15)   NOT NULL
  ,readcnt    NUMBER         DEFAULT 0  --조회수
  ,filename   VARCHAR2(250)  NOT NULL   --파일명
  ,filesize   NUMBER         DEFAULT 0  --파일크기
  ,ip		  VARCHAR2(15)
  ,PRIMARY KEY(pdsno)
);

--시퀀스 생성
create sequence pds_seq;

commit;

--행추가
pdsno 					: 시퀀스
wname, subject, passwd 	: 사용자 입력 <form></form>
regdate 				: 오늘날짜 (SYSDATE)
filename, filesize 		: 첨부파일 관련 정보


INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, ip, regdate)
VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)


--전체목록
SELECT pdsno, wname, subject, filename, filesize, regdate, readcnt
FROM tb_pds
ORDER BY regdate DESC

--상세보기
SELECT *
FROM tb_pds
WHERE pdsno=?


--행삭제
글번호와 비밀번호가 일치하면 테이블 행삭제 + /storage폴더에 저장된 첨부파일 삭제
DELETE FROM tb_pds
WHERE pdsno=? AND passwd=?


--행수정
UPDATE tb_pds 
SET wname=?, subject=?, filename=?, filesize=?
WHERE pdsno=? AND passwd=?


