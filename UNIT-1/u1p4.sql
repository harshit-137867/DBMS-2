-- Write PL/SQL block which accepts measurement in feet and displays it in cm, inch and meter.
DECLARE
	feet number;
	cm number;
	inch number;
	meter number;	
BEGIN
	feet := &feet;
	
	inch := feet * 12;
	cm := feet * 30.48;
	meter := feet * 0.3048;

	dbms_output.put_line('Feet : ' || feet);
	dbms_output.put_line('Inch : ' || inch);
	dbms_output.put_line('Cm : ' || cm);
	dbms_output.put_line('Meter : ' || meter);
END;
/