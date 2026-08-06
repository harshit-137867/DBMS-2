SET SERVEROUTPUT ON;

DECLARE
   -- Cursor to fetch employees whose names start with 'A'
   CURSOR c_customers IS
      SELECT ID, Name, Address
      FROM CUSTOMER
      ORDER BY Address;
BEGIN
   -- Cursor FOR loop
   FOR rec IN c_customers LOOP
      DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID ||', Name: ' || rec.Name ||', Address: ' || rec.Address);
   END LOOP;
END;
/