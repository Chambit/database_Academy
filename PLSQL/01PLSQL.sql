--��¹� ���
SET SERVEROUTPUT ON; 

DECLARE
    V_NUM NUMBER; --������ ����
    V_NUM2 NUMBER := 2 ** 3 * 3;
BEGIN
    V_NUM := 30; --����
    
    dbms_output.put_line('�����ǰ�:' || V_NUM2);
    dbms_output.put_line('�����ǰ�:' || V_NUM);
END;

------------------------------------------------
--DML����� �Բ� ����� �� �� �ֽ��ϴ�.
--SELECT -> INSERT, UPDATE �������� DML������ ������ �� �ֵ��� ���ݴϴ�.

DECLARE
    EMP_NAME VARCHAR2(30);
    EMP_SALARY NUMBER;
    EMP_LAST_NAME EMPLOYEES.LAST_NAME%TYPE; -- �ش� �÷��� ������ ���� Ÿ���� ����� (VARCHAR2 25)
BEGIN

    SELECT FIRST_NAME, SALARY, LAST_NAME
    INTO EMP_NAME, EMP_SALARY, EMP_LAST_NAME -- ��ȸ�� ���� ������ ����
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;

    dbms_output.put_line(EMP_NAME);
    dbms_output.put_line(EMP_SALARY);
    dbms_output.put_line(EMP_LAST_NAME);
END;

----------------------------------------------------
--�⵵�� ����� �޿����� ���ؼ� ���ο� ���̺� INSERT
CREATE TABLE EMP_SAL (
    EMP_YEARS VARCHAR2(50),
    EMP_SALARY NUMBER(10)
);

DECLARE
    EMP_SUM EMP_SAL.EMP_SALARY%TYPE;
    EMP_YEARS EMP_SAL.EMP_YEARS%TYPE := 2008;
BEGIN
    SELECT SUM(SALARY)
    INTO EMP_SUM
    FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = EMP_YEARS;
    
    INSERT INTO EMP_SAL VALUES(EMP_YEARS, EMP_SUM);
    COMMIT; --
    
    dbms_output.put_line('���� ó���Ǿ����ϴ�. 2008�޿���:' || EMP_SUM);
END;

------------------------------------------------------------
--1. ������ �� 3���� ����ϴ� �͸� ����� �����ô�.
DECLARE
    G_NUM1 NUMBER := 3 * 1;
    G_NUM2 NUMBER := 3 * 2;
    G_NUM3 NUMBER := 3 * 3;
    G_NUM4 NUMBER := 3 * 4;
    G_NUM5 NUMBER := 3 * 5;
    G_NUM6 NUMBER := 3 * 6;
    G_NUM7 NUMBER := 3 * 7;
    G_NUM8 NUMBER := 3 * 8;
    G_NUM9 NUMBER := 3 * 9;
BEGIN
    dbms_output.put_line('3 x 1 =' || G_NUM1);
    dbms_output.put_line('3 x 2 =' || G_NUM2);
    dbms_output.put_line('3 x 3 =' || G_NUM3);
    dbms_output.put_line('3 x 4 =' || G_NUM4);
    dbms_output.put_line('3 x 5 =' || G_NUM5);
    dbms_output.put_line('3 x 6 =' || G_NUM6);
    dbms_output.put_line('3 x 7 =' || G_NUM7);
    dbms_output.put_line('3 x 8 =' || G_NUM8);
    dbms_output.put_line('3 x 9 =' || G_NUM9);
    
END;
--2. ��� ���̺��� 201�� ����� �̸��� �̸����ּҸ� ����ϴ� �͸� ����� ����� ����.
DECLARE
    P_NAME EMPLOYEES.LAST_NAME%TYPE;
    P_EMAIL EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT LAST_NAME, EMAIL
    INTO P_NAME, P_EMAIL
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID = 201;
    dbms_output.put_line('201�� ����� �̸��� �̸��� �ּ�:' || P_NAME || ' ' || P_EMAIL);
END;
--3. ��� ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� ��, 
--	 �� ��ȣ +1������ �Ʒ��� ����� emps�� employee_id, last_name, email, hire_date, job_id��  �ű� �Է��ϴ� �͸� ����� ����� ����.
--<�����>   : steven
--<�̸���>   : stevenjobs
--<�Ի�����> : ���ó�¥
--<JOB_ID> : CEO
CREATE TABLE EMPS(
    EMPS_ID VARCHAR2(50),
    EMPS_LAST_NAME VARCHAR2(50),
    EMPS_EMAIL VARCHAR2(50),
    EMPS_HIRE_DATE VARCHAR2(50),
    EMPS_JOB_ID VARCHAR2(50)
);

DECLARE
    NUM NUMBER;
BEGIN
    SELECT MAX(EMPLOYEE_ID) + 1
    INTO NUM
    FROM EMPLOYEES;
    
    INSERT INTO EMPS(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
    VALUES (NUM, 'steven', 'stevenjobs', SYSDATE, 'CEO');
    
    COMMIT;
    
END;

SELECT * FROM EMPS;
SELECT * FROM EMPLOYEES;
