-- 7.
SET SERVEROUTPUT ON;

CREATE TABLE Result (
	Rollno number PRIMARY KEY,
	Name varchar2(50),
	Sub1 number(3),
	Sub2 number(3),
	Sub3 number(3),
	Sub4 number(3),
	Sub5 number(3),
	Total number(4),
	Per number(5, 2),
	Grade char(1)
);

INSERT INTO Result (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
	VALUES (101, 'Rahul', 85, 78, 90, 88, 76);

INSERT INTO Result (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
	VALUES (102, 'Priya', 95, 92, 89, 94, 90);

SELECT *
FROM Result;
	