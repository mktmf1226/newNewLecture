
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202207\database\20220829_03CSV��ȯ.sql
///////////////////////////////////////////////////////////////////////////////

�� [CSV ����]
  - ��� �����Ͱ� , �� ���еǾ� �ִ� ����
  
�� [CSV ������ �����ͺ��̽��� ��������]
  - �������������� https://data.go.kr/ Ȱ��
  
  
  
��) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.csv�غ� (258267��)


--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro (
    zipno      char(5)        --�����ȣ
   ,zipaddress varchar(1000)  --�ּ� 
);

commit;
drop table zipdoro; --���̺� ����

--3) ��������� ��������
  - zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
  - zipdoro ���̺� ��Ŭ�� -> export      (��������)

select count(*) from zipdoro; --258267��

select * from zipdoro;


--����Ư���� �������� ���۵Ǵ� �����ȣ�� ����� Ȯ���Ͻÿ�
select count(*) 
from zipdoro
where zipaddress like '����Ư���� ������%';

select count(*) 
from zipdoro
where zipno like '_6___';

select zipno, count(zipno) 
from zipdoro
where zipaddress like '����Ư���� ������%'
group by zipno;
////////////////////////////////////////////////////////////////////

��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�Ͻÿ� (11874��)

create table school (
    schoolid    varchar2(10)     --�б�ID
   ,schoolname  varchar2(255)   --�б��� 
   ,schoolgubun varchar2(20)    --�б��ޱ���
   ,schooladdr  varchar2(255)   --���������θ��ּ�
   ,cdate       date             --�������� (���� YYYY-MM-DD)
   ,udate       date             --�������� (���� YYYY-MM-DD)
   ,latitude    number(20,10)    --����
   ,longitude   number(20,10)    --�浵
);

commit;
select count(*) from school;
select * from school;

select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null;      --B000027304�࿡�� �������
select * from school where cdate is null;
select * from school where udate is null;
select * from school where latitude is null;
select * from school where longitude is null;


��) �� �õ��� �ʵ��б� ���б� ���ϱ�
(����Ư����, �λ걤����, �뱸������, ��õ������, ���ֱ�����, ����������, ��걤����, 
��⵵, ������, ��û�ϵ�, ��û����, ����Ư����ġ��, ����ϵ�, ���󳲵�, ���ϵ�, ��󳲵�, �泲,
����Ư����ġ��, ���, ����, �뱸, ���)

select substr(schooladdr, 1, instr(schooladdr, ' ')), schoolgubun, count(*)
from school
where schoolgubun='�ʵ��б�' or schoolgubun='���б�'
group by substr(schooladdr, 1, instr(schooladdr, ' ')), schoolgubun
order by substr(schooladdr, 1, instr(schooladdr, ' '));


select
     nvl(cho.addr1, '-') as ����
    ,nvl(cho.ckinds, '�ʵ��б�') as �б�����
    ,nvl(cho.c_cnt, 0) as ����
    ,nvl(jung.addr2, '-') as ����
    ,nvl(jung.jkinds, '���б�') as �б�����
    ,nvl(jung.j_cnt, 0) as ����
from(
    select addr1, ckinds, count(*) as c_cnt
    from (
        select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr1, schoolgubun as ckinds
        from school
        )
    group by addr1, ckinds
    having ckinds like '��%'
    ) cho full join (
                select addr2, jkinds
, count(*) as j_cnt
                from (
                    select substr(schooladdr, 0, instr(schooladdr, ' ')) as addr2, schoolgubun as jkinds
                    from school
                    )
                group by addr2, jkinds
                having jkinds like '��%'
                ) jung
on cho.addr1 = jung.addr2
order by cho.addr1;

/*
create table tb_school (
    schno   char(10)        --�б�ID
   ,schname varchar(1000)   --�б��� 
   ,grade   varchar(100)    --�б��ޱ���
   ,address varchar(1000)   --���������θ��ּ�
   ,regdt   date            --��������
   ,condt   date            --��������
   ,letitd  number(12,9)    --����
   ,longitd number(12,9)    --�浵
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
