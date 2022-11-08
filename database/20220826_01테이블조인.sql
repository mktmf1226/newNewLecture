
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202207\database\20220826_01���̺�����.sql
////////////////////////////////////////////////////////////////////////////////

�� [���̺� ����]
  - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
  - �� �� �̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
  - �� ���̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����
  
  
  ����)
       select Į����
       from ���̺��1 join ���̺��2
       on ������;                      --ANSI(ǥ��) SQL��

       select Į����
       from ���̺��1 , ���̺��2
       on ������;                      --Oracle DB SQL��
       
       select T1.*, T2.*              --T1.���Į��, T2.���Į��
       from T1 join T2
       on T1.x = T2.x;                --���̺��.Į����
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x = T2.x join T3         --3�� ���̺� ����
       on T1.y = T3.y

       select T1.*, T2.*, T3.*, T4.*
       from T1 join T2
       on T1.x = T2.x join T3
       on T1.y = T3.y join T4         --4�� ���̺� ����
       on T1.z = T4.z


�� ������ : where������, having������, on������


�� ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
   - ������ ���̺� : ���� create table �� ���̺�
   - ���� ���̺� : SQL���� ���ؼ� ������ ���̺�

   select * from tb_student;
   select count(*) from tb_student;
//////////////////////////////////////////////////////////////////////////////


�� inner join ����
--�������̺��� ��������

--�й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

--�� ���̺� ���� ������. ���� inner��������. ���� �⺻����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

--������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;



--���񱸺��ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;



--3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
--�������̺��� �������̺��� ��������
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;


--���̺���� alias(��Ī)�� �����ϴ�
--������ �л����̺� ����
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--������ �������̺� ����
select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--������ �л�,�������̺� ����
select SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;


--��ȸ�� ���̺� ���� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--�ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�
--ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--�ߺ��Ǵ� Į���� ��ȸ�� ������ �Ҽ����̺��� � ���� �������� �����ϴ�
select SU.hakno, SU.gcode, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;
///////////////////////////////////////////////////////////////////////////////

�� [���̺� ���� ����]

--��ü �� ����
select count(*) from tb_student;  --6��
select count(*) from tb_gwamok;   --9��
select count(*) from tb_sugang;   --13��


��1)������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

--������û�� �л��� ��� ����
select * from tb_sugang; --13��

--�������̺� + �л����̺�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--'����'�� ��ȸ�ϱ�
select SU.hakno, gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
where address='����';

///////////////////////////////////////////////////////////////////////////////
select SU.hakno, gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno; --AA

--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      ) AA
where AA.address='����';

--ORA-00904: "AA"."EMAIL": �������� �ĺ���
--ST ���̺��� emailĮ���� �������� �ʾ���
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      ) AA
where AA.address='����';

--AA ��Ī ���� ����
select hakno, gcode, uname, address
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )
where address='����';

--��ü�� ǥ�� * ����
select *
from (
      select SU.hakno, gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )
where address='����';
//////////////////////////////////////////////////////////////////////////////

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��

--1)�������̺� ��ȸ
select * from tb_sugang;

--2)���� ��û�� �л����� ���(�й�)
select hakno from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno; --4��
select hakno from tb_sugang group by hakno; --group by���� ���������� order by�� �Ӽ��� �����ִ�
                                            --AA alias table

--3)������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select AA.hakno, ST.address
from(
     select hakno from tb_sugang group by hakno
    ) AA join tb_student ST
on AA.hakno=ST.hakno;                       --BB alias table

--4) 3)�� ����� BB���̺�� ���� �� �ּҺ� �׷��� �� ���� ���ϱ�
select BB.address, count(*) || '��' as cnt
from (
      select AA.hakno, ST.address
      from(
           select hakno from tb_sugang group by hakno
           ) AA join tb_student ST
      on AA.hakno=ST.hakno
     ) BB
group by BB.address;


--�������̺� + �л����̺�
select SU.hakno, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--�й��� �������� �ߺ��� �л� ����
select distinct (SU.hakno), address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--������ �ο���
select address, count(*) || '��'
from (
      select distinct (SU.hakno), address
      from tb_sugang SU join tb_student ST
      on SU.hakno=ST.hakno
      )AA
group by address;


��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001  HTML     2��
     d002  ���伥    1��
     d003  �Ϸ���Ʈ  1��
     p001  JAVA    4��
     p002  Oracle  2��
     p003  JSP     2��
     p004  Python  1��

--1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;

--2) �������̺��� �����ڵ尡 ������ ���� �׷�
select gcode, count(*) 
from tb_sugang 
group by gcode;

--3) 2)�� ����� AA���̺�� �����ϰ�, �������̺� �����ϱ�
select AA.gcode, gname, concat(cnt,'��')
from (
      select gcode, count(*) as cnt
      from tb_sugang
      group by gcode
     ) AA join tb_gwamok GW    
on AA.gcode=GW.gcode
order by AA.gcode;

--group by �÷���1, �÷���2
select SU.gcode, gname, count(*) || '��' as cnt
from tb_sugang SU join tb_gwamok GW    
on SU.gcode=GW.gcode
group by SU.gcode, gname 
order by SU.gcode;



��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  12����
     g1002  ȫ�浿   8����
     g1005  ���޷�  12����
     g1006  ������   3����

--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2) �������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--3) 2)�� ����� AA���̺�� �����, �й����� �׷�ȭ�� ��, ������ �հ踦 ���Ͻÿ�
select AA.hakno, sum(AA.ghakjum) as hap
from (
      select SU.hakno, SU.gcode, GW.ghakjum
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode=GW.gcode
     ) AA
group by AA.hakno;

--4) 3)�� ����� BB���̺�� �����, �й��� �������� �л����̺��� �̸� �����ͼ� ���̱�
select BB.hakno, concat(BB.hap, '����'), ST.uname
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

--�Ǵٸ� ���
--1)�������̺� + �л����̺� + �������̺� 3�� �Ѳ����� �����ϱ�
select SU.hakno, uname, SU.gcode, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno;

--2) 1�� �׷�(�й�), 2�� �׷�(�̸�)���� �׷�ȭ�ϰ�, ������ ���ϱ�
select SU.hakno, uname, sum(ghakjum) || '����' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, uname
order by SU.hakno;
///////////////////////////////////////////////////////////////////////////////

��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python

--1) �������̺� + �������̺�� �����ϱ�
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2) �й� g1001�� ������û�� ���� ��ȸ�ϱ�
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'                  --���� �ڹ��ڵ忡�� �й��� ����ó�� �Ѵ�
order by SU.gcode;

--�����ڵ庰�� �����ϱ�
select SU.hakno, SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno='g1001'
order by SU.gcode;




��6) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������

--1) ������û�� �� �л����� �й� ��ȸ
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2) ���������� ���
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);



��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);


--�л����̺� ��ȸ�ϱ�
select hakno, uname from tb_student;

--������û�� �л��� ��ȸ�ϱ�
select distinct (SU.hakno)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--�л����̺��� ������û�� �л���� ��ġ���� ���� �й� ��ȸ�ϱ�
select hakno, uname
from tb_student
where hakno not in (
                    select distinct (SU.hakno)
                    from tb_sugang SU join tb_student ST
                    on SU.hakno = ST.hakno
                    );

--�й��� ������������ �����ϱ�
select hakno, uname
from tb_student
where hakno not in (
                    select distinct (SU.hakno)
                    from tb_sugang SU join tb_student ST
                    on SU.hakno = ST.hakno
                    )
order by hakno;





��8) daum�̸����� �� �л��� ������ ������ �����ΰ���?
select SU.hakno, uname, email, sum(ghakjum)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where email like '%daum%'
group by SU.hakno, uname, email;



��9) ���������� �ϰ��ִ� �л����� �����ΰ���?
select SU.hakno, uname, count(SU.gcode)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, uname
having count(SU.gcode)>=2;



