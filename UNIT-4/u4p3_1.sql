CREATE OR REPLACE PROCEDURE find_employee (
    p_eid IN emp.eid%TYPE,
    p_ename OUT emp.ename%TYPE
) AS
BEGIN
    SELECT ename 
    INTO p_ename
    FROM emp
    WHERE eid = p_eid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ename := NULL;
        RAISE_APPLICATION_ERROR(-20001, 'Error: Employee ID ' || p_eid || ' not found.');
END find_employee;
/