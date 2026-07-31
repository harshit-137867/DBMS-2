/*  %ISOPEN and %NOTFOUND to raise the basic salary of employees of department number 20 by 5% and
also display the appropriate message based on the existence of the record in the EMP table. Whenever
any such raise is given to the employees, a record for the same is maintained in the emp_update table.
(Perform using both Implicit and Explicit Cursor) */

SET SERVEROUTPUT ON;

DECLARE
   CURSOR c1 IS
      SELECT EID, BasicSal
      FROM EMP
      WHERE Deptno = 20;

   v_eid EMP.EID%TYPE;
   v_sal EMP.BasicSal%TYPE;
   v_newsal EMP.BasicSal%TYPE;
BEGIN
   OPEN c1;

   IF c1%ISOPEN THEN
      FETCH c1 INTO v_eid, v_sal;

      IF c1%NOTFOUND THEN
         DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
      ELSE
         WHILE c1%FOUND LOOP
            v_newsal := v_sal * 1.05;

            UPDATE EMP SET BasicSal = v_newsal WHERE EID = v_eid;

            INSERT INTO emp_update (update_id, emp_id, old_salary, new_salary, update_date)
            VALUES (emp_update_seq.NEXTVAL, v_eid, v_sal, v_newsal, SYSDATE);

            DBMS_OUTPUT.PUT_LINE('Salary updated for employee ' || v_eid);

            FETCH c1 INTO v_eid, v_sal;
         END LOOP;
      END IF;
   END IF;

   CLOSE c1;
END;
/


