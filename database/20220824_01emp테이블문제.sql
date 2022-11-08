
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202207\database\20220824_01emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////


��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key --���(-9999~9999)
  ,ename      varchar2(50)              --�̸�
  ,job        varchar2(10)              --����
  ,mgr        number(4)                 --�Ŵ�������
  ,hiredate   date                      --�Ի���
  ,sal        number(7,2)               --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)               --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                 --�μ��ڵ�(-99~99)
);


��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////
select * from emp;
drop table emp;


��3) ��ü ���� ������ ��ȸ�Ͻÿ�
select count(*) from emp;

��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�
select * from emp;
select empno, ename, job, mgr, hiredate, sal, deptno from emp;

��5) ����̸���(��������) �����Ͻÿ�
select * from emp order by ename asc; --asc��������

��6) ����̸���(��������) �����Ͻÿ�
select * from emp order by ename desc;

��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno from emp order by sal desc;

��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno from emp order by deptno asc, sal desc;

��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno from emp order by deptno asc, hiredate asc;


��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select distinct (job) from emp;
select job from emp group by job;

��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�

select ename �̸�, job ����, sal �޿� from emp order by job asc, sal desc;


��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
--and������
select ename, sal
from emp 
where sal>=100 and sal<=400
order by sal desc;

--between������
select ename, sal
from emp 
where sal between 100 and 400
order by sal desc;



��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select ename, sal
from emp 
where sal<=100 or sal>=400
order by sal desc;



��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
--or������
select ename, job
from emp 
where job='����' or job='����'
order by ename;

--in������
select ename, job
from emp 
where job in ('����','����')
order by ename;


��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select ename, deptno
from emp 
where deptno=30;

--in ������
select ename, deptno
from emp 
where deptno in (30);


��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
select distinct (deptno) from emp;
select deptno from emp group by deptno;


��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ)
--or������
select ename, deptno
from emp 
where deptno=10 or deptno=20 or deptno=30;

--in������
select ename, deptno
from emp 
where deptno in (10, 20, 30);

��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ)
--and������
select ename, sal
from emp 
where sal>=300 and sal<=500;

--between������
select ename, sal
from emp 
where sal between 300 and 500;



��19) �̸��� ����ȭ ��ȸ�Ͻÿ�
select ename
from emp 
where ename='����ȭ';


��20) �达���� ��ȸ�Ͻÿ�
select ename
from emp 
where ename like '��%';

��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
select ename
from emp 
where ename like '%ȭ%';



��22) �μ��ڵ尡 20�� ���ڵ忡 ���ؼ�
      �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
select deptno, sal, comm from emp;
update emp set comm= sal*0.01 where deptno=20;


��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select ename, deptno, sal, comm, sal*12+comm as ���� from emp;

/* ��alter�� ������� �ʴ´١�
alter table emp add(salyear number(7,2));
update emp set salyear= sal*12+comm;
select ename, deptno, sal, comm, salyear as ���� from emp;
*/

��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
--comm�� null���� ���� ��ȸ
select ename, comm from emp where comm is null;

--comm�� null���� 0���� �ٲٱ�
select ename, nvl(comm, 0) 
from emp 
where comm is null;

--comm�� null���� 0���� �ٲ���, ���� ����ϱ�
select ename, deptno, sal, nvl(comm, 0) as comm, sal*12+nvl(comm, 0) as ���� 
from emp;

--������ �ݿø��ؼ� �Ҽ��� ���� ��ȸ�Ͻÿ�
select ename, deptno, sal, round(sal*12+nvl(comm, 0),0) as ���� 
from emp;


��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����)
--|| ���տ�����
select ename || '�� �޿��� ' || sal || '�Դϴ�' as pay from emp;

--concat(Į����, '���ڿ�')
select concat(ename, '�� �޿��� '), concat(sal, '�Դϴ�') from emp;

-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : || ���տ�����   

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
where hiredate<'2005-01-01' --'2005/01/01' ����
order by hiredate;

��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
--or������
select ename, job, deptno
from emp
where deptno=20 or deptno=30
order by ename;

--in������
select ename, job, deptno
from emp
where deptno in (20,30)
order by ename;


��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                      20�̸� ������
                      30�̸� �����η� �ٲ㼭 ���)
select empno, ename, deptno, case when deptno=10 then '������'
                                  when deptno=20 then '������'
                                  when deptno=30 then '������'
                             end as deptname
from emp;



��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal                 --3)
      from emp                          --1)
      where not(sal>200 and sal<300)    --2)
      order by sal;                     --4)

--1)emp���̺���
--2)�޿��� not(201~209)
--  �޿��� 201~209�� �ƴ� ���� ������� 
--3)�����ȣ�� �޿���
--4)�޿��� ������������ �����Ͽ� ��ȸ�Ͻÿ�


��30) ������ SQL���� �м��Ͻÿ�
      select empno, sal                 --3)           
      from emp                          --1)
      where not sal>200 and sal<300     --2)
      order by sal;                     --4)

--1)emp���̺���
--2)�޿��� not(>200)�̸鼭 <300
--  �޿��� 200���ϸ鼭 300�̸��� ���� �������
--3)�����ȣ�� �޿���
--4)�޿��� ������������ �����Ͽ� ��ȸ�Ͻÿ�

//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp���̺� ���� ��������]


��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
select deptno, sum(sal)
from emp
group by deptno
order by deptno;

��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�
select deptno, sum(sal)
from emp
group by deptno
having sum(sal)>=1500;


��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=300;

��34) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
where sal>=300
group by deptno
order by avg(sal);


��35) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
where sal>=300
group by deptno
having avg(sal)>=400
order by avg(sal);


��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
--��ȯ�Լ� : to_char(������¥, '���ϴ� ���')

--�Ի��� ��ȸ
select hiredate from emp; 

--�Ի��Ͽ��� �� ��������
select to_char(hiredate, 'mm') from emp;
select to_char(hiredate, 'mm')as �� from emp;

select to_char(hiredate, 'yy')as �Ի�⵵ from emp;
select to_char(hiredate, 'dd')as �� from emp;

--�Ի� ������ �׷�ȭ�ϰ�, �హ�� ���ϱ�(�ο���)
select to_char(hiredate, 'mm')as ��, count(*) 
from emp 
group by to_char(hiredate, 'mm')
order by count(*) desc;

--extract�Լ��� ����
select extract(month from hiredate), count(*)
from emp
group by extract(month from hiredate)
order by extract(month from hiredate);


��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ�
select mgr, count(*)
from emp
group by mgr;


��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ�
--�����ȣ 7654�� �޿�
select sal from emp where empno=7654; --400 

--�����ȣ 7654�� �޿����� ���� ��
select empno, ename, sal
from emp
where sal<(select sal from emp where empno=7654);

��39) �μ����� �޿�+Ŀ�̼��� ��������  �ִ밪, �ּҰ�, ��հ�(�ݿø� �ؼ�)�� �μ������� ��ȸ�Ͻÿ�
select deptno, max(sal+nvl(comm,0)) �ִ밪
             , min(sal+nvl(comm,0)) �ּҰ�
             , round(avg(sal+nvl(comm,0)),1) ��հ�
from emp
group by deptno
order by deptno;
////////////////////////////////////////////////////////////////////////////////
�� [��¥ �������� ����]

��40) �� �����鿡 ���ؼ� ������ �̸��� �ټӳ���� ���Ͻÿ�
      ��, �ټӳ���� �������� �����Ͽ� ��Ÿ���ÿ�

--�̸�, �Ի����� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate from emp order by hiredate;

--�ټ��� : ���糯¥-�Ի���
select ename, hiredate, sysdate-hiredate from emp order by hiredate;

--(���糯¥-�Ի���)/365
select ename, hiredate, (sysdate - hiredate)/365 as �ټӳ��
from emp
order by �ټӳ�� desc;

--(���糯¥-�Ի���)/365 -> �Ҽ��� ����
select ename, hiredate, trunc((sysdate - hiredate)/365) as �ټӳ��
from emp
order by �ټӳ�� desc;

--extract(year from)�Լ�
--��� ����Ȯ�ϹǷ� �ټӳ�� ������� ������� �ʴ´�.
/*
select ename, hiredate, extract(year from sysdate)- extract(year from hiredate) as �ټӳ��
from emp
order by �ټӳ��;
*/

��41) �Ʒ��� ���� ��� �Ͻÿ�
      ��) �������� �ټӳ�� : 20��
--���� ������ ||���
select ename || '�� �ټӳ�� : ' || trunc((sysdate - hiredate)/365) || '��'
from emp
order by ename;

--concat�Լ� ���
select concat(ename,'�� �ټӳ�� :'),concat(trunc((sysdate - hiredate)/365),'��')
from emp
order by ename;


��42) ������� �ټӳ���� ������ ���� ��ȸ(�̸�, �ټӳ��)�Ͻÿ�
--����� ��ȸ�ϱ�
select * from emp where ename='�����';

--������� �ټӳ�� ���ϱ�
select hiredate from emp where ename='�����';
select sysdate-hiredate from emp where ename='�����';
select (sysdate-hiredate)/365 from emp where ename='�����';
select trunc((sysdate-hiredate)/365) from emp where ename='�����'; --20

--������� �ټӳ���� ������ �� ��ȸ
select ename �̸�, hiredate, trunc((sysdate - hiredate)/365) �ټӳ��
from emp
where trunc((sysdate - hiredate)/365)=(
                                       select trunc((sysdate - hiredate)/365) 
                                       from emp 
                                       where ename='�����'
                                       )
order by ename;


select * from emp;
��43) �Ի����� ��15�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)

--�ټӳ���� 15�� �̻� ��ȸ�ϱ�
select ename, hiredate, sal
from emp
where trunc((sysdate-hiredate)/365)>=15;

--���� ���� ���ϱ�
select ename, hiredate, sal, sal*12+comm
from emp
where trunc((sysdate-hiredate)/365)>=15;

--���� ���� ���ϱ� Ŀ�̼��� null�� 0���� ġȯ
select ename, hiredate, sal, sal*12+nvl(comm,0) 
from emp
where trunc((sysdate-hiredate)/365)>=15;

select ename, hiredate, sal, sal*12+nvl(comm,0) as ���翬��
from emp
where trunc((sysdate-hiredate)/365)>=15;

--���翬������ 10% �λ�� �ݾ�
select ename, hiredate, sal
     , sal*12+nvl(comm,0) as ���翬��
     , (sal*12+nvl(comm,0))*0.1 as �λ�ȱݾ�
from emp
where trunc((sysdate-hiredate)/365)>=15;

--���翬�� + �λ�� �ݾ� = ��������
select empno ���, ename �̸�, hiredate �Ի���
     , sal*12+nvl(comm, 0) ���翬��
     , (sal*12+nvl(comm, 0))*0.1 �λ�ȱݾ�
     , (sal*12+nvl(comm, 0))*1.1 �λ��Ŀ���
from emp
where trunc((sysdate - hiredate)/365)>=15;

--�������� �Ҽ������� �ݿø�
select empno ���, ename �̸�, hiredate �Ի���
     , sal*12+nvl(comm, 0) ���翬��
     , (sal*12+nvl(comm, 0))*0.1 �λ�ȱݾ�
     , round((sal*12+nvl(comm, 0))*1.1) �λ��Ŀ���
from emp
where trunc((sysdate - hiredate)/365)>=15;

--�������� �������� �����ϱ�
select empno ���, ename �̸�, hiredate �Ի���
     , trunc((sysdate-hiredate)/365) �ټӳ��
     , sal*12+nvl(comm, 0) ���翬��
     , (sal*12+nvl(comm, 0))*0.1 �λ�ȱݾ�
     , round((sal*12+nvl(comm, 0))*1.1) �λ��Ŀ���
from emp
where trunc((sysdate - hiredate)/365)>=15
order by �λ��Ŀ��� desc;




��44) �Ի�⵵�� ¦���� �������� �޿��� ����� ����(job)���� ����Ͻÿ�
--����, �Ի��� ��ȸ�ϱ�
select job,hiredate from emp;

--�Ի��Ͽ��� �⵵ �����ϱ�
select hiredate, extract(year from hiredate) from emp;

--¦���⵵ �����ϱ�
select ename, job, hiredate, extract(year from hiredate)
from emp
where mod(extract(year from hiredate),2)=0;

--���޺� �޿��� ��� ���ϱ�
select job, avg(sal)
from emp
where mod(extract(year from hiredate),2)=0
group by job
order by avg(sal) desc;



