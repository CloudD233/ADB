--3
CREATE TABLE empTT (
eid NUMBer,
name VARCHAR(10),
salary NUMBER,
CONSTRAINT empTT_pk PRIMARY KEY(eid));

--4 
INSERT INTO empTT(eid, name, salary)
VALUES(1, 'Cloud', 100);

INSERT INTO empTT(eid, name, salary)
VALUES(2, 'Chris', 150);

--5 
select current_scn from v$database;
--The number: 529513182

--6 
UPDATE empTT
SET salary = 300
WHERE eid = 1;

--7
SELECT * FROM EmpTT;
select current_scn from v$database;
--The number: 529513640

--8 
SELECT * FROM EmpTT 
Versions Between SCN MINVALUE AND MAXVALUE  
WHERE eid = 1;

--10 
UPDATE empTT
SET salary = 600
WHERE eid = 1;

--11
select current_scn from v$database;
--The number: 529515202

--12
SELECT * FROM EmpTT 
VERSIONS BETWEEN SCN 529513640 AND 529515202
WHERE eid = 1;

--13 
SELECT * FROM EmpTT AS OF SCN 529513640;

--14 
SELECT EmpTT.*, VERSIONS_STARTSCN, VERSIONS_ENDSCN, VERSIONS_OPERATION
FROM EmpTT
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE;

--16 
CREATE TABLE empBT (eid NUMBER,
name VARCHAR(10), salary NUMBER,
start_time TIMESTAMP,
end_time TIMESTAMP,
CONSTRAINT empBT_pk PRIMARY KEY (eid, start_time),
PERIOD FOR user_valid_time (start_time, end_time));

--18
INSERT INTO empBT(eid, name, salary, start_time, end_time)
VALUES(1, 'Cloud', 100, TO_TIMESTAMP('01-Jan-2023'), TO_TIMESTAMP('01-Dec-2023'));

--20
UPDATE empBT
SET end_time = TO_TIMESTAMP('31-Dec-2023')
Where eid = 1;

--21 
SELECT * FROM EmpBT;

--22
SELECT EmpBT.*, VERSIONS_STARTSCN, VERSIONS_ENDSCN
FROM EmpBT
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE;

--24
SELECT * FROM EmpBT AS OF SCN 529517472;
