--sungjuk테이블 행 추가

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)

--오라클 콘솔창 예쁘게 출력하기
set linesize 1000;
col uname for a10; --col 칼럼명 for 20자
col addr  for a10; --col 칼럼명 for 20자


select *
from sungjuk
order by sno desc;


--문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
--     (단, 소수점은 반올림해서 둘째자리값까지 표현)

1)주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';

2)주소가 서울인 행을 대상으로 국영수 평균구하기
select avg(kor), avg(eng), avg(eng)
from sungjuk
where addr='Seoul';

3)주소가 서울인 행을 대상으로 국영수 평균구하고 반올림해서 소수점 둘째 자리까지 표현
select round(avg(kor),2), round(avg(eng),2), round(avg(mat),2)
from sungjuk
where addr='Seoul';

4)주소가 서울인 행을 대상으로 국영수 평균구하고 반올림해서 소수점 둘째 자리까지 표현하고, 컬럼명 변경하기
select round(avg(kor),2) as avg_kor
	 , round(avg(eng),2) as avg_eng
	 , round(avg(mat),2) as avg_mat
from sungjuk
where addr='Seoul';



--문제) 이름에 '나' 문자 있는 행을 조회
select *
from sungjuk
where uname like '%나%';


--문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
/*
		g1001  p001  OOP
		g1001  p003  JSP
		g1001  d001  웹표준
*/
--1) 수강테이블 + 과목테이블과 조인하기
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2) 학번 g1001이 수강신청한 과목 조회하기
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'
order by SU.gcode DESC;


--페이징
--문제) sungjuk테이블에서 이름순으로 정렬 후 행번호 4~6만 조회하시오
1)
select uname, aver, addr
from sungjuk
order by uname;

2)rownum도 같이 정렬된다
select uname, aver, addr, rownum
from sungjuk
order by uname;

3) 1)의 결과를 한번 더 셀프조인하고, rownum 추가하기
select uname, aver, addr, rownum as rnum
from (
	  select uname, aver, addr
	  from sungjuk
	  order by uname
	 );

4) 행번호 4~6행 조회하기 (결과:조회되지 않음)
select uname, aver, addr, rownum as rnum
from (
	  select uname, aver, addr
	  from sungjuk
	  order by uname
	 )
where rnum>=4 and rnum<=6;


5) 3)의 내용을 한번 더 셀프조인하고 행번호 4~6행 조회하기
select *
from (
	  select uname, aver, addr, rownum as rnum
	  from (
		    select uname, aver, addr
		    from sungjuk
		    order by uname
		   )
)
where rnum>=4 and rnum<=6;




select *
from(
		select sno, uname, kor, eng, mat, addr, tot, aver, wdate, rownum as rnum
		from (
			  select *
			  from sungjuk
			  order by uname
			 ) AA
) BB
where rnum>=4 and rnum<=6;




