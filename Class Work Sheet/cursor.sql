CREATE
OR REPLACE PROCEDURE Artist_View (artistLastName IN char) AS readLastName char(25);

readFirstName char(25);

readNationality char(30);

readDOB int;

readDD int;

CURSOR artistcursor IS
SELECT
    LastName,
    FirstName,
    Nationality,
    DateofBirth,
    DateDeceased
FROM
    ARTIST
WHERE
    LastName = artistLastName;

BEGIN FOR artist IN artistcursor LOOP readLastName := artist.LastName;

readFirstName := artist.FirstName;

readNationality := artist.Nationality;

readDOB := artist.DateOfBirth;

readDD := artist.DateDeceased;

DBMS_OUTPUT.PUT_LINE (
    'Artist Name = ' || RTRIM(readLastName) || ', 
    ' || RTRIM(readFirstName) || ' 
    Nationality = ' || RTRIM(readNationality) || ' 
    DateOfBirth = ' || readDOB || ' 
    DateDeceased = ' || readDD
);

END LOOP;

END;

/
SET
    SERVEROUTPUT ON CALL Artist_view ('Tobey');

SELECT
    *
FROM
    Artist;