CREATE TABLE Account (
    ACNO NUMBER(10) PRIMARY KEY,
    CNAME VARCHAR2(50),
    BNAME VARCHAR2(50),
    BALANCE NUMBER(12, 2)
);

INSERT INTO Account VALUES (101, 'Rahul Sharma', 'Main Branch', 25000.50);
INSERT INTO Account VALUES (102, 'Priya Patel', 'MG Road Branch', 45000.00);
INSERT INTO Account VALUES (103, 'Amit Kumar', 'Station Road Branch', 12500.75);

COMMIT;