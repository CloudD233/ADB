CREATE OR REPLACE PROCEDURE displayArtist (
    varFirstName char,
    varLastName char 
)
AS

    readArtistID NUMBER; 
    readFirstName char(25); 
    readLastName char(25); 
    readnationality char(30); 
    readDOB NUMBER; 
    readDD NUMBER; 
    readTitle char(35); 
    readMedium char(35); 
    readdescription VARCHAR2; 
    
    CURSOR artistcursor IS 
        SELECT ArtistID, FirstName, LastName, Nationality, DateofBirth, DateOfBirth, DateDeceased
        FROM ARTIST 
        WHERE LastName = varLastName AND FirstName = varFirstName;
        
    CURSOR workcursor IS 
        SELECT Title, Medium, description
        FROM WORK 
        WHERE artist.ArtistID = work.ArtistID; 
        
    
BEGIN 

    FOR artist IN artistcursor
        LOOP 
        readLastName := artist.LastName; 
        readFirstName := artist.FirstName; 
        readNationality := artist.Nationality; 
        readDOB := artist.DateOfBirth; 
        readDD := artist.DateDeceased; 
        readArtistID := artist.ArtistID; 
        readTitle := workcursor.Title; 
        readMedium := workcursor.Medium;
        readdescription := workcursor.description; 
        END LOOP; 
        
END; 
/


LINE/COL  ERROR
--------- -------------------------------------------------------------
15/21     PLS-00215: String length constraints must be in range (1 .. 32767)
23/9      PL/SQL: SQL Statement ignored
25/15     PL/SQL: ORA-00904: "ARTIST"."ARTISTID": invalid identifier
30/5      PL/SQL: Statement ignored
30/5      PLS-00402: alias required in SELECT list of cursor to avoid duplicate column names
Errors: check compiler log
