--Convert celsius into fahrenheit
DECLARE
	celsius number;
	fahrenheit number;
BEGIN
	celsius := &celsius;
	fahrenheit := (celsius * 9 / 5) + 32;
	
	dbms_output.put_line('Celsius : ' || celsius);
	dbms_output.put_line('Fahrenheit : ' || fahrenheit);
END;
/    