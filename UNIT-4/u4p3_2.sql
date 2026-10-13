SET SERVEROUTPUT ON;

DECLARE
    v_eid emp.eid%TYPE := 201; -- Try valid IDs (201 to 207) or invalid ones (e.g., 999)
    v_ename emp.ename%TYPE;
BEGIN
    find_employee(p_eid => v_eid, p_ename => v_ename);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/