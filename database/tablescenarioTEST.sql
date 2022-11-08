tablescenarioTEST.sql
///////////////////////////////////////////////////////////////////////////////

drop table tb_display;
commit;


create table tb_display(
);

insert into tb_display( )
values('exhibit001','�ؼ��� ������ �������� ��������','art','2022-04-28','2022-08-31','hanart','(��)��Ʈ�����̴�, ��Ʈ���̽�(��)/02-730-4368/��ü����/10:00 ~ 19:00/��3���ý�, ��4���ý�','ensunny.png');

insert into tb_display( )
values('show001','���� þ & ���쿹��','orche','2022-08-31','2022-08-31','concert','(��)����Ʈ�̵��/02-541-2512/8�� �̻�/19:30 (�����ð� 100��)','reichen.png');

insert into tb_display( )
values('exhibit002','Ȧ � Ʈ�� ����� 2022: ����, ���� ���� ����','art','2022-08-26','2022-09-11','hanart','���������� , �����δ���/070-4254-0955/��ü����/�������帶���ð� 18:30/10:00 ~ 19:00/��7���ý�','hallearth.png');

insert into tb_display( )
values('show002','������� �Բ��ϴ� 11�� �ܼ�Ʈ','vocal','2022-08-31','2022-08-31','ibk','�γ��翣�����̸�Ʈ �ֽ�ȸ��/02-464-1515/8�� �̻�/11:00','sukwoo.png');

insert into tb_display( )
values('exhibit003','�Ӹ� ī��Ƽ�� �극�� Ư����: ������ ����','design','2022-06-10','2022-10-02','hanart','FOUNDATION HENRI CARTIER-BRESSON UNQP LTD. KATE FARM/02-747-7790/��ü����/10:00 ~ 19:00/��5���ý�,��6���ý�','angli.png');

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
values('inchun_n','inchun','�Ϲݼ�',1,100);

insert into tb_seat( )
values('hanart_a','hanart','����');

insert into tb_seat( )
values('hanart_t','hanart','û�ҳ�');

insert into tb_seat( )
values('hanart_j','hanart','���');

/////////////////////////////////////////////////////////////////////////////////
--��ǰ ���̺� tb_product ����

create table tb_product(
    icode varchar2(50) not null --��ǰ�����ڵ�
   ,scode varchar2(20) not null --�¼������ڵ�
   ,price number(7)    not null --����
   ,sno   number(10)   not null --�Ϸù�ȣ
   ,primary key(sno) --�⺻Ű
);

--sno�÷��� tb_product_seq ������ ����
create sequence tb_product_seq;
drop sequence tb_product_seq;
commit;

--tb_product ���߰�
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


select count(*) from tb_product; --�� 13��
/////////////////////////////////////////////////////////////////////////////////

create table tb_basket(
);

--sno�÷��� tb_basket_seq ������ ����
create sequence tb_basket_seq;
drop sequence tb_basket_seq;

insert into tb_basket( )
values(tb_basket_seq.nextval,'show001',1,'gogo123','20220831-001',206,'concert_r','Y','N');

/////////////////////////////////////////////////////////////////////////////////


--�������� ���̺� tb_notice ����
create table tb_notice(
    sno     number(8)      not null                 --�Ϸù�ȣ
   ,gubun   varchar2(10)   not null                 --����(info:�ȳ�/aca:��ī����/mojib:����)
   ,title   varchar2(100)  not null                 --����
   ,content varchar2(1000) not null                 --����
   ,regdt   date           default sysdate --�����
   ,writer  varchar2(10)   not null                 --�ۼ���
   ,img     varchar2(1000)                           --÷������
   ,primary key(sno)                                --�⺻Ű
);
drop table tb_notice;

--sno�÷��� tb_notice_seq ������ ����
create sequence tb_notice_seq;
drop sequence tb_notice_seq;
commit;

--tb_notice ���߰�
insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','8.31(��) ���������� ��ȭ�� �ִ� �� �ȳ�','�Ŵ� ������ �������� ��ȭ�� �ִ� ��!','2022-08-31','������');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','2022 ���������� 9�� û��̼����� �ȳ�','û��̼������� �۰��� �������� ������ ������ �����Դϴ�.','2022-08-29','������');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'info','9��1�Ϻ��� ���������� ������ �̿����� ����˴ϴ�.','ȥ������: ���� ��,��,�����Ͽ� ���Ͽ� ��������� 1.5�� �ΰ�','2022-08-17','������');

insert into tb_notice(sno, gubun, title, content, regdt, writer)
values(tb_notice_seq.nextval,'aca','[�̼��Ǳ�]2022 �����б� ������ ����(~9.24)','2022 ������ ���� �̼��Ǳ��ī���� �����б� ������ ����','2022-08-04','������');

insert into tb_notice(sno, gubun, title, content, regdt, writer, img)
values(tb_notice_seq.nextval,'mojib','���������� �Ͽ콺 ���ٴ�Ʈ ����(���)','������ �������� �Դ� ���������翡��, ������ ���������� ��Ʈ�� �Ǿ� ��ä�ο� ������ ������ ���� �����غ�����','2022-07-22','������','���������� �Ͽ콺 ���ٴ�Ʈ ���ÿ���.hwp,
�Ͽ콺 ���ٴ�Ʈ ��������ǥ(7.22).pdf');


select * from tb_notice;
select count(*) from tb_notice; --�� 5��



