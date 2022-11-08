
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202202\database\20220822_05group.sql
////////////////////////////////////////////////////////////////

● [데이터 그룹화]


-- sungjuk_seq시퀀스 삭제
drop sequence sungjuk_seq;

-- sungjuk테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- sungjuk테이블 삭제
drop table sungjuk;

-- sungjuk테이블 생성
create table sungjuk (
    sno    int          primary key                  
   ,uname  varchar(50)  not null                         
   ,kor    int          check(kor between 0 and 100)                    
   ,eng    int          check(eng between 0 and 100)                    
   ,mat    int          check(mat between 0 and 100)
   ,addr   varchar(20)  check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int          default 0
   ,aver   int          default 0
   ,wdate  date         default sysdate              
);

--sungjuk테이블 입력 데이터
※ 참조 i:\java202202\database\20220822_03성적테이블.sql

commit;
select count(*) from sungjuk;  --전체 레코드 갯수
select * from sungjuk;

//////////////////////////////////////////////////////////////////

● [distinct]
  - 칼럼에 중복내용이 있으면 대표값 1개만 출력
  - 형식) distinct 칼럼명

select addr from sungjuk;
select addr from sungjuk order by addr;         --asc 생략가능
select addr from sungjuk order by addr asc;     --오름차순
select addr from sungjuk order by addr desc;    --내림차순

select distinct (addr) from sungjuk order by addr desc;
select distinct (uname) from sungjuk;   -- 중복데이터가 거의 없는 칼럼

/////////////////////////////////////////////////////////////////////////////

● [group by]
  - 칼럼에 동일 내용끼리 그룹화 시킴
  - 형식) group by 칼럼1, 칼럼2, 칼럼3, ~~~

-- 주소가 동일한 값을 그룹화시키고 주소를 조회
select addr         --그룹별 출력값은 하나
from sungjuk
group by addr;      --distinct와 결과값 동일

--ORA-00979: GROUP BY 표현식이 아닙니다. 00979. 00000 -  "not a GROUP BY expression"
select addr, uname  --그룹시키고 나올 수 있는 값은 1개만 가능하다
from sungjuk
group by addr;      --에러


--문1) 주소별 인원수를 조회하시오
select addr, count (*)
from sungjuk
group by addr;


select addr, count (*) as cnt --칼럼명 임시 부여
from sungjuk
group by addr;

select addr, count (*) cnt    --as 생략
from sungjuk
group by addr;

--주소별 오름차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr;

--주소별 인원수를 내림차순으로 정렬해서 조회
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    --해석순서3)
from sungjuk                    --해석순서1)
group by addr                   --해석순서2)
order by cnt desc;              --해석순서4)

///////////////////////////////////////////////////////////////////////////////

● [집계함수]

--문2) 주소별 국어점수에 대해서 집계하시오
--     갯수, 최대값, 최소값, 합계, 평균
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)     
from sungjuk
group by addr;

--주소 순으로 정렬
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)     
from sungjuk
group by addr
order by addr;

--round(값, 0) 소수점 이하값에서 반올림하고 소수점은 없음
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor),0)   
from sungjuk
group by addr
order by addr;

--국어평균을 소수점 없이 반올림하고 내림차순 정렬해서 조회
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor),0)   
from sungjuk
group by addr
order by round(avg(kor),0) desc;

--칼럼명 부여
select addr
      ,count(*) as cnt
      ,max(kor) as max_kor
      ,min(kor) as min_kor
      ,sum(kor) as sum_kor
      ,round(avg(kor),0) as avg_kor
from sungjuk
group by addr
order by avg_kor desc;


--문3) 총점(tot), 평균(aver) 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
select * from sungjuk;

--문4) 평균(aver)이 80점이상 행을 대상으로 주소별 인원수를 인원수순으로 조회하시오
select addr, count(*)       --4)주소별, 인원수를
from sungjuk                --1)성적테이블에서
where aver>=80              --2)평균80점이상 행만을
group by addr               --3)주소별
order by count(*);          --5)인원수순으로 정렬조회

commit;
///////////////////////////////////////////////////////////////////////////////

● [2차 그룹]

--주소별 순으로 조회하시오
select addr, kor, eng, mat from sungjuk order by addr, kor;

--주소별(1차) 그룹을 하고, 주소가 같다면 국어점수(2차)로 그룹화 하기
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

--국영수 동점자 인원수
--1차그룹(kor), 2차그룹(eng), 3차그룹(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;
///////////////////////////////////////////////////////////////////////////////

● [having 조건절]
  - group by 와 같이 사용하는 조건절
  - 그룹화를 하고 난 후의 조건절을 추가
  - 형식) having 조건절

-- 주소별 인원수를 조회하시오
select addr, count(*)
from sungjuk
group by addr;

-- 주소별 인원수가 3인 행을 조회하시오
select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- 주소별 인원수가 3인 행을 조회하시오
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;


--문5) 주소별 국어평균값이 50이상 행을 조회하시오
--    (단, 평균값은 소수점없이 반올림)

1)주소별 국어평균값 구하기
select addr, avg(kor)
from sungjuk
group by addr;

2)국어평균값을 소수점에서 반올림하기
select addr, round(avg(kor),0)
from sungjuk
group by addr;

3) 2)결과에서 국어평균값이 50이상 조회하기
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

4) 3)결과에서 국어평균값을 내림차순으로 정렬하고 칼럼이름을 avg_kor로 바꿔서 조회하기
select addr, round(avg(kor),0) avg_kor --as 생략
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

--문6) 평균(aver)이 70이상 행을 대상으로 주소별 인원수를 구한후
--     그 인원수가 2미만 행을 인원수 순으로 조회하시오
1) 전체 행 조회
select * from sungjuk;

2) 평균(aver)값이 70이상 행 조회
select addr, aver
from sungjuk
where aver>=70;

3) 2)의 결과에서 주소별 인원수를 구하시오
select addr, count(*)
from sungjuk
where aver>=70
group by addr;

4) 3)의 결과에서 그 인원수가 2미만 행 조회
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

5) 4)의 결과를 칼럼명을 cnt로 출력하고 인원수 순으로 조회
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by cnt;
////////////////////////////////////////////////////////////

● [CASE WHEN ~ THEN END 구문]
형식)
     CASE WHEN 조건1 THEN 조건만족시 값1
          WHEN 조건2 THEN 조건만족시 값2
          WHEN 조건3 THEN 조건만족시 값3
             ...
          ELSE 값
     END 결과컬럼명

-- 이름, 주소를 조회하시오
select uname, addr from sungjuk;

-- 이름, 주소를 조회하시오 (단, 주소는 한글로 바꿔서 조회)
select uname, addr, case when addr='Seoul' then '서울'
                         when addr='Jeju'  then '제주'
                         when addr='Suwon' then '수원'
                         when addr='Busan' then '부산'
                    end as juso
from sungjuk;


--문7)이름, 국어, 학점을 조회하시오
      학점 : 국어점수   90이상 'A학점'
                      80이상 'B학점'
                      70이상 'C학점'
                      60이상 'D학점'
                      나머지 'F학점'
1)논리테이블 결과칼럼명을 grade로
select uname, kor, case when kor>=90 then 'A학점'
                        when kor>=80 then 'B학점'
                        when kor>=70 then 'C학점'
                        when kor>=60 then 'D학점'
                        else 'F학점'
                   end as grade
from sungjuk;

2)논리테이블 결과칼럼명을 국어학점으로
select uname, kor, case when kor>=90 then 'A학점'
                        when kor>=80 then 'B학점'
                        when kor>=70 then 'C학점'
                        when kor>=60 then 'D학점'
                        else 'F학점'
                   end as 국어학점 --칼럼명 한글도 가능
from sungjuk;

3) between ~ and 연산자
select uname, kor, case when kor between 90 and 100 then 'A학점'
                        when kor between 80 and 89  then 'B학점'
                        when kor between 70 and 79  then 'C학점'
                        when kor between 60 and 69  then 'D학점'
                        else 'F학점'
                   end as 국어학점 --칼럼명 한글도 가능
from sungjuk;

4) 국어학점 순으로 정렬하기
select uname, kor, case when kor between 90 and 100 then 'A학점'
                        when kor between 80 and 89  then 'B학점'
                        when kor between 70 and 79  then 'C학점'
                        when kor between 60 and 69  then 'D학점'
                        else 'F학점'
                   end as 국어학점 --칼럼명 한글도 가능
from sungjuk
order by 국어학점;

