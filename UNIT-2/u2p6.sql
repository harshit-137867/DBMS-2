/* 6) Write a program using a cursor to insert the records of employees in the EMP_BACKUP table for
given DEPT_NO, also raise a user-defined exception NO_DEPT_FOUND when no records are found for entered DEPT_NO. */

SET SERVEROUTPUT ON;

CREATE TABLE EMP_BACKUP AS SELECT * FROM EMP WHERE 1=0; 
 -- 1=1 means copy structure and also data
-- 1=0 means only copy strucutre

DECLARE
   CURSOR emp_cur(p_dept_no NUMBER) IS
      SELECT EID, EName, Deptno, Deptname, Gender, Age, BasicSal
      FROM EMP
      WHERE Deptno = p_dept_no;

   v_eid      EMP.EID%TYPE;
   v_ename    EMP.EName%TYPE;
   v_deptno   EMP.Deptno%TYPE;
   v_deptname EMP.Deptname%TYPE;
   v_gender   EMP.Gender%TYPE;
   v_age      EMP.Age%TYPE;
   v_salary   EMP.BasicSal%TYPE;

   NO_DEPT_FOUND EXCEPTION;

   v_dept_input NUMBER := &DEPT_NO;

BEGIN
   OPEN emp_cur(v_dept_input);
   FETCH emp_cur INTO v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary;

   IF emp_cur%NOTFOUND THEN
      RAISE NO_DEPT_FOUND;
   ELSE
      LOOP
         EXIT WHEN emp_cur%NOTFOUND;

         INSERT INTO EMP_BACKUP(EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
         VALUES (v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary);

         FETCH emp_cur INTO v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary;
      END LOOP;
   END IF;

   CLOSE emp_cur;
COMMIT;

   DBMS_OUTPUT.PUT_LINE('Records inserted into EMP_BACKUP successfully.');

EXCEPTION
   WHEN NO_DEPT_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employees found for department ' || v_dept_input);
END;
/