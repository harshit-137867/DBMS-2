CREATE OR REPLACE PROCEDURE raise_salary_by_dept (
	p_deptno IN emp.deptno%TYPE,
    	p_percent IN NUMBER
) 
AS
BEGIN
    	UPDATE emp
    	SET basicsal = basicsal + (basicsal * p_percent / 100)
    	WHERE deptno = p_deptno;

    	IF SQL%FOUND THEN
        		DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Department ' || p_deptno);
    	ELSE
        		DBMS_OUTPUT.PUT_LINE('No employees found in Department ' || p_deptno);
    	END IF;

    	COMMIT;
END raise_salary_by_dept;
/