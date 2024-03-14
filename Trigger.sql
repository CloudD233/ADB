--SQL-PSM Worksheet 3
--QUESTION 4
CREATE
OR REPLACE TRIGGER DisallowWorkID BEFORE
UPDATE
    OF WORKID ON WORK BEGIN raise_application_error(-20000, 'Warning: NO CANT DO');

END;

/ --QUESTION 5 
update
    WORK
set
    WORKID = 1;

--QUESTION 6
--make table and insert
CREATE TABLE ALLOWED_NATIONALITY (Nation Char(30) PRIMARY KEY);

INSERT INTO
    ALLOWED_NATIONALITY (Nation)
VALUES
('United States');

ALTER TABLE artist DROP CONSTRAINT nationalityvalues;

CREATE OR REPLACE TRIGGER validNationality
BEFORE INSERT OR UPDATE ON ARTIST
FOR EACH ROW
DECLARE
    varRows INT; 
BEGIN 
    SELECT COUNT(*) INTO varRows
    FROM ALLOWED_NATIONALITY A
    WHERE A.Nation = :new.Nationality;
    
    IF varRows < 1 THEN 
        raise_application_error(-20001, 'Warning: NO CANT DO');
    END IF; 
    END; 
    /
