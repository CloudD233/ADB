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
