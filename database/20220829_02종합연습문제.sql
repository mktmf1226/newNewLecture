
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202207\database\20220829_02���տ�������.sql
///////////////////////////////////////////////////////////////////////////////

�� [���� ��������]

select count(*) from tb_student; --6��
select count(*) from tb_gwamok;  --9��
select count(*) from tb_sugang;  --14��

��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)(������ ������ ����)

--������ �������� ���� ��ȸ�ϱ�
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;

--1)������ ������ �߿��� ������ ���� ���� ���� ��ȸ
select max(ghakjum) --5
from tb_gwamok 
where gcode like 'd%';

--2) 1)������� ���� ����(5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
--   ��, ������ ������ �߿��� ������ ���� ���� �����ڵ�(��, �ߺ��� ������ ���ٴ� ���� �Ͽ�)
select gcode
from tb_gwamok
where ghakjum=(5)
and gcode like 'd%';  --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
and gcode like 'd%';  --d002

--3) 2)���� ���� �����ڵ�(d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
              select gcode
              from tb_gwamok
              where ghakjum=(select max(ghakjum) from tb_gwamok where gcode like 'd%')
              and gcode like 'd%'
            );

--4) 3)�� ����� AA���̺�� ���� ��, �л����̺��� �����ؼ� �̸� ��������
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

/*��Ǯ��
--������ ������ �߿��� ������ ���� ���� ������ ���ϰ� ��������
select ghakjum, gcode
from tb_gwamok
where gcode like 'd%'
order by ghakjum desc; -- gcode='d002'

////////////////////////////////////////////////////////////////////////////////
--max�Լ�
select max(ghakjum) from tb_gwamok where gcode like 'd%';

--max�Լ��� gcode='d002' ����
select gcode
from tb_gwamok
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
////////////////////////////////////////////////////////////////////////////////

--gcode='d002'�� ���������ϰ� ���ȣ�� 1�� �� ���ϱ�(���� ���� ������)
select gcode
from (
      select gcode
      from tb_gwamok
      where gcode like 'd%'
      order by ghakjum desc
      ) AA
where rownum=1;

--gcode='d002'�� ������ �л� ���ϱ�
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

--�л� �̸� �����ϱ�
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


��2) �й��� ������û�� �������� ���ϰ� �й��� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��)

--�л����̺� ��ȸ�ϱ�
select hakno, uname from tb_student order by hakno;

--1) ������û�� ������ ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) �й����� ������ ���ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno;

--3) ������û���� ���� �л��鵵 ������ �� �ֵ��� �л����̺� left join�ϰ�,
--   2)��� (AA���̺�)�� ����
select ST.hakno, ST.uname, AA.hakno, AA.������
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as ������
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno;

--4) �������� null�̸� 0���� �ٲٰ�, �й������� ��ȸ�ϱ�
select ST.hakno, ST.uname, nvl(AA.������, 0)
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as ������
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--5) �ٹ�ȣ �߰� (�ٹ�ȣ�� �ִ� ���¿��� ���ĵ�)
select ST.hakno, ST.uname, nvl(AA.������, 0), rownum as rnum
from tb_student ST left join (
                              select SU.hakno, sum(GW.ghakjum) as ������
                              from tb_sugang SU join tb_gwamok GW
                              on SU.gcode=GW.gcode
                              group by SU.hakno
                             ) AA
on ST.hakno=AA.hakno
order by ST.hakno;

--6) 5�� ����� ��������(BB���̺�)�ϰ���, �ٹ�ȣ �߰��ϱ�
select BB.hakno, BB.uname, BB.������2, rownum as rnum --�� �÷��� BB.*�� ����
from (
        select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
        from tb_student ST left join (
                                      select SU.hakno, sum(GW.ghakjum) as ������
                                      from tb_sugang SU join tb_gwamok GW
                                      on SU.gcode=GW.gcode
                                      group by SU.hakno
                                     ) AA
        on ST.hakno=AA.hakno
        order by ST.hakno
     ) BB;

--7) 6)�� ����� ��������(CC���̺�)�ϰ� �ٹ�ȣ(rnum) 4~6 ��ȸ�ϱ�
select *
from (
        select BB.hakno, BB.uname, BB.������2, rownum as rnum
        from (
                select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
                from tb_student ST left join (
                                              select SU.hakno, sum(GW.ghakjum) as ������
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

/* ��Ǯ��
--������û�� �л��� ���ϱ�
--�л����̺�� �������̺��� left join����
select ST.hakno, gcode
from tb_student ST left join tb_sugang SU
on ST.hakno= SU.hakno;

--�й��� ������û�� ������ ���ϱ�
select hakno, sum(ghakjum)
from (
      select ST.hakno, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno;

--������û���� ���� �л��� �������� 0���� ǥ���ϰ� �й��� �����ϱ�
select hakno, nvl(sum(ghakjum),0)
from (
      select ST.hakno, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno
order by hakno;

--�ٹ�ȣ �߰�
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

--4~6��(2������)�� ��ȸ�ϱ�
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

��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������)
--�������̺� ���߰� ���ּ���
--(�������� �� ���� ���̾ ���Ȯ���ϱⰡ ���� �ָ��մϴ�)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

--1) �����ڵ尡 ��ġ�ϴ� ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) �й����� ������ ���ϰ�, ������������ �������� �����ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by sum(GW.ghakjum) desc;

--3) 2)�� ����� AA���̺�� �����, �л����̺� �����ؼ� �̸� ��������
select AA.hakno, AA.������, ST.uname, rownum as rnum
from(
      select SU.hakno, sum(GW.ghakjum) as ������
      from tb_sugang SU join tb_gwamok GW
      on SU.gcode=GW.gcode
      group by SU.hakno
      order by sum(GW.ghakjum) desc
    ) AA join tb_student ST
on AA.hakno = ST.hakno;

--4) 3)�� ����� ��������(BB)�ϰ� �ٹ�ȣ(rnum) 1 ��ȸ�ϱ�
select *
from (
        select AA.hakno, AA.������, ST.uname, rownum as rnum
        from(
              select SU.hakno, sum(GW.ghakjum) as ������
              from tb_sugang SU join tb_gwamok GW
              on SU.gcode=GW.gcode
              group by SU.hakno
              order by sum(GW.ghakjum) desc
            ) AA join tb_student ST
        on AA.hakno = ST.hakno
     )BB
where rnum=1;


/* ��Ǯ��
--������û���� ���� �л��� �������� 0���� ǥ���ϰ� ������������ ��������
select hakno, uname, nvl(sum(ghakjum),0) as hap
from (
      select ST.hakno, uname, gcode
      from tb_student ST left join tb_sugang SU
      on ST.hakno= SU.hakno
     ) AA left join tb_gwamok GW
on AA.gcode=GW.gcode
group by hakno, uname
order by hap desc;


--�ٹ�ȣ �߰�
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

--1�� ��ȸ�ϱ�
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










































