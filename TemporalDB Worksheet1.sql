--CREATE TABLE
CREATE TABLE Assign (
projNo NUMBER(6),
empId NUMBER(6),
hoursAssigned NUMBER(3),
rating NUMBER(1),
CONSTRAINT Assign_projNo_empId_pk PRIMARY KEY (projNo, empId));

--INSERT VALUE
INSERT INTO Assign VALUES(1001, 101, 30, null);
INSERT INTO Assign VALUES(1001, 103, 20, 5);
INSERT INTO Assign VALUES(1005, 103, 20, null);

-- 5 
ALTER TABLE Assign ADD PERIOD FOR valid_time; 

--6 
SELECT projNo, empId,hoursAssigned, rating, valid_time_start, valid_time_end
FROM Assign;

--9 
INSERT INTO Assign (projNo, empId,hoursAssigned, rating, valid_time_start, valid_time_end)
VALUES(1030,105,35,null, TO_TIMESTAMP('1-sep-2022'),null);

--10 
UPDATE Assign
SET valid_time_start = TO_DATE('01-JAN-2022')
WHERE projNo = 1001 AND empId = 103;

--12 
UPDATE Assign
SET PROJNO = 1030, valid_time_start = TO_DATE('31-dec-2022'), hoursAssigned = 15
WHERE projNo = 1001 AND empId = 103;

--13 
SELECT projNo, empId, valid_time_end
FROM Assign
WHERE valid_time_end IS NULL OR valid_time_end > CURRENT_DATE;

--14 
SELECT projNo, empId, valid_time_end
FROM Assign
WHERE TO_DATE('02-Aug-1964') 
BETWEEN valid_time_start AND valid_time_end
OR (valid_time_start <= TO_DATE('02-Aug-1964') AND valid_time_end IS NULL);

--15
SELECT projNo, empId, valid_time_end
FROM Assign
WHERE TO_DATE('04-Jul-2002') 
BETWEEN valid_time_start AND valid_time_end
OR (valid_time_start <= TO_DATE('04-Jul-2002') AND valid_time_end IS NULL);

--16
SELECT projNo, empId, valid_time_start, valid_time_end
FROM Assign
WHERE (valid_time_start <= TO_DATE('03-Dec-2022') AND (valid_time_end >= TO_DATE('03-Dec-2022') OR valid_time_end IS NULL));
