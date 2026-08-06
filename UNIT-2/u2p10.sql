SET SERVEROUTPUT ON;

BEGIN
   UPDATE EMP
   SET EName = 'Goku'
   WHERE Deptno = 30;

   DBMS_OUTPUT.PUT_LINE('Rows updated...');
END;
/
