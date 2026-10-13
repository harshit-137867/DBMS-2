SET SERVEROUTPUT ON;
DECLARE
	v_input NUMBER := &v_input;
	v_result NUMBER;
BEGIN
	v_result := get_square(v_input);
	dbms_output.put_line('The Sqaure Of ' || v_input ||
	' Is: ' || v_result);
END;
/