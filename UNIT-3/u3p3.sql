SET SERVEROUTPUT ON;

DECLARE
    v_emp_name   VARCHAR2(50);
    v_basic_sal  EMP.BasicSal%TYPE;
BEGIN
    v_emp_name := '&Enter_Employee_Name';

    SELECT BasicSal
    INTO v_basic_sal
    FROM EMP
    WHERE EName = v_emp_name;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || v_basic_sal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with name: ' || v_emp_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
