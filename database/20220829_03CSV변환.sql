
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202207\database\20220829_03CSV변환.sql
///////////////////////////////////////////////////////////////////////////////

● [CSV 파일]
  - 모든 데이터가 , 로 구분되어 있는 파일
  
● [CSV 파일을 데이터베이스로 가져오기]
  - 공공데이터포털 https://data.go.kr/ 활용
  
  
  
문) 도로명 우편번호 테이블 구축하기

--1) zipdoro.csv준비 (258267행)


--2) zipdoro.csv 내용을 저장하는 zipdoro테이블 생성
create table zipdoro (
    zipno      char(5)        --우편번호
   ,zipaddress varchar(1000)  --주소 
);

commit;
drop table zipdoro; --테이블 삭제

--3) 가져오기와 내보내기
  - zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
  - zipdoro 테이블 우클릭 -> export      (내보내기)

select count(*) from zipdoro; --258267행

select * from zipdoro;


--서울특별시 강남구로 시작되는 우편번호가 몇개인지 확인하시오
select count(*) 
from zipdoro
where zipaddress like '서울특별시 강남구%';

select count(*) 
from zipdoro
where zipno like '_6___';

select zipno, count(zipno) 
from zipdoro
where zipaddress like '서울특별시 강남구%'
group by zipno;
////////////////////////////////////////////////////////////////////

문2) 한국교원대학교_초중등학교위치.csv를 변환하시오 (11874행)

create table school (
    schoolid    varchar2(10)     --학교ID
   ,schoolname  varchar2(255)   --학교명 
   ,schoolgubun varchar2(20)    --학교급구분
   ,schooladdr  varchar2(255)   --소재지도로명주소
   ,cdate       date             --생성일자 (형식 YYYY-MM-DD)
   ,udate       date             --변경일자 (형식 YYYY-MM-DD)
   ,latitude    number(20,10)    --위도
   ,longitude   number(20,10)    --경도
);

commit;
select count(*) from school;
select * from school;

select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null;      --B000027304행에서 비어있음
select * from school where cdate is null;
select * from school where udate is null;
select * from school where latitude is null;
select * from school where longitude is null;


문) 각 시도별 초등학교 중학교 구하기
(서울특별시, 부산광역시, 대구광역시, 인천광역시, 광주광역시, 대전광역시, 울산광역시, 
경기도, 광원도, 충청북도, 충청남도, 세종특별자치시, 전라북도, 전라남도, 경상북도, 경상남도, 경남,
제주특별자치도, 충북, 전북, 대구, 경북)

select substr(schooladdr, 1, instr(schooladdr, ' ')), schoolgubun, count(*)
from school
where schoolgubun='초등학교' or schoolgubun='중학교'
group by substr(schooladdr, 1, instr(schooladdr, ' ')), schoolgubun
order by substr(schooladdr, 1, instr(schooladdr, ' '));


select
     nvl(cho.addr1, '-') as 지역
    ,nvl(cho.ckinds, '초등학교') as 학교구분
    ,nvl(cho.c_cnt, 0) as 갯수
    ,nvl(jung.addr2, '-') as 지역
    ,nvl(jung.jkinds, '중학교') as 학교구분
    ,nvl(jung.j_cnt, 0) as 갯수
from(
    select addr1, ckinds, count(*) as c_cnt
    from (
        select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr1, schoolgubun as ckinds
        from school
        )
    group by addr1, ckinds
    having ckinds like '초%'
    ) cho full join (
                select addr2, jkinds
, count(*) as j_cnt
                from (
                    select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr2, schoolgubun as jkinds
                    from school
                    )
                group by addr2, jkinds
                having jkinds like '중%'
                ) jung
on cho.addr1 = jung.addr2
order by cho.addr1;

/*
create table tb_school (
    schno   char(10)        --학교ID
   ,schname varchar(1000)   --학교명 
   ,grade   varchar(100)    --학교급구분
   ,address varchar(1000)   --소재지도로명주소
   ,regdt   date            --생성일자
   ,condt   date            --변경일자
   ,letitd  number(12,9)    --위도
   ,longitd number(12,9)    --경도
);
*/

/*
commit;
drop table tb_school;
select count(*) from tb_school;

select *
from tb_school
where schno is null or
      schname is null or
      grade is null or
      address is null or
      regdt is null or
      condt is null or
      letitd is null or
      longitd is null;
*/
