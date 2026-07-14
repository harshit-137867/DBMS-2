DECLARE
	p number(10) := 10000;
	r number(10) := 5;
	n number(10) := 2;
	si number(10);
BEGIN
	si := (p*r*n) / 100;
	dbms_output.put_line(si);
END;
/