////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_display �����������̺� (����)


-- ���̺� ����
create table tb_display (
    icode       varchar2(50)        not null        primary key     -- ��ǰ�����ڵ�
    ,iname      varchar2(62)        not null                             -- ��ǰ�̸�  
    ,genre      varchar2(20)        not null                             -- �帣�����ڵ�   
    ,sdate      date                    not null                             -- ������
    ,edate      date                    not null                             -- ������
    ,place      varchar2(10)         not null                             -- ��ұ����ڵ�
    ,extra      varchar2(1000)                                             -- ���
    ,img        varchar2(100)                                               -- �̹���
);



set define off;      
-- [���� þ & ���쿹��] ���ڿ��� �����Ͱ��� &���Խ� ������ �Ǵ��Ͽ� ��ü�Է°��� �䱸�˴ϴ�. 
-- ���� ���� �� [set define off;] �� �����ϸ� & ���ڸ� ��ü������ �ν����� �ʽ��ϴ�.


-- �� �߰�
insert into tb_display(icode, iname, genre, sdate, edate, place, extra, img)
values ('exhibit001'
            , '�ؼ��� ������ �������� ��������'
            , 'art'
            , '2022-04-28'
            , '2022-08-31'
            , 'hanart'
            , '(��)��Ʈ�����̴�,��Ʈ���̽�(��)/02-730-4368/��ü����/10:00 ~ 19:00/��3���ý�, ��4���ý�'
            , 'ensunny.png'
            );



insert into tb_display(icode, iname, genre, sdate, edate, place, extra, img)
values ('show001', 
            '���� þ & ���쿹�� ',  -- ���� þ & ���쿹�� ���ڿ��� �����Ͱ��� &���Խ� ������ �Ǵ��Ͽ� ��ü�Է°��� �䱸�˴ϴ�. ���� ���� �� [set define off;] �� �����ϸ� & ���ڸ� ��ü������ �ν����� �ʽ��ϴ�.
             'orche', 
             '2022-08-31', 
             '2022-08-31', 
             'concert', 
             '(��)����Ʈ�̵��/02-541-2512/8�� �̻�/19:30 (�����ð� 100��)',
             'reichen.png'
            );


insert into tb_display(icode, iname, genre, sdate, edate, place, extra, img)
values ('exhibit002'
            , 'Ȧ � Ʈ�� ����� 2022: ����, ���� ���� ����'          -- iname varchar(50) �ȵſ�. "INAME" ���� ���� ���� �ʹ� ŭ(����: 62, �ִ밪: 50) / varchar(62) �̻� ����մϴ�.
            , 'art'
            , '2022-08-26'
            , '2022-09-11'
            , 'hanart'
            , '���������� , �����δ���/070-4254-0955/��ü����/�������帶���ð� 18:30/10:00 ~ 19:00/��7���ý�'
            , 'hallearth.png'
            );
            

insert into tb_display(icode, iname, genre, sdate, edate, place, extra, img)
values ('show002'
            , '������� �Բ��ϴ� 11�� �ܼ�Ʈ'          
            , 'vocal'
            , '2022-08-31'
            , '2022-08-31'
            , 'ibk'
            , '�γ��翣�����̸�Ʈ �ֽ�ȸ��/02-464-1515/8�� �̻�/11:00'
            , 'sukwoo.png'
            );
            
            
            
insert into tb_display(icode, iname, genre, sdate, edate, place, extra, img)
values ('exhibit003'
            , '�Ӹ� ī��Ƽ�� �극�� Ư����: ������ ����'          
            , 'design'
            , '2022-06-10'
            , '2022-10-02'
            , 'hanart'
            , 'FOUNDATION HENRI CARTIER-BRESSON UNQP LTD. KATE FARM/02-747-7790/��ü����/10:00 ~ 19:00/��5���ý�,��6���ý�'
            , 'angli.png'
            );
            
 
-- �������� ���̺� ��ü ��ȸ
select * from tb_display;

-- ���� ���
select '(' || to_char(sdate, 'dy') || ')' from tb_display;
select '(' || to_char(edate, 'dy') || ')' from tb_display;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_seat �¼����̺� (����)


-- ���̺� ����
create table tb_seat (
    scode      varchar2(20)    primary key      -- �¼������ڵ�
   ,place       varchar2(20)    not null             -- ��ұ����ڵ�
   ,sgrade     varchar2(20)     not null            -- ���
   ,startno     number(5)                              -- �¼����۹�ȣ
   ,endno      number(5)                               -- �¼�����ȣ
);


-- �� �߰�
insert into tb_seat (scode, place, sgrade, startno, endno)
values('ibk_r', 'ibk', 'R', 1, 200);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('ibk_s', 'ibk', 'S', 201, 400);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('ibk_a', 'ibk', 'A', 401, 600);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('concert_r', 'concert', 'R', 1, 500);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('concert_s', 'concert', 'S', 501, 1000);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('concert_a', 'concert', 'A', 1001, 1500);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('concert_b', 'concert', 'B', 1501, 2000);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('concert_c', 'concert', 'C', 2001, 2500);

insert into tb_seat (scode, place, sgrade, startno, endno)
values('inchun_n', 'inchun', '�Ϲݼ�', 1, 100);

insert into tb_seat (scode, place, sgrade)
values('hanart_a', 'hanart', '����');

insert into tb_seat (scode, place, sgrade)
values('hanart_t', 'hanart', 'û�ҳ�');

insert into tb_seat (scode, place, sgrade)
values('hanart_j', 'hanart', '���');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 
-- tb_product ��ǰ���̺� (�ٽ�)


-- ���̺� ����
create table tb_product(
    icode varchar2(50) not null         --��ǰ�����ڵ�
   ,scode varchar2(20) not null        --�¼������ڵ�
   ,price number(7)    not null          --����
   ,sno   number(10)   not null         --��ȣ
   ,primary key(sno)                       --�⺻Ű
);

-- ������ ����
create sequence tb_product_seq;

-- �� �߰�
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_basket ��ٱ��� ���̺� (õ��)


-- ���̺� ����
create table tb_basket(
    sno         number(10)     primary key      -- �Ϸù�ȣ
    ,icode      varchar2(50)    not null            -- ��ǰ�����ڵ�
    ,amount    number(3)       default 0          -- ����
    ,id           char(10)          not null            -- ���̵�
    ,bview       char(12)          not null           -- ����ȸ��
    ,seat        number(4)                             -- �����¼�
    ,scode     varchar2(20)    not null             -- �¼������ڵ�
    ,ship        char(1)            not null             -- ��ۺ�
    ,sale        char(1)            not null             -- �����ڵ�
);

-- ������ ����
create sequence basket_seq;

-- ���߰�
insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'show001',1,'gogo123','20220831-001',206,'concert_r','Y','N');

insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'show001',1,'gogo123','20220831-001',1001,'concert_a','Y','T');

insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'exhibit001',2,'puppy456','20220831-001',null,'hanart_a','Y','N');

insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'exhibit001',2,'puppy456','20220831-001',null,'hanart_t','Y','N');

insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'exhibit003',1,'mokgin752','20220908-001',null,'hanart_t','N','N');

insert  into tb_basket(sno, icode, amount, id, bview, seat, scode, ship, sale)
values(basket_seq.nextval,'exhibit003',1,'mokgin752','20220908-001',null,'hanart_j','N','N');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_order �ֹ������̺� (�ѻ�)

-- ���̺� ����
create table tb_order(
     orderid         char(10)              not null            -- ȸ�����̵�(fk)
    ,onum           char(18)              not null            -- �ֹ���ȣ(pk)
    ,dis              number(10)         default 0           -- ���αݾ�
    ,fpay            number(10)         default 0           -- �� �����ݾ�
    ,oto             varchar2(20)        not null             -- �޴� ���
    ,addr            varchar2(100)                            -- �޴� �ּ� (������� null)
    ,mas            varchar2(200)                            -- ��۸޼���
    ,osta            char(1)                not null           -- �����Ȳ
    
    ,primary key(onum)
);

-- �� �߰�
insert into tb_order(orderid,onum,dis,fpay,oto,addr,mas,osta)
values(
         'gogo123'
        ,'20220831073030-001'
        ,'0'                        -- �⺻�� 0 �� ���̺� ���� �� sum���� ��� 
        ,'0'                        
        ,'���Ƹ�'
        ,'����Ư���� ������ ���ﵿ ������� 4��'
        ,'�㸮��'
        ,'D'
        );
insert into tb_order(orderid,onum,dis,fpay,oto,addr,mas,osta)
values(
         'puppy456'
        ,'20220831120603-002'
        ,'0'                         
        ,'0'                        
        ,'������'
        ,'����Ư���� ���ı� ����'
        ,'�ʸ� ���� ��'
        ,'I'
        );
insert into tb_order(orderid,onum,dis,fpay,oto,osta)
values(
         'mokgin752'
        ,'20220831164520-003'
        ,'0'                         
        ,'0'                       
        ,'�⸰'
        ,'B'    
        );                          -- �������:addr null 


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_detail �ֹ� �� ������ ���̺� (����)


-- ���̺� ����
create table tb_detail (
    dno            number(10)          not null        primary key         -- �Ϸù�ȣ
    ,dnum         varchar2(50)         not null                                 -- �ֹ�����ȣ
    ,dcode       varchar2(50)         not null                                  -- ��ǰ�ڵ�
    ,damount    number(3)            default 0                                -- ��ǰ����
    ,dship        char(1)                not null                                   -- ��ۺ�
    ,dsum        number(10)          default 0                                 -- �ݾ�
    ,dview        char(12)              not null                                   -- ����ȸ
);


-- ������ ����
create sequence detail_seq;


-- �� �߰�
insert into tb_detail (dno, dnum, dcode, dship, dview)
values(detail_seq.nextval, '20220831073030-001', 'show001', 'Y', '20220831-001');

insert into tb_detail (dno, dnum, dcode, dship, dview)
values(detail_seq.nextval, '20220831120603-002', 'exhibit001', 'Y', '20220831-001');

insert into tb_detail (dno, dnum, dcode, dship, dview)
values(detail_seq.nextval, '20220831164520-003', 'exhibit003', 'Y', '20220908-001');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_user ȸ�� ���̺� (õ��)


-- ���̺� ����
create table tb_user(
    id                  char(10)                primary key         -- ���̵�
    ,password      varchar2(20)          not null                -- ��й�ȣ
    ,uname           varchar2(10)          not null                -- ����
    ,lunar             char(1)                  not null                -- ������
    ,birth              varchar2(8)            not null                -- �������
    ,gender           char(1)                  not null                -- ����
    ,addr              varchar2(100)         not null                -- �ּ�
    ,phone            varchar2(11)           not null               -- ����ó
    ,email              varchar2(50)           not null               -- �̸���
    ,mailreceive      char(1)                  not null                -- �̸��� ���ſ���
    ,snsreceive       char(1)                  not null               -- SNS ���ſ���
    ,grade              char(1)                  not null               -- ȸ����� �ڵ�
);


-- �� �߰�
insert  into tb_user(id, password, uname, lunar, birth, gender, addr, phone, email, mailreceive, snsreceive, grade)
values('gogo123', '1234', '���Ƹ�', 'S', '19940505', 'F', '����Ư���� ������ ���ﵿ ������� 4��', '01011111111', 'gogo@naver.com', 'N', 'N', 'Y');

insert  into tb_user(id, password, uname, lunar, birth, gender, addr, phone, email, mailreceive, snsreceive, grade)
values('puppy456', '4567', '������', 'S', '19970202', 'M', '����Ư���� ���ı� ����', '01022222222', 'puppy@gmail.com', 'N', 'N', 'O');

insert  into tb_user(id, password, uname, lunar, birth, gender, addr, phone, email, mailreceive, snsreceive, grade)
values('kawai789', '7890', '�����', 'S', '20010404', 'F', '��⵵ �����ν� Ŀ�׽�Ƽ', '01033333333', 'kawai@naver.com', 'Y', 'N', 'G');

insert  into tb_user(id, password, uname, lunar, birth, gender, addr, phone, email, mailreceive, snsreceive, grade)
values('ginko159', '1590', '�ڳ���', 'L', '19990707', 'M', '������ ��õ�� ��ɷ� 156', '01044444444', 'ginko@daum.net', 'N', 'N', 'B');

insert  into tb_user(id, password, uname, lunar, birth, gender, addr, phone, email, mailreceive, snsreceive, grade)
values('mokgin752', '7523', '�⸰', 'S', '19800101', 'F', '��⵵ �Ⱦ�� ���ȱ� ������ 126', '01055555555', 'mokgin@gmail.com', 'Y', 'Y', 'C');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_notice �����������̺� (�ٽ�)

--���̺� ����
create table tb_notice(
    sno              number(8)              not null                                     -- �Ϸù�ȣ
   ,gubun           varchar2(10)           not null                                     -- ����(info:�ȳ�/aca:��ī����/mojib:����)
   ,title              varchar2(100)          not null                                     -- ����
   ,content       varchar2(1000)         not null                                     -- ����
   ,regdt            date                       default sysdate         not null       -- �����
   ,writer            varchar2(10)           not null                                      -- �ۼ���
   ,img              varchar2(1000)                                                         -- ÷������
   ,primary key(sno)                                                                        -- �⺻Ű
); 


--������ ����
create sequence tb_notice_seq;


--�� �߰�
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_event �̺�Ʈ ���̺� (����)


-- ���̺� ����
create table tb_event (
    ecode          varchar2(5)         not null           -- �����ڵ� 
    , etitle          varchar2(100)      not null           -- ����  
    , eimg          varchar2(100)      not null           -- �����̹���
    , sdate         date                   not null           -- �������۳�¥
    , edate         date                   not null           -- �������ᳯ¥
    , windate      date                   not null           -- ��÷�ڹ�ǥ��¥
    , grade         varchar2(11)       not null           -- ���������
    , primary key(ecode)
);


-- �� �߰�
insert into tb_event (ecode, etitle, eimg, sdate, edate, windate, grade)
values ('co001', '2022 ��Ÿ�Ͽ��� ���� �ܼ�Ʈ', 'style.jpg', '2022-08-29', '2022-09-18', '2022-09-22', 'N/Y/O/G/B/G');

insert into tb_event (ecode, etitle, eimg, sdate, edate, windate, grade)
values ('ad001', 'ê�� �ӴڼӴ�(SAC) �̺�Ʈ', 'SAC.jpg', '2022-05-02', '2022-12-31', '2023-01-01', 'N/Y/O/G/B/G');

insert into tb_event (ecode, etitle, eimg, sdate, edate, windate, grade)
values ('co002', '[���ȸ��] �ĺ� ������ & ������Ͼ� �佺Ƽ�� ���ɽ�Ʈ�� ����� �̺�Ʈ ', 'paavo.jpg', '2022-08-13', '2022-08-26', '2022-08-26', 'G');

insert into tb_event (ecode, etitle, eimg, sdate, edate, windate, grade)
values ('ad002', '������������ ���ȸ���� ���� ����� ĥĥ(77)�̺�Ʈ', 'summer.jpg', '2022-08-12', '2022-08-24', '2022-08-24', 'G');

insert into tb_event (ecode, etitle, eimg, sdate, edate, windate, grade)
values ('cd003', '[����ȸ��] ������â�� ��ȹ���� ������ ����� ����� �̺�Ʈ', 'choral.jpg', '2022-08-06', '2022-08-23', '2022-08-23', 'GR/B/GO');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_applicant �̺�Ʈ ��û�� ���̺� (����)

-- ���̺� ����
create table tb_applicant (
    ano                 varchar2(4)     not null          primary key     -- �Ϸù�ȣ
    ,ecode             varchar2(5)     not null                               -- �����ڵ�
    ,aid                 char(10)          not null                               -- ���̵�
    ,adate              date               default sysdate                    -- �ۼ���¥
    ,acomment        varchar2(500)  not null                               -- ��۳���
);


-- ������ ����
create sequence applicant_seq;


-- �� �߰�
insert into tb_applicant (ano, ecode, aid, acomment)
values ( applicant_seq.nextval 
        ,'co001'
        ,'gogo123' 
        ,'�츮���� �ǾƴϽ�Ʈ����� �� �ٸ� �������� ������ �� ���� ��밨��, �ǾƴϽ�Ʈ�� Ŭ���Ŀ� ���� ������ ���̰� ���� ����� �� ���ƿ�~'
        );

insert into tb_applicant (ano, ecode, aid, acomment)
values ( applicant_seq.nextval
        ,'co002'
        ,'puppy456' 
        ,'�����ִ� �ǾƴϽ�Ʈ�Դϴ�. �� �����ϰ� �;��~!'
        );
        
insert into tb_applicant (ano, ecode, aid, acomment)
values ( applicant_seq.nextval 
        ,'co003', 
        ,'kawai789', 
        ,'�ٸ� ���������̿����� ������ ���ָ� ���� �� �� �ִ� ��ȸ�� �ִٴ� �ʹ� �����Դϴ�.'
    );
        
insert into tb_applicant (ano, ecode, aid, acomment)
values (applicant_seq.nextval
        ,'co004', 
        ,'ginko159', 
        ,'���� �ǾƳ� ������ �αⰡ �������Ͱ��� ���� �����ϰ�ͽ��ϴ�.'
        );
                
insert into tb_applicant (ano, ecode, aid, acomment)
values ( applicant_seq.nextval 
        ,'co005', 
        ,'mokgin752', 
        ,'9�� 20���� �����ε� ���� ������ �ް� �ͳ׿�!! ���� ����մϴ�.'
        );
        

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_review ���������̺� (�ѻ�)

create table tb_review(
     snum          number(10)                                                               -- �Ϸù�ȣ(pk)
    ,icode          varchar2(50)          not null                                          -- ��ǰ�����ڵ�(fk)
    ,title             varchar2(100)        not null                                          -- ��ǰ ����
    ,img             varchar2(100)                                                            -- ��ǰ �̹���
    ,reid            char(10)                                                                    -- �ۼ��� ���̵�(fk)
    ,rdate          date                      default sysdate        not null            -- �ۼ���
    ,rscop         varchar2(20)           not null                                          -- ����
    ,rcont          varchar2 (1000)                                                           -- ������ 
    
    ,primary key(snum)
);


-- ������ ����
create sequence re_seq start with 1 ;


-- �� �߰�
insert into tb_review(snum,icode,title,img,reid,rdate,rscop,rcont)
values(
         re_seq.nextval
        ,'exhibit004'
        ,'�Ӹ� ī��Ƽ�� �극�� Ư����: ������ ����'                        
        ,'HenriCartier.png'            
        ,'mokgin752'
        ,'2022-09-08'
        ,'�ڡڡ�'    
        ,'��� �̻��Դϴ�'
        );          
insert into tb_review(snum,icode,title,img,reid,rdate,rscop,rcont)
values(
         re_seq.nextval
        ,'show001'
        ,'���� þ �� ���쿹��'                        
        ,'laychen.png' 
        ,'gogo123'
        ,'2022-09-01'
        ,'�ڡڡڡڡ�'    
        ,'�� ���־��'
        );                
insert into tb_review(snum,icode,title,img,reid,rdate,rscop,rcont)
values(
         re_seq.nextval
        ,'exhibit001'
        ,'�ؼ��� ������ �������� ��������'                        
        ,'anthonybrowne.png'   
        ,'puppy456'
        ,'2022-09-01'
        ,'�ڡ�'    
        ,'�־�'
        );     
insert into tb_review(snum,icode,title,img,reid,rdate,rscop,rcont)
values(
         re_seq.nextval
        ,'show005'
        ,'������� �Բ��ϴ� 11�� �ܼ�Ʈ'                        
        ,'11concert.png'   
        ,'kitty555'
        ,'2022-07-27'
        ,'�ڡڡڡڡ�'    
        ,'����մϴ�'
        );           
insert into tb_review(snum,icode,title,img,reid,rdate,rscop,rcont)
values(
         re_seq.nextval
        ,'exhibit003'
        ,'Ȧ � Ʈ�� ����� 2022: ����, ���� ���� ����'                        
        ,'truckstore.png'   
        ,'hamster974'
        ,'2022-07-24'
        ,'�ڡڡڡ�'    
        ,'������ ��� ���� ��ȹ ��Ź�帳�ϴ�'
        );   


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- tb_inquiry �������̺� (����)


-- ���̺� ����
create table tb_inquiry(
    in_no        varchar2(20)    primary key                            -- ���ǹ�ȣ
    ,in_type      char(20)          not null                                 -- ��������
    ,in_date      date                default sysdate       not null    -- �ۼ���
    ,userid        char(10)          not null                                 -- ȸ��ID
    ,in_title        varchar(50)     not null                                 -- s�ۼ�����
    ,in_content   varchar(500)   not null                                 -- �ۼ�����
);


--�� �߰�
insert into tb_inquiry(in_no, in_type, in_date, userid, in_title, in_content)
values('20220801114130-001', 'ȸ���� �', '20220801', 'gogo123', 'ȸ���� ��ο�', '�� ������ ���� �˴ϱ�?');

insert into tb_inquiry(in_no, in_type, in_date, userid, in_title, in_content)
values('20220802103101-002', 'Ȩ������ �', '20220802', 'ginko159', '���ڰ� �� �� ������', '�۾� ũ�� ��... ũ��... ���ּ����...');

insert into tb_inquiry(in_no, in_type, in_date, userid, in_title, in_content)
values('20220802103101-003', '���ǽü�', '20220815', 'kawai789', '�ֺ��� �Ƶ����� ������?', '�Ƶ��������ε�');

insert into tb_inquiry(in_no, in_type, in_date, userid, in_title, in_content)
values('20220802103101-004', 'Ƽ�� ���� ���', '20220817', 'puppy456', '���� ��� Ȯ��', '��ҵȰ� �³���?');



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 
-- tb_answer �亯���̺� (����)


-- ���̺� ����
create table tb_answer (
    in_no           varchar2(20)      not null          --���ǹ�ȣ
   ,an_content    varchar2(500)    not null          --�亯����
);


--���߰�
insert into tb_answer (in_no, an_content)
values('20220817010101-004', 'Ȯ�� ��� ��ҵǾ����ϴ�. �����ּż� �����մϴ�.');

insert into tb_answer (in_no, an_content)
values('20220815152401-003', '�����ϴ�.');

insert into tb_answer (in_no, an_content)
values('20220802103101-002', '�����ϰڽ��ϴ�.');


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////