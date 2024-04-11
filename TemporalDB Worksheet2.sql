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

