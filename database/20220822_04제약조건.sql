
파일->새로만들기->데이터베이스계층->데이터베이스 파일
i:\java202202\database\20220822_04제약조건.sql
////////////////////////////////////////////////////////////////

● [자료형]
1) 문자형 --대부분 표준안
  - 가변형  varchar(5) 'SKY'     3byte 데이터용량 작음  예)아이디, 비밀번호, 이름, 주소
  - 고정형  char(5)    'SKY  '   5byte 속도 빠름       예)주민번호, 우편번호, 계좌번호

2) 숫자형 --DB마다 다름
  - 정수형  int

3) 날짜형
  - 년월일시분초
  - 구분기호로 -와 /를 사용한다
  - 문자열 타입으로 입력한다
  - date

//////////////////////////////////////////////////////////////////////////////

● [테이블 제약조건]

1) primary key
   기본키. 유일성
   where조건절에 걸릴 수 있는 대표적인 칼럼을 강제할 수 있다
   예) 주민번호, 핸드폰번호, 계좌번호, 아이디, 이메일 
   중복을 허용하지 않음
   null 값 허용하지 않음 ( 빈값을 허용하지 않는다. 반드시 입력해라 )
   하나의 테이블에 여러개의 기본키 지정 가능
   
   
2) not null
   빈값을 허용하지 않음
   
   
3) check
   입력할 값을 특정 범위로 제한하는 조건
   
   
   
4) default
   사용자가 값을 입력하지 않으면 해당 칼럼이 정의한 기본값을 자동으로 입력해준다


5) unique
   중복허용 안함
   null 값은 한 번만 허용 --primary key와 유일한 차이점
   
   
6) foreign key
   외래키
   테이블을 조인하는 경우 부모와 자식 관계를 설정



///////////////////////////////////////////////////////////////////////////

--sungjuk 테이블 삭제
drop table sungjuk;


--sungjuk 테이블 생성
create table sungjuk(
     sno   int          primary key                  --기본키(유일성)
    ,uname varchar(50)  not null
    ,kor   int          check(kor between 0 and 100) --국어 0~100사이만 입력
    ,eng   int          check(eng between 0 and 100)
    ,mat   int          check(mat between 0 and 100)
    ,addr  varchar(20)  check(addr in('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot   int          default 0   
    ,aver  int          default 0
    ,wdate date         default sysdate              --현재 날짜 함수
);
select * from sungjuk;

////////////////////////////////////////////////////////////////////////////////

● [테이블 제약조건 에러 메세지]

-- primary key 제약조건
-- ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007322)에 위배됩니다
-- sno 칼럼은 기본키(PK)이므로 중복된 값을 허용하지 않음
insert into sungjuk(sno, uname) values(1, '홍길동'); --두 번 실행하면 에러 발생

-- not null 제약조건
-- ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
-- uname 칼럼에 반드시 값을 입력해야 함
insert into sungjuk(sno) values(1);

-- check 제약조건
-- ORA-02290: 체크 제약조건(SYSTEM.SYS_C007320)이 위배되었습니다
-- 국영수 점수는 0~100 사이만 가능
-- addr칼럼에 'Incheon' 허용하지 않음
insert into sungjuk(sno, uname, kor, eng, mat) values(1, '홍길동', -10, 20, 300);
insert into sungjuk(sno, uname, addr) values(1, '홍길동', 'Incheon');

-- default 제약조건
-- tot과 aver는 0 입력, wdate는 현재날짜가 입력됨
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values (2, '무궁화', 10, 20, 30, 'Seoul');
select * from sungjuk;

-- 칼럼갯수와 값갯수가 일치하지 않는 경우
-- ORA-00913: 값의 수가 너무 많습니다 00913. 00000 -  "too many values"
insert into sungjuk(sno, uname, kor, eng, mat)
values (2, '무궁화', 10, 20, 30, 'Seoul');















