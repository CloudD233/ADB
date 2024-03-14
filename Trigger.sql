--SQL-PSM Worksheet 3

--QUESTION 4
CREATE OR REPLACE TRIGGER DisallowWorkID 
BEFORE UPDATE OF WORKID ON WORK
    
BEGIN 
    raise_application_error(-20000, 'Warning: NO CANT DO');
END;
/

--QUESTION 5 
update WORK set WORKID = 1;

--QUESTION 6
--make table and insert
CREATE TABLE ALLOWED_NATIONALITY (Nation Char(30) PRIMARY KEY);

INSERT INTO ALLOWED_NATIONALITY (Nation)
VALUES('United States');
ALTER TABLE artist DROP CONSTRAINT nationalityvalues;

--Trigger
    CREATE OR REPLACE TRIGGER preventUpdate
    BEFORE UPDATE OF Nation ON ALLOWED_NATIONALITY
    
    BEGIN 
        IF NEW.Nation IS NOT DISTINCT FROM OLD.Nation THEN
        raise_application_error(-20000, 'Warning: NO CANT DO');
        END IF; 
        END;
        /
