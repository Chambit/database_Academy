--DDL���� (Ʈ������� �����ϴ�)
--CREATE, ALTER, DROP���� �ֽ��ϴ�

DROP TABLE DEPTS; -- DEPTS����
CREATE TABLE DEPTS(
    DEPT_NO NUMBER(2), --���� 2�ڸ�
    DEPT_NAME VARCHAR2(30), -- 30BYTE (�ѱ��� 15����, ���� OR ����� 30����)
    DEPT_YN CHAR(1), --�������� 1BYTE (VARCHAR2�� ��ü����)
    DEPT_DATE DATE, -- ��¥
    DEPT_BONUS NUMBER(10, 2), --���� 10�ڸ�, �Ҽ��� 2�ڸ����� ����
    DEPT_CONTENT LONG -- 2�Ⱑ �������ڿ� ( VARCHAR2 ���� �� ū ���ڿ�  )
);    
DESC DEPTS;

INSERT INTO DEPTS VALUES(99, 'HELLO', 'Y', SYSDATE, 3.14, 'HELLO WORLD, HI~~');
INSERT INTO DEPTS VALUES(100, 'HELLO', 'N', SYSDATE, 3.14, 'BYE~');
INSERT INTO DEPTS VALUES(1, 'HELLO', '��', SYSDATE, 3.14, 'BYE~');

SELECT * FROM DEPTS;
----------------------------------------------------------
--���̺� ���� ���� ALTER

--�÷� �߰�
ALTER TABLE DEPTS ADD (DEPT_COUNT NUMBER(3) );

DESC DEPTS;

--�÷� ��Ī ����
ALTER TABLE DEPTS RENAME COLUMN DEPT_COUNT TO EMP_COUNT;--> DEPT_COUNT -> EMP_COUNT�� ����
DESC DEPTS;

--�÷� ����(ũ��)
ALTER TABLE DEPTS MODIFY (EMP_COUNT NUMBER(10) ); -- EMP_COUNT�÷��� Ÿ���� ����
ALTER TABLE DEPTS MODIFY (EMP_COUNT NUMBER(2) ); -- EMP_COUNT�÷��� Ÿ���� ����
ALTER TABLE DEPTS MODIFY (DEPT_NAME VARCHAR2(1)); --���������Ͱ� ������ ũ�⸦ �Ѿ�� ���, ����Ұ�.
SELECT * FROM DEPTS;

--�÷� ����(DROP COLUMN)
ALTER TABLE DEPTS DROP COLUMN EMP_COUNT;

DROP TABLE DEPTS;
DROP TABLE DEPARTMENTS; -- ���������̶�� ������ �־, ���̺��� �ѹ��� ������ �� �����ϴ�.

------------------------------------------------------------
--���̺�� DEPT2
--DEPT_NO ����Ÿ�� 3����
--DEPT_NAME ���������� 15����Ʈ
--LOCA_NUMBER ����Ÿ�� 4����
--DEPT_GENDER �������� 1����
--REG_DATE ��¥Ÿ��
--DEPT_BONUS �Ǽ� 5�ڸ�����

--��¥ ������ INSERT

CREATE TABLE DEPT2 (
    DEPT_NO NUMBER(3),
    DEPT_NAME VARCHAR2(15),
    LOCA_NUMBER NUMBER(4),
    DEPT_GENDER VARCHAR2(1),
    REG_DATE DATE,
    DEPT_BONUS NUMBER(10, 5)
);

SELECT * FROM DEPT2;

INSERT INTO DEPT2 VALUES(352, '�ȳ��ϼ���', 2512, 'M', SYSDATE, 0.254210);