CREATE VIEW DeleteTransView AS
SELECT * FROM trans;

CREATE OR REPLACE TRIGGER PreventLastTransDelete
INSTEAD OF DELETE ON DeleteTransView
FOR EACH ROW
BEGIN
  DECLARE
    trans_count NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO trans_count
    FROM trans
    WHERE workid = :OLD.workid;

    IF trans_count > 1 THEN
      DELETE FROM trans WHERE transactionid = :OLD.transactionid;
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'Cannot delete the last transaction record for a work.');
    END IF;
  END;
END PreventLastTransDelete;
/

DELETE FROM DeleteTransView WHERE TRANSACTIONID = 105;
