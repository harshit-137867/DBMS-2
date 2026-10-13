CREATE OR REPLACE 
PROCEDURE display_message 
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello! This is a user-defined message.');
END display_message;
/