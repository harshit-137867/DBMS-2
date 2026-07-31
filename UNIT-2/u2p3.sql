/*  Write a PL/SQL block that uses a cursor attribute
%ROWCOUNT to display the name, department and
basic salary of the first 5 employees getting the
highest basic salary. (Use Explicit Cursor) */

SET SERVEROUTPUT ON;

DECLARE
	CURSOR c_emp IS
		SELECT EName, Deptname, BasicSal
      		FROM EMP
      		ORDER BY BasicSal DESC;
		   v_name      EMP.EName%TYPE;
   		v_dept      EMP.Deptname%TYPE;
   		v_salary    EMP.BasicSal%TYPE;
BEGIN
   OPEN c_emp;
   
      FETCH c_emp INTO v_name, v_dept, v_salary;

      EXIT WHEN c_emp%NOTFOUND OR c_emp%ROWCOUNT > 5;

      DBMS_OUTPUT.PUT_LINE('Name : ' || v_name ||
                              ', Department : ' || v_dept ||
                              ', Basic Salary : ' || v_salary);
   END LOOP;
   CLOSE c_emp;

EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line('Error! : ' || SQLERRM);
	
END;
/ 