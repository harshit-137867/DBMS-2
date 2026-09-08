SET SERVEROUTPUT ON;

DECLARE
   numerator   NUMBER := 100;
   denominator NUMBER := 0;
   result      NUMBER;
BEGIN
   
   result := numerator / denominator;
   DBMS_OUTPUT.PUT_LINE('Result is: ' || result);

EXCEPTION
   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed!');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Other Error! ' || SQLERRM);
END;
/
