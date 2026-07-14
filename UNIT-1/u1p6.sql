-- Using normal loop

SET serveroutput ON;

DECLARE
	n number;
	i number;
BEGIN
	n := &n;
/*
	i := 1;

	LOOP
		EXIT WHEN i > n;
		dbms_output.put_line(i);
		i := i + 1;
	END LOOP;
*/

-- Using for loop
/*
	FOR i IN 1..n LOOP
		dbms_output.put_line(i);
	END LOOP;
*/
-- Using while loop
	
	i := 1;
	WHILE i <= n LOOP
		dbms_output.put_line(i);
		i := i + 1;
	END LOOP;
END;
/