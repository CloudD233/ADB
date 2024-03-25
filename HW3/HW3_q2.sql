CREATE OR REPLACE PROCEDURE UpdateCustomerPhone(
    p_LastName CHAR,
    p_FirstName CHAR,
    p_priorAreaCode CHAR,
    p_newAreaCode CHAR,
    p_priorPhoneNumber CHAR,
    p_newPhoneNumber CHAR
) AS v_count INT;

BEGIN
SELECT
    COUNT(*) INTO v_count
FROM
    Customer
WHERE
    LastName = p_LastName
    AND FirstName = p_FirstName
    AND AreaCode = p_priorAreaCode
    AND PhoneNumber = p_priorPhoneNumber;

IF v_count <> 1 THEN DBMS_OUTPUT.PUT_LINE('Error');

ELSE
UPDATE
    Customer
SET
    AreaCode = p_newAreaCode,
    PhoneNumber = p_newPhoneNumber
WHERE
    LastName = p_LastName
    AND FirstName = p_FirstName
    AND AreaCode = p_priorAreaCode
    AND PhoneNumber = p_priorPhoneNumber;

DBMS_OUTPUT.PUT_LINE('Got it');

END IF;

END;

/
SELECT
    *
FROM
    CUSTOMER;

SET
    SERVEROUTPUT ON;

CALL UpdateCustomerPhone(
    'Janes',
    'Jeffrey',
    '425',
    '111',
    '543-2345',
    '111-1111');
