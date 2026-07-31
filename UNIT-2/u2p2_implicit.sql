/* %ISOPEN and %NOTFOUND to raise the basic salary of employees of department number 20 by 5% and
also display the appropriate message based on the existence of the record in the EMP table. Whenever
any such raise is given to the employees, a record for the same is maintained in the emp_update table.
(Perform using both Implicit and Explicit Cursor)
 */

SET SERVEROUTPUT ON;

DECLARE
   total_rows NUMBER;
BEGIN
   UPDATE EMP
   SET BasicSal = BasicSal * 1.05
   WHERE Deptno = 20;

   IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
   ELSE
      total_rows := SQL%ROWCOUNT;
      DBMS_OUTPUT.PUT_LINE(total_rows || ' employee(s) salary raised by 5% in department 20.');

      INSERT INTO emp_update (update_id, emp_id, old_salary, new_salary, update_date)
      SELECT emp_update_seq.NEXTVAL, EID, BasicSal/1.05, BasicSal, SYSDATE
      FROM EMP
      WHERE Deptno = 20;
   END IF;
END;
/
