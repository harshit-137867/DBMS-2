DECLARE
   -- 1. Parameterized cursor to fetch employees for a specific department
   CURSOR c_emp (p_deptno NUMBER) IS
      SELECT EName, BasicSal
      FROM EMP
      WHERE Deptno = p_deptno;

   -- 2. Cursor to get all unique department numbers
   CURSOR c_dept IS
      SELECT DISTINCT Deptno 
      FROM EMP 
      ORDER BY Deptno;

   v_gross_sal   NUMBER;
   v_dept_total  NUMBER;

BEGIN
   -- Loop through each department
   FOR d IN c_dept LOOP
      v_dept_total := 0;

      DBMS_OUTPUT.PUT_LINE('===================================');
      DBMS_OUTPUT.PUT_LINE('DEPARTMENT NUMBER: ' || d.Deptno);
      DBMS_OUTPUT.PUT_LINE('===================================');

      -- Loop through employees in current department using parameterized cursor
      FOR e IN c_emp(d.Deptno) LOOP
         -- Gross Salary Formula: Basic + DA(50%) + HRA(15%) + Medical(500) - PF(10%)
         v_gross_sal := e.BasicSal + (e.BasicSal * 0.50) + (e.BasicSal * 0.15) + 500 - (e.BasicSal * 0.10);

         -- Display individual employee details
         DBMS_OUTPUT.PUT_LINE('Name: ' || e.EName || ' | Basic Sal: ' || e.BasicSal || ' | Gross Sal: ' || v_gross_sal);

         -- Accumulate department total gross salary
         v_dept_total := v_dept_total + v_gross_sal;
      END LOOP;

      -- Display total gross salary for the department
      DBMS_OUTPUT.PUT_LINE('-----------------------------------');
      DBMS_OUTPUT.PUT_LINE('Total Dept Gross Salary: ' || v_dept_total);
      DBMS_OUTPUT.PUT_LINE(' ');
   END LOOP;
END;
/
