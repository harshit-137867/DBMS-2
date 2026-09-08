DECLARE
	v_num NUMBER;
BEGIN
	v_num := 'ABC';
	dbms_output.put_line('Number: ' || v_num);
EXCEPTION
	WHEN INVALID_NUMBER THEN
		dbms_output.put_line('Invalid Number Exception:
		 Invalid Number Format.');
END;
/