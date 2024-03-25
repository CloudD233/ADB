CREATE OR REPLACE FUNCTION ArtistWorkEthic 
    
(intArtistID INT) 
    
RETURN varchar 
    
IS counts int;

BEGIN
SELECT
    COUNT(*) INTO counts
FROM
    WORK
Where
    WORK.ArtistID = intArtistID;

iF(counts = 0) THEN RETURN 'Error';

ELSIF(counts < 4) THEN RETURN 'lazy';

ELSIF (counts < 7) THEN RETURN 'average';

ELsIF (counts >= 7) THEN RETURN 'prolific';

END IF;

END;

/
SELECT
    ArtistWorkEthic(A.ArtistID),
    A.LastName
FROM
    ARTIST A; 
