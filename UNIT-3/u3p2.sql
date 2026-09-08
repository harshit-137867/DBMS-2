SET SERVEROUTPUT ON;

DECLARE
   v_student_name   RESULT.sname%TYPE;
   v_marks          RESULT.marks%TYPE;
   v_status         VARCHAR2(10);
BEGIN
  
   v_student_name := '&Enter_Student_Name';

   SELECT marks
   INTO v_marks
   FROM RESULT
   WHERE sname = v_student_name;

   IF v_marks >= 40 THEN
      v_status := 'Pass';
   ELSE
      v_status := 'Fail';
   END IF;

   DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_name ||
                        ' | Marks: ' || v_marks ||
                        ' | Result: ' || v_status);

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No record found for student: ' || v_student_name);
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
