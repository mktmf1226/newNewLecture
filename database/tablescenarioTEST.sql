tablescenarioTEST.sql
///////////////////////////////////////////////////////////////////////////////

drop table tb_display;
commit;


create table tb_display(
);

insert into tb_display( )
values('exhibit001','앤서니 브라운의 원더랜드 뮤지엄전','art','2022-04-28','2022-08-31','hanart','(주)아트센터이다, 아트레이스(주)/02-730-4368/전체관람/10:00 ~ 19:00/제3전시실, 제4전시실','ensunny.png');

insert into tb_display( )
values('show001','레이 첸 & 선우예권','orche','2022-08-31','2022-08-31','concert','(주)마스트미디어/02-541-2512/8세 이상/19:30 (관람시간 100분)','reichen.png');

insert into tb_display( )
values('exhibit002','홀 어스 트럭 스토어 2022: 가구, 오래 쓰는 물건','art','2022-08-26','2022-09-11','hanart','예술의전당 , 디자인누하/070-4254-0955/전체관람/전시입장마감시간 18:30/10:00 ~ 19:00/제7전시실','hallearth.png');

insert into tb_display( )
values('show002','강석우와 함께하는 11시 콘서트','vocal','2022-08-31','2022-08-31','ibk','두남재엔터테이먼트 주식회사/02-464-1515/8세 이상/11:00','sukwoo.png');

insert into tb_display( )
values('exhibit003','앙리 카르티에 브레송 특별전: 결정적 순간','design','2022-06-10','2022-10-02','hanart','FOUNDATION HENRI CARTIER-BRESSON UNQP LTD. KATE FARM/02-747-7790/전체관람/10:00 ~ 19:00/제5전시실,제6전시실','angli.png');

//////////////////////////////////////////////////////////////////////////////

create table tb_seat(
);

insert into tb_seat( )
values('ibk_r','ibk','R',1,200);

insert into tb_seat( )
values('ibk_s','ibk','S',201,400);

insert into tb_seat( )
values('ibk_a','ibk','A',401,600);

insert into tb_seat( )
values('concert_r','concert','R',1,500);

insert into tb_seat( )
values('concert_s','concert','S',501,1000);

insert into tb_seat( )
values('concert_a','concert','A',1001,1500);

insert into tb_seat( )
values('concert_b','concert','B',1501,2000);

insert into tb_seat( )
values('concert_c','concert','C',2001,2500);

insert into tb_seat( )
values('inchun_n','inchun','일반석',1,100);

insert into tb_seat( )
values('hanart_a','hanart','성인');

insert into tb_seat( )
values('hanart_t','hanart','청소년');

insert into tb_seat( )
values('hanart_j','hanart','어린이');

/////////////////////////////////////////////////////////////////////////////////
--상품 테이블 tb_product 생성

create table tb_product(
    icode varchar2(50) not null --상품구분코드
   ,scode varchar2(20) not null --좌석구분코드
   ,price number(7)    not null --가격
   ,sno   number(10)   not null --일련번호
   ,primary key(sno) --기본키
);

--sno컬럼에 tb_product_seq 시퀀스 생성
create sequence tb_product_seq;
drop sequence tb_product_seq;
commit;

--tb_product 행추가
insert into tb_product(icode, scode, price, sno)
values('exhibit001','hanart_a',20000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit001','hanart_t',13000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit001','hanart_j',13000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show001','concert_r',120000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show001','concert_s',90000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show001','concert_a',70000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show001','concert_b',50000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show001','concert_c',30000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit002','hanart_a',0,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit003','hanart_a',18000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit003','hanart_t',15000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('exhibit003','hanart_j',12000,tb_product_seq.nextval);

insert into tb_product(icode, scode, price, sno)
values('show002','ibk_r',30000,tb_product_seq.nextval);


select count(*) from tb_product; --총 13행
/////////////////////////////////////////////////////////////////////////////////

create table tb_basket(
);

--sno컬럼에 tb_basket_seq 시퀀스 생성
create sequence tb_basket_seq;
drop sequence tb_basket_seq;

insert into tb_basket( )
values(tb_basket_seq.nextval,'show001',1,'gogo123','20220831-001',206,'concert_r','Y','N');

/////////////////////////////////////////////////////////////////////////////////


--공지사항 테이블 tb_notice 생성
create table tb_notice(
    sno     number(8)      not null                 --일련번호
   ,gubun   varchar2(10)   not null                 --구분(info:안내/aca:아카데미/mojib:모집)
   ,title   varchar2(100)  not null                 --제목
   ,content varchar2(1000) not null                 --내용
   ,regdt   date           default sysdate --등록일
   ,writer  varchar2(10)   not null                 --작성자
   ,img     varchar2(1000)                           --첨부파일
   ,primary key(sno)                                --기본키
);
drop table tb_notice;

--sno컬럼에 tb_notice_seq 시퀀스 생성
create sequence tb_notice_seq;
drop sequence tb_notice_seq;
commit;

--tb_notice 행추가
insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','8.31(수) 예술의전당 문화가 있는 날 안내','매달 마지막 수요일은 문화가 있는 날!','2022-08-31','관리자');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','2022 예술의전당 9월 청년미술상점 안내','청년미술상점은 작가와 관람객이 만나는 소통의 공간입니다.','2022-08-29','관리자');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','9월1일부터 예술의전당 주차장 이용요금이 변경됩니다.','혼합할증: 연중 토,일,공휴일에 한하여 주차요금의 1.5배 부과','2022-08-17','관리자');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'aca','[미술실기]2022 가을학기 수강생 모집(~9.24)','2022 예술의 전당 미술실기아카데미 가을학기 수강생 모집','2022-08-04','관리자');

insert into tb_notice(sno, gubun, title, content, regdt, writer, img)
values(tb_notice_seq.nextval,'mojib','예술의전당 하우스 어텐던트 모집(상시)','어제는 관객으로 왔던 예술의전당에서, 오늘은 예술의전당 하트가 되어 다채로운 공연의 현장을 직접 경험해보세요','2022-07-22','관리자','예술의전당 하우스 어텐던트 응시원서.hwp,
하우스 어텐던트 교육일정표(7.22).pdf');


select * from tb_notice;
select count(*) from tb_notice; --총 5행



