
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202207\database\20220826_01테이블조인.sql
////////////////////////////////////////////////////////////////////////////////

● [테이블 조인]
  - 여러 테이블을 하나의 테이블처럼 사용하는 조인
  - 두 개 이상의 테이블을 결합하여 데이터를 추출하는 기법
  - 두 테이블의 공통값을 이용하여 컬럼을 조합하는 수단
  
  
  형식)
       select 칼럼명
       from 테이블명1 join 테이블명2
       on 조건절;                      --ANSI(표준) SQL문

       select 칼럼명
       from 테이블명1 , 테이블명2
       on 조건절;                      --Oracle DB SQL문
       
       select T1.*, T2.*              --T1.모든칼럼, T2.모든칼럼
       from T1 join T2
       on T1.x = T2.x;                --테이블명.칼럼명
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x = T2.x join T3         --3개 테이블 조인
       on T1.y = T3.y

       select T1.*, T2.*, T3.*, T4.*
       from T1 join T2
       on T1.x = T2.x join T3
       on T1.y = T3.y join T4         --4개 테이블 조인
       on T1.z = T4.z


● 조건절 : where조건절, having조건절, on조건절


● 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다
   - 물리적 테이블 : 실제 create table 한 테이블
   - 논리적 테이블 : SQL문에 의해서 가공한 테이블

   select * from tb_student;
   select count(*) from tb_student;
//////////////////////////////////////////////////////////////////////////////


● inner join 연습
--수강테이블을 기준으로

--학번을 기준으로 수강테이블과 학생테이블 조인
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

--두 테이블 간의 교집합. 조인 inner생략가능. 가장 기본형태
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

--수강신청한 학생들의 학번, 과목코드, 이름, 이메일 조회하시오
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;



--과목구분코드를 기준으로 수강테이블과 과목테이블 조인
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;



--3개 테이블 조인 : 수강테이블 + 학생테이블(이름) + 과목테이블(과목명)
--교차테이블인 수강테이블을 기준으로
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


--테이블명의 alias(별칭)도 가능하다
--수강과 학생테이블 조인
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--수강과 과목테이블 조인
select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--수강과 학생,과목테이블 조인
select SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;


--조회시 테이블 간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--중복되는 칼럼명을 소속 테이블명을 정확히 명시해야 한다
--ORA-00918: 열의 정의가 애매합니다
select hakno, gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--중복되는 칼럼을 조회할 때에는 소속테이블의 어떤 것을 가져오든 동일하다
select SU.hakno, SU.gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;
///////////////////////////////////////////////////////////////////////////////

● [테이블 조인 연습]

--전체 행 갯수
select count(*) from tb_student;  --6개
select count(*) from tb_gwamok;   --9개
select count(*) from tb_sugang;   --13개


문1)수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

--수강신청한 학생들 목록 보기
select * from tb_sugang; --13행

--수강테이블 + 학생테이블
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--'제주'만 조회하기
select SU.hakno, gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
where address='제주';

///////////////////////////////////////////////////////////////////////////////
select SU.hakno, gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno; --AA

--가공된 논리적 테이블의 이름을 AA라고 지정하고, 다시 재가공 할 수 있다
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      ) AA
where AA.address='제주';

--ORA-00904: "AA"."EMAIL": 부적합한 식별자
--ST 테이블에서 email칼럼을 가져오지 않았음
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      ) AA
where AA.address='제주';

--AA 별칭 생략 가능
select hakno, gcode, uname, address
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )
where address='제주';

--전체행 표시 * 가능
select *
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )
where address='제주';
//////////////////////////////////////////////////////////////////////////////

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명

--1)수강테이블 조회
select * from tb_sugang;

--2)수강 신청한 학생들의 명단(학번)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno; --4행
select hakno from tb_sugang group by hakno; --group by절은 내부적으로 order by의 속성을 갖고있다
                                            --AA alias table

--3)수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오기
select AA.hakno, ST.address
from(
     select hakno from tb_sugang group by hakno
    ) AA join tb_student ST
on AA.hakno=ST.hakno;                       --BB alias table

--4) 3)의 결과를 BB테이블로 만든 후 주소별 그룹후 행 갯수 구하기
select BB.address, count(*) || '명' as cnt
from (
      select AA.hakno, ST.address
      from(
           select hakno from tb_sugang group by hakno
           ) AA join tb_student ST
      on AA.hakno=ST.hakno
     ) BB
group by BB.address;


--수강테이블 + 학생테이블
select SU.hakno, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--학번을 기준으로 중복된 학생 제거
select distinct (SU.hakno), address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--지역별 인원수
select address, count(*) || '명'
from (
      select distinct (SU.hakno), address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )AA
group by address;


문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001  HTML     2명
     d002  포토샵    1명
     d003  일러스트  1명
     p001  JAVA    4명
     p002  Oracle  2명
     p003  JSP     2명
     p004  Python  1명

--1) 수강테이블에서 과목코드 정렬해서 조회하기
select * from tb_sugang order by gcode;

--2) 수강테이블에서 과목코드가 동일한 행을 그룹
select gcode, count(*) 
from tb_sugang 
group by gcode;

--3) 2)의 결과를 AA테이블로 생성하고, 과목테이블 조인하기
select AA.gcode, gname, concat(cnt,'명')
from (
      select gcode, count(*) as cnt
      from tb_sugang
      group by gcode
     ) AA join tb_gwamok GW    
on AA.gcode=GW.gcode
order by AA.gcode;

--group by 컬럼명1, 컬럼명2
select SU.gcode, gname, count(*) || '명' as cnt
from tb_sugang SU join tb_gwamok GW    
on SU.gcode=GW.gcode
group by SU.gcode, gname 
order by SU.gcode;



문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  12학점
     g1002  홍길동   8학점
     g1005  진달래  12학점
     g1006  개나리   3학점

--1) 수강테이블에서 학번별로 조회
select hakno, gcode from tb_sugang order by hakno;

--2) 수강테이블에 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--3) 2)의 결과를 AA테이블로 만들고, 학번별로 그룹화한 후, 학점의 합계를 구하시오
select AA.hakno, sum(AA.ghakjum) as hap
from (
      select SU.hakno, SU.gcode, GW.ghakjum
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode=GW.gcode
     ) AA
group by AA.hakno;

--4) 3)의 결과를 BB테이블로 만들고, 학번을 기준으로 학생테이블에서 이름 가져와서 붙이기
select BB.hakno, concat(BB.hap, '학점'), ST.uname
from (
      select AA.hakno, sum(AA.ghakjum) as hap
      from (
            select SU.hakno, SU.gcode, GW.ghakjum
            from tb_sugang SU join tb_gwamok GW
            on SU.gcode=GW.gcode
            ) AA
      group by AA.hakno
     ) BB join tb_student ST
on BB.hakno=ST.hakno;
------------------------------------------------------------------------------

--또다른 방법
--1)수강테이블 + 학생테이블 + 과목테이블 3개 한꺼번에 조인하기
select SU.hakno, uname, SU.gcode, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1차 그룹(학번), 2차 그룹(이름)으로 그룹화하고, 총학점 구하기
select SU.hakno, uname, sum(ghakjum) || '학점' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, uname
order by SU.hakno;
///////////////////////////////////////////////////////////////////////////////

문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

--1) 수강테이블 + 과목테이블과 조인하기
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2) 학번 g1001이 수강신청한 과목 조회하기
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'                  --실제 자바코드에서 학번을 변수처리 한다
order by SU.gcode;

--과목코드별로 정렬하기
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'
order by SU.gcode;




문6) 수강신청을 한 학생들의 학번, 이름 조회
     g1001  홍길동
     g1002  홍길동
     g1005  진달래
     g1006  개나리

--1) 수강신청을 한 학생들의 학번 조회
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2) 서브쿼리로 출력
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);



문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
     g1003  개나리
     g1004  홍길동

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);


--학생테이블 조회하기
select hakno, uname from tb_student;

--수강신청한 학생들 조회하기
select distinct (SU.hakno)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--학생테이블에서 수강신청한 학생들과 일치하지 않은 학번 조회하기
select hakno, uname
from tb_student
where hakno not in (
                    select distinct (SU.hakno)
                    from tb_sugang SU join tb_student ST
                    on SU.hakno = ST.hakno
                    );

--학번을 오름차순으로 정렬하기
select hakno, uname
from tb_student
where hakno not in (
                    select distinct (SU.hakno)
                    from tb_sugang SU join tb_student ST
                    on SU.hakno = ST.hakno
                    )
order by hakno;





문8) daum이메일을 쓴 학생은 누구고 학점은 몇점인가요?
select SU.hakno, uname, email, sum(ghakjum)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where email like '%daum%'
group by SU.hakno, uname, email;



문9) 복수전공을 하고있는 학생들은 누구인가요?
select SU.hakno, uname, count(SU.gcode)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, uname
having count(SU.gcode)>=2;



