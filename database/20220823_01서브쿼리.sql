
����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
i:\java202202\database\20220823_01��������.sql
////////////////////////////////////////////////////////////////

�� [��������]
  - SQL�� �� �� �ٸ� SQL��
  - ���̺� ������ �ٽ� �� �� �������� ���� ���ڵ� ��ȸ �� �˻�

-- ���������� ����� ��ȸ�Ͻÿ�
select kor from sungjuk;
select avg(kor) from sungjuk;
select round(avg(kor),0) from sungjuk;
select round(avg(kor),0) as avg_kor from sungjuk;

��1) �������� ���(66��)���� ���� ���������� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor>66;

select uname, kor
from sungjuk
where kor>(select round(avg(kor),0) from sungjuk);


��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�
--1) ���� ������ �������� ����� ���Ͻÿ�
select round(avg(kor),0)
from sungjuk
where addr='Seoul'; --73

--2) 73�� �̻��� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor>=73;

--3) ���� ������ �������� ��� �̻��� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');


��3)���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul')
and addr<>'Seoul'; -- addr!='Seoul' ����


��4)���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
--1) �������� �ּҰ��� ���Ͻÿ�
select min(kor) from sungjuk; --20

--2) 20���� ������ ���� �Ǵ� ���� ������ �ִ��� ��ȸ�Ͻÿ�
select uname, kor, mat, eng
from sungjuk
where mat<=20 or eng<=20;

--3) ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
select uname, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) 
      or 
      eng<=(select min(kor) from sungjuk);




















