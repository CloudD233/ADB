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
    LastName = varLastName
    AND FirstName = varFirstName;

CURSOR workcursor(p_ArtistID NUMBER) IS
SELECT
    Title,
    Medium,
    description
FROM
    WORK
WHERE
    ArtistID = p_ArtistID;

BEGIN FOR artist IN artistcursor LOOP readLastName := artist.LastName;

readFirstName := artist.FirstName;

readNationality := artist.Nationality;

readDOB := artist.DateOfBirth;

readDD := artist.DateDeceased;

readArtistID := artist.ArtistID;

FOR work IN workcursorj(readArtistID) LOOP readTitle := workcursor.Title;

readMedium := workcursor.Medium;

readdescription := workcursor.description;

END LOOP;

END LOOP;

END;

/