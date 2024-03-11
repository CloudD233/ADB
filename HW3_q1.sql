CREATE OR REPLACE FUNCTION ArtistWorkEthic (intArtistID INT)
RETURN varchar
IS
counts int; 

BEGIN 
    SELECT COUNT(*) INTO counts
    FROM Artist
    Where ArtistID = intArtistID; 
    
    IF(counts < 4)THEN 
        RETURN 'lazy';
    ELSIF (counts < 7) THEN 
        RETURN 'average';
    ELSE RETURN 'prolific';
    END IF; 
END;
/
    
    SELECT ArtistWorkEthic(1) 
    FROM ARTIST; 
