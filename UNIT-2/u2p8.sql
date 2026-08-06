DECLARE
   -- Cursor to fetch employees whose names start with 'A'
   CURSOR emp_cursor IS
      SELECT empno, ename, job
      FROM emp
      WHERE ename LIKE 'A%';
BEGIN
   -- Cursor FOR loop
   FOR rec IN emp_cursor LOOP
      DBMS_OUTPUT.PUT_LINE('Emp No: ' || rec.empno ||', Name: ' || rec.ename ||', Job: ' || rec.job);
   END LOOP;
END;
/