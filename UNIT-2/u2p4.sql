SET SERVEROUTPUT ON;

DECLARE
  CURSOR emp_cursor IS
    SELECT EName, BasicSal
    FROM (
      SELECT EName, BasicSal
      FROM emp
      ORDER BY BasicSal DESC
    )
    WHERE ROWNUM <= 3;
BEGIN
  FOR rec IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Name : ' || rec.EName || ' | Salary : ' || rec.BasicSal);
  END LOOP;
END;
/