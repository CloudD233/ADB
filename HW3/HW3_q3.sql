CREATE
OR REPLACE PROCEDURE displayArtist (
    varFirstName char,
    varLastName char
) AS readArtistID NUMBER;

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
    DateOfBirth,
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
        DBMS_OUTPUT.PUT_LINE('Name: ' || TRIM(readFirstName) || ' ' || TRIM(readLastName));
        DBMS_OUTPUT.PUT_LINE('Nationality: ' || TRIM(readNationality));
        DBMS_OUTPUT.PUT_LINE('DOB: ' || readDOB);
        DBMS_OUTPUT.PUT_LINE('DOD: ' || readDOD);

FOR work IN workcursorj(readArtistID) 
LOOP readTitle := workcursor.Title;
readMedium := workcursor.Medium;
readdescription := workcursor.description;

DBMS_OUTPUT.PUT_LINE('Title: ' || TRIM(readTitle));
            DBMS_OUTPUT.PUT_LINE('Medium: ' || TRIM(readMedium));
            DBMS_OUTPUT.PUT_LINE('Description: ' || TRIM(readDescription));
DBMS_OUTPUT.PUT_LINE('----------------------');
END LOOP;

END LOOP;

END;

/



SELECT * FROM ARTIST;

SET SERVEROUTPUT ON;
EXEC displayArtist('Joan', 'Miro');


Procedure DISPLAYARTIST compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
39/7      PL/SQL: Statement ignored
39/7      PLS-00402: alias required in SELECT list of cursor to avoid duplicate column names
Errors: check compiler log
