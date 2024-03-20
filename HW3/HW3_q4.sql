CREATE OR REPLACE TRIGGER CheckCustomerWealth
BEFORE INSERT OR UPDATE ON TRANS
FOR EACH ROW
DECLARE
    l_state CHAR(2);
BEGIN

    SELECT STATE 
    INTO l_state 
    FROM CUSTOMER 
    WHERE CUSTOMERID = :NEW.CUSTOMERID;
    
    IF l_state = 'WA' AND :NEW.SALESPRIcE < 1000 THEN

        RAISE_APPLICATION_ERROR(-20001, 'customers from WA should never pay less than $1000');
    ELSIF l_state = 'GA' AND :NEW.SALESPRIcE > 800 THEN

        RAISE_APPLICATION_ERROR(-20002, 'customers from GA should never pay more than $800 for a work ');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Customer state not found.');
    WHEN OTHERS THEN
        RAISE;
END CheckCustomerWealth;
/

INSERT INTO TRANS (TRANSACTIONID, DATEACQUIRED, ACQUISITIONPRICE, ASKINGPRICE, DATESOLD, SALESPRICE, CUSTOMERID, WORKID)
VALUES (201, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 400, 900, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 850, 1037, 223);


SELECT * FROM TRANS; 
SELECT * FROM CUSTOMER;
