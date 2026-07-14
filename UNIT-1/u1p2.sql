DECLARE
	no number(10) := 7;
	square number(10);
	cube number(10);
BEGIN
	square := no*no;
	cube := no*no*no;
	dbms_output.put_line(no);
	dbms_output.put_line(square);
	dbms_output.put_line(cube);
END;
/
