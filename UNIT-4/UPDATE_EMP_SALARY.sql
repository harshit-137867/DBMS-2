CREATE OR REPLACE PROCEDURE UPDATE_EMP_SALARY AS
BEGIN
UPDATE EMP
    SET BasicSal = BasicSal + (BasicSal * 0.10);

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee record(s) updated successfully.');

COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating EMP table: ' || SQLERRM);
END UPDATE_EMP_SALARY;
/