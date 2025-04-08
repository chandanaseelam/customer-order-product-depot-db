Step 5.6 Ð Design one trigger for your project. Then create the trigger in the database.

CREATE OR REPLACE TRIGGER update_total_amount_trigger
AFTER INSERT ON orders1
FOR EACH ROW
BEGIN
    INSERT INTO order_totals (order_id, total_amount)
    VALUES (:NEW.order_id, :NEW.order_amount);
END;

Step 5.7 Ð Design and execute SQL statements to demonstrate that the trigger is working as expected. 

SELECT * FROM orders1;
SELECT * FROM order_totals;

