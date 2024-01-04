--INSERT�� 2���� ����

--���̺� ������ ������ Ȯ���ϴ� ���
DESC DEPARTMENTS;

SELECT * FROM DEPARTMENTS;
--1ST (�÷��� ��Ȯ�ϰ� ��ġ��Ű�� ���� �÷��� ������ ����)
INSERT INTO DEPARTMENTS VALUES(280, '������', NULL, 1700);

--DML���� Ʈ������� �׻� ����˴ϴ�
ROLLBACK;

--2ND (�÷��� ��Ī�ؼ� �ִ� ���)
INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID) VALUES(280, '������', 1700);

--�־��
INSERT INTO DEPARTMENTS VALUES(290, '�����̳�', NULL, 1700);
INSERT INTO DEPARTMENTS VALUES(300, 'DB������', NULL, 1800);
INSERT INTO DEPARTMENTS VALUES(310, '�����ͺм���', NULL, 1800);
INSERT INTO DEPARTMENTS VALUES(320, '�ۺ���', NULL, 1800);
INSERT INTO DEPARTMENTS VALUES(330, '����������', NULL, 1800);
---
--INSERT������ ���������� ���˴ϴ�.
--�ǽ��� ���� ��¥���̺� ����
CREATE TABLE EMPS AS (SELECT * FROM EMPLOYEES WHERE 1 = 2); --������ �����ϴ� ���̺����( ������X )

SELECT * FROM EMPS;
DESC EMPS;
--1ST
--��� �÷��� �������� ���� ������
INSERT INTO EMPS(SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN');
--Ư�� �÷��� �������� ���� ������
INSERT INTO EMPS(LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
                (SELECT LAST_NAME, EMAIL, HIRE_DATE, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN');
--2ND
INSERT INTO EMPS(LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES((SELECT LAST_NAME FROM EMPLOYEES WHERE MANAGER_ID IS NULL),
        'TEST01',
        SYSDATE,
        'TEST03'
    );
    
SELECT * FROM EMPS;
------------------------------------------------------------------------
COMMIT;

SELECT * FROM EMPS;
-- 114�� �޿��� 10% �λ�
UPDATE EMPS SET SALARY = SALARY * 1.1 WHERE EMPLOYEE_ID = 114;

-- WHERE�� ���� ������ �����Ű��, ��ü ���̺� ����Ǳ� ������ �׻� WHERE���� �ٿ��� �մϴ�.
-- �׷��� �׻�, SELECT������ ������Ʈ�� ���� Ȯ���ϰ�, �����ϴ� ����
UPDATE EMPS SET SALARY = 0;
ROLLBACK;

-- ������ ������Ʈ
UPDATE EMPS SET SALARY = SALARY * 1.1
                ,COMMISSION_PCT = 0.5
                ,MANAGER_ID = 110
WHERE EMPLOYEE_ID = 114;

--UPDATE���� ����������
--1ST
--�����÷��� �ѹ��� ���������� ������Ʈ �ϴ� ����
SELECT * FROM EMPS;

UPDATE EMPS 
SET (MANAGER_ID, JOB_ID, DEPARTMENT_ID)
 = (SELECT MANAGER_ID, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 201)
WHERE EMPLOYEE_ID = 114;
--�� �÷��� ���������� ������Ʈ �ϴ� ����
UPDATE EMPS
SET MANAGER_ID = (SELECT MANAGER_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 201),
    JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 201)
WHERE EMPLOYEE_ID = 114;
--WHERE������ ������ �˴ϴ�.
UPDATE EMPS
SET SALARY = 0
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG');

------------------------------------------
--DELETE��
--�����ϱ� ���� ��, SELECT������ ����Ű���带 Ȯ���ϴ� ������ ������ (�� PK������ �����ϼ���)
SELECT * FROM EMPS WHERE EMPLOYEE_ID = 114;

DELETE FROM EMPS WHERE EMPLOYEE_ID = 114;
DELETE FROM EMPS WHERE JOB_ID LIKE '%MAN';
--DELETE����������
DELETE FROM EMPS WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPS WHERE EMPLOYEE_ID = 145); --80�� �μ�

----------------------------------------------------------------------------------
--DELETE���� �ݵ�� ���� �������°��� �ƴմϴ�.
--���̺��� �������� ������ ������, �������Ἲ���࿡ ����Ǵ� ���, �������� �ʽ��ϴ�.
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
 
DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID = 20; --20�� �μ��� EMPLOTEE���� �����ǰ� �ֱ� ������ �������� �ʽ��ϴ�.