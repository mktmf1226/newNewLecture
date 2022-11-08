
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202207\database\20220829_02종합연습문제.sql
///////////////////////////////////////////////////////////////////////////////

● [종합 연습문제]

select count(*) from tb_student; --6개
select count(*) from tb_gwamok;  --9개
select count(*) from tb_sugang;  --14개

문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드)(동점인 학점은 없다)

--디자인 교과목의 학점 조회하기
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1)디자인 교과목 중에서 학점이 제일 많은 학점 조회
select max(ghakjum) --5
from tb_gwamok 
where gcode like 'd%';

--2) 1)결과에서 나온 학점(5)과 동일한 학점을 갖고 있는 행에서 과목코드 선택
--   즉, 디자인 교과목 중에서 학점이 제일 많은 과목코드(단, 중복된 학점이 없다는 가정 하에)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%';  --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';  --d002

--3) 2)에서 나온 과목코드(d002)를 수강신청한 명단을 조회
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
              select gcode
              from tb_gwamok
              where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
              and gcode like 'd%'
            );

--4) 3)의 결과를 AA테이블로 만든 후, 학생테이블을 조인해서 이름 가져오기
select AA.*, ST.uname
from (
       select gcode, hakno
       from tb_sugang
       where gcode=(
                     select gcode
                     from tb_gwamok
                     where ghakjum
                     =(select max(ghakjum) from tb_gwamok where gcode like 'd%')
                     and gcode like 'd%'
                   )
     ) AA join tb_student ST
on AA.hakno=ST.hakno;

/*내풀이
--디자인 교과목 중에서 학점이 제일 많은 교과목 구하고 내림차순
select ghakjum, gcode
from tb_gwamok
where gcode like 'd%'
order by ghakjum desc; -- gcode='d002'

////////////////////////////////////////////////////////////////////////////////
--max함수
select max(ghakjum) from tb_gwamok where gcode like 'd%';

--max함수로 gcode='d002' 추출
select gcode
from tb_gwamok
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
////////////////////////////////////////////////////////////////////////////////

--gcode='d002'를 셀프조인하고 행번호가 1인 행 구하기(제일 많은 교과목)
select gcode
from (
      select gcode
      from tb_gwamok
      where gcode like 'd%'
      order by ghakjum desc
      ) AA
where rownum=1;

--gcode='d002'를 수강한 학생 구하기
select gcode, hakno
from tb_sugang
where gcode=(
             select gcode
             from (
                   select gcode
                   from tb_gwamok
                   where gcode like 'd%'
                   order by ghakjum desc
                   ) AA
             where rownum=1
             );

--학생 이름 조인하기
select gcode, BB.hakno, uname
from (
      select gcode, hakno
      from tb_sugang
      where gcode=(
                   select gcode
                   from (
                         select gcode
                         from tb_gwamok
                         where gcode like 'd%'
                         order by ghakjum desc
                        ) AA
                   where rownum=1
                  )
      ) BB join tb_student ST
on BB.hakno=ST.hakno;

*/


문2) 학번별 수강신청한 총학점을 구하고 학번별 정렬해서 줄번호 4~6행 조회하시오
    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시)

--학생테이블 조회하기
select hakno, uname from tb_student order by hakno;

--1) 수강신청한 과목의 학점 가져오기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) 학번별로 총학점 구하기
select SU.hakno, sum(GW.ghakjum) as 총학점
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno;

--3) 수강신청하지 않은 학생들도 가져올 수 있도록 학생테이블 left join하고,
--   2)결과 (AA테이블)를 붙임
select ST.hakno, ST.uname, AA.hakno, AA.총학점
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as 총학점
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno;

--4) 총학점이 null이면 0으로 바꾸고, 학번순으로 조회하기
select ST.hakno, ST.uname, nvl(AA.총학점, 0)
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as 총학점
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--5) 줄번호 추가 (줄번호가 있는 상태에서 정렬됨)
select ST.hakno, ST.uname, nvl(AA.총학점, 0), rownum as rnum
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as 총학점
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--6) 5의 결과를 셀프조인(BB테이블)하고나서, 줄번호 추가하기
select BB.hakno, BB.uname, BB.총학점2, rownum as rnum --앞 컬럼들 BB.*과 동일
from (
        select ST.hakno, ST.uname, nvl(AA.총학점, 0) as 총학점2
        from tb_student ST left join (
                                      select SU.hakno, sum(GW.ghakjum) as 총학점
                                      from tb_sugang SU join tb_gwamok GW
                                      on SU.gcode=GW.gcode
                                      group by SU.hakno
                                     ) AA
        on ST.hakno=AA.hakno
        order by ST.hakno
     ) BB;

--7) 6)의 결과를 셀프조인(CC테이블)하고 줄번호(rnum) 4~6 조회하기
select *
from (
        select BB.hakno, BB.uname, BB.총학점2, rownum as rnum
        from (
                select ST.hakno, ST.uname, nvl(AA.총학점, 0) as 총학점2
                from tb_student ST left join (
                                              select SU.hakno, sum(GW.ghakjum) as 총학점
                                              from tb_sugang SU join tb_gwamok GW
                                              on SU.gcode=GW.gcode
                                              group by SU.hakno
                                             ) AA
                on ST.hakno=AA.hakno
                order by ST.hakno
             ) BB
    ) CC
where rnum>=4 and rnum<=6;
////////////////////////////////////////////////////////////////////////////////

/* 내풀이
--수강신청한 학생들 구하기
--학생테이블과 수강테이블을 left join으로
select ST.hakno, gcode
from tb_student ST left join tb_sugang SU
on ST.hakno= SU.hakno;

--학번별 수강신청한 총학점 구하기
select hakno, sum(ghakjum)
from (
      select ST.hakno, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno;

--수강신청하지 않은 학생의 총학점을 0으로 표시하고 학번별 정렬하기
select hakno, nvl(sum(ghakjum),0)
from (
      select ST.hakno, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno
order by hakno;

--줄번호 추가
select hakno, hap, rownum as rnum
from (
      select hakno, nvl(sum(ghakjum),0) as hap
      from (
            select ST.hakno, gcode
            from tb_student ST left join tb_sugang SU
            on ST.hakno= SU.hakno
           ) AA left join tb_gwamok GW
      on AA.gcode=GW.gcode
      group by hakno
      order by hakno
     );

--4~6행(2페이지)을 조회하기
select *
from (
      select hakno, hap, rownum as rnum
      from (
            select hakno, nvl(sum(ghakjum),0) as hap
            from (
                  select ST.hakno, gcode
                  from tb_student ST left join tb_sugang SU
                  on ST.hakno= SU.hakno
                 ) AA left join tb_gwamok GW
            on AA.gcode=GW.gcode
            group by hakno
            order by hakno
           )
      )
where rnum between 4 and 6;

*/

문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점)
--수강테이블에 행추가 해주세요
--(총학점이 다 같은 값이어서 결과확인하기가 조금 애매합니다)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

--1) 과목코드가 일치하는 학점 가져오기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) 학번별로 총학점 구하고, 총학점순으로 내림차순 정렬하기
select SU.hakno, sum(GW.ghakjum) as 총학점
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by sum(GW.ghakjum) desc;

--3) 2)의 결과를 AA테이블로 만들고, 학생테이블 조인해서 이름 가져오기
select AA.hakno, AA.총학점, ST.uname, rownum as rnum
from(
      select SU.hakno, sum(GW.ghakjum) as 총학점
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode=GW.gcode
      group by SU.hakno
      order by sum(GW.ghakjum) desc
    ) AA join tb_student ST
on AA.hakno = ST.hakno;

--4) 3)의 결과를 셀프조인(BB)하고 줄번호(rnum) 1 조회하기
select *
from (
        select AA.hakno, AA.총학점, ST.uname, rownum as rnum
        from(
              select SU.hakno, sum(GW.ghakjum) as 총학점
              from tb_sugang SU join tb_gwamok GW
              on SU.gcode=GW.gcode
              group by SU.hakno
              order by sum(GW.ghakjum) desc
            ) AA join tb_student ST
        on AA.hakno = ST.hakno
     )BB
where rnum=1;


/* 내풀이
--수강신청하지 않은 학생의 총학점을 0으로 표시하고 총학점순으로 내림차순
select hakno, uname, nvl(sum(ghakjum),0) as hap
from (
      select ST.hakno, uname, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno, uname
order by hap desc;


--줄번호 추가
select hakno, uname, hap, rownum as rnum
from (
      select hakno, uname, nvl(sum(ghakjum),0) as hap
      from (
            select ST.hakno, uname, gcode
            from tb_student ST left join tb_sugang SU
            on ST.hakno= SU.hakno
           ) AA left join tb_gwamok GW
      on AA.gcode=GW.gcode
      group by hakno, uname
      order by hap desc
     );

--1행 조회하기
select *
from (
      select hakno, uname, hap, rownum as rnum
      from (
            select hakno, uname, nvl(sum(ghakjum),0) as hap
            from (
                  select ST.hakno, uname, gcode
                  from tb_student ST left join tb_sugang SU
                  on ST.hakno= SU.hakno
                 ) AA left join tb_gwamok GW
            on AA.gcode=GW.gcode
            group by hakno, uname
            order by hap desc
           )
      )
where rnum=1;

*/










































