SELECT * FROM ARTIST;
SELECT * FROM WORK;

CREATE OR REPLACE PROCEDURE displayArtist (
    varFirstName char,
    varLastName char) 
    
AS 
    READARTISTID NUMBER; 
    readFirstName char(25);
    readLastName char(25);
    readnationality char(30);
    readDOB NUMBER;
    readDD NUMBER;
    readTitle char(35);
    readMedium char(35);
    readdescription VARCHAR2(1000);
    
CURSOR artistcursor IS 
SELECT 
    ArtistID,
    FirstName,
    LastName,
    Nationality,
    DateofBirth,
    DateDeceased
FROM 
    ARTIST 
WHERE 
    TRIM(LastName) = TRIM(varLastName) AND TRIM(FirstName) = TRIM(varFirstName);

CURSOR workCursor(p_ArtistID NUMBER) IS
SELECT
    Title,
    Medium,
    description
FROM
    WORK
WHERE
    ArtistID = p_ArtistID;
    
BEGIN FOR artist IN artistcursor LOOP 
readLastName := artist.LastName;
readFirstName := artist.FirstName;
readNationality := artist.Nationality;
readDOB := artist.DateOfBirth;
readDD := artist.DateDeceased;
readArtistID := artist.ArtistID;
DBMS_OUTPUT.PUT_LINE('Artist ID: ' || readArtistID);
DBMS_OUTPUT.PUT_LINE('FirstName: ' || readFirstName);
DBMS_OUTPUT.PUT_LINE('LastName: ' || readLastName);
DBMS_OUTPUT.PUT_LINE('Nationality: ' || readnationality );
DBMS_OUTPUT.PUT_LINE('DOB: ' || readDOB );
DBMS_OUTPUT.PUT_LINE('DD: ' || readDD );

FOR work IN workCursor(readArtistID) 
LOOP readTitle := work.Title;
readMedium := work.Medium;
readdescription := work.description;
DBMS_OUTPUT.PUT_LINE('----------------------------------');
DBMS_OUTPUT.PUT_LINE('Title: ' || TRIM(readTitle));
DBMS_OUTPUT.PUT_LINE('Medium: ' || TRIM(readmedium));
DBMS_OUTPUT.PUT_LINE('description: ' || TRIM(readdescription));
END LOOP;
DBMS_OUTPUT.PUT_LINE('----------------------------------');

END LOOP;
END;
/

SET SERVEROUTPUT ON;
EXEC displayArtist('Joan', 'Miro');
