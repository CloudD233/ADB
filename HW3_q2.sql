CREATE OR REPLACE PROCEDURE UpdateCustomerPhone
  
  (
    p_LastName         VARCHAR,
    p_FirstName        VARCHAR,
    p_priorAreaCode    VARCHAR,
    p_newAreaCode      VARCHAR,
    p_priorPhoneNumber VARCHAR,
    p_newPhoneNumber   VARCHAR
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Customers
    WHERE LastName = p_LastName
      AND FirstName = p_FirstName
      AND AreaCode = p_priorAreaCode
      AND PhoneNumber = p_priorPhoneNumber;

    IF v_count <> 1 THEN
        -- If not exactly one match, raise an error
        RAISE_APPLICATION_ERROR(-20001, 'Error: There must be exactly one customer matching the criteria.');
    ELSE
        -- Update the customer's phone number data
        UPDATE Customers
        SET AreaCode = p_newAreaCode,
            PhoneNumber = p_newPhoneNumber
        WHERE LastName = p_LastName
          AND FirstName = p_FirstName
          AND AreaCode = p_priorAreaCode
          AND PhoneNumber = p_priorPhoneNumber;

        -- Confirm the update
        DBMS_OUTPUT.PUT_LINE('Customer phone data updated successfully.');
    END IF;
    
    -- Commit the transaction
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle unexpected errors
        RAISE_APPLICATION_ERROR(-20002, 'An unexpected error occurred: ' || SQLERRM);
        ROLLBACK;
END UpdateCustomerPhone;
/
