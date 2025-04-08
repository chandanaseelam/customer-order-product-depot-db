-- Step 6.8 - A trigger that updates the totalAmount attribute in the "Order2" table whenever a new record is inserted or an existing record is updated in the "Job" table:

-- Create a trigger to update the totalAmount in the Order2 table
CREATE OR REPLACE TRIGGER updateTotalAmountTrigger
AFTER INSERT OR UPDATE ON Job
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        -- Calculate and insert the total amount for a new job
        INSERT INTO Order2 (orderNo, orderDate, totalAmount, packageNoOrdered, contractNo)
        VALUES (:NEW.contractNo, SYSDATE, :NEW.totalCost, :NEW.packageNoChosen, :NEW.contractNo);
    ELSIF UPDATING THEN
        -- Update the total amount when an existing job is updated
        UPDATE Order2
        SET totalAmount = (SELECT SUM(totalCost) FROM Job WHERE contractNo = :NEW.contractNo)
        WHERE orderNo = :NEW.contractNo;
    END IF;
END;
/



-- Step 6.9 - Design and execute SQL statements to demonstrate that the trigger is working as expected.

**1.   Inserting new Ô3Õ records into table Job:
-- Insert additional records into the Job table
-- Replace the values with your specific data
INSERT INTO Job VALUES (1013, 'Wedding Photography', 'Smith Wedding', 'New York', 1, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 4, 1200.00, 101, 102, 1, 1200.00, 800.00, 400.00);

INSERT INTO Job VALUES (1014, 'Birthday Party Photography', 'Emily's Birthday', 'Los Angeles', 4, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), 3, 800.00, 104, 105, 3, 800.00, 600.00, 200.00);

INSERT INTO Job VALUES (1015, 'Corporate Event Photography', 'ABC Inc. Conference', 'Chicago', 3, TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_TIMESTAMP('09:15:00', 'HH24:MI:SS'), 5, 1500.00, 101, 102, 2, 1500.00, 1000.00, 500.00);


**2. Verifying that the trigger updated the "Order2" table:
   The Order2 table to verify the update:

-- Query the Order2 table to verify the update
SELECT * FROM Order2;

**3. Check the "Job" table to ensure that it contains the newly inserted job record:

-- Query the Job table to verify the new record
SELECT * FROM Job WHERE contractNo = 1014;

**4. Updating existing records in the "Job" table to observe the trigger's behavior when updating records.

A. -- Update an existing record in the Job table
   -- Replace the values with your specific data

UPDATE Job SET totalCost = 700.00 WHERE contractNo = 1014;

B. -- Query the Job table to verify the updated record
SELECT * FROM Job WHERE contractNo = 1014;

C.  -- Query the Order2 table to verify the corresponding update
SELECT * FROM Order2 WHERE orderNo = 1014;

These queries will allow you to see the updated data in both tables, confirming that the trigger worked as expected when updating existing records in the "Job" table.


