-- code for Sample Project Chapter 8

8.1.Create a value-independent view that hides sensitive information
CREATE VIEW PublicEmployee AS
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee;

-- Query the PublicEmployee view
SELECT * FROM PublicEmployee;

8.2.Create a User and Authorize Reading the View:
-- Create a new user
CREATE USER authuser IDENTIFIED BY authpass;
GRANT SELECT ON PublicEmployee TO authuser;

-- Connect to the Database as the authuser:
CONNECT authuser/authpass;

-- Query the PublicEmployee view as the new user
SELECT * FROM PublicEmployee;

8.3.
-- Create four new users
CREATE USER user1 IDENTIFIED BY password1;
CREATE USER user2 IDENTIFIED BY password2;
CREATE USER user3 IDENTIFIED BY password3;
CREATE USER user4 IDENTIFIED BY password4;

-- Grant different privileges to each user
GRANT SELECT ON PublicEmployee TO user1; -- Read access to the view
GRANT SELECT, UPDATE ON Employee TO user2; -- Read and update access to the Employee table
GRANT SELECT ON PackageMenu TO user3; -- Read access to the PackageMenu table
GRANT INSERT, UPDATE, DELETE ON EJob TO user4; -- Insert, update, and delete access to the Job table

8.3.
1.Connect as user1 and demonstrate read access to the PublicEmployee view:
     CONNECT user1/password1;
     SELECT * FROM PublicEmployee;
2.Connect as user2  and demonstrate read and update access to the Employee table:
   CONNECT user2/password2;
   SELECT * FROM Employee;
   UPDATE Employee SET SALARY = 60000 WHERE EMPLOYEEID = 2;
   SELECT * FROM Employee;
3.Connect as user3 and demonstrate read access to the PackageMenu table:
    CONNECT user3/password3;
    SELECT * FROM PackageMenu;
4.Connect as user4 and demonstrate insert, update, and delete access to the Job table:
  CONNECT user4/password4;
  SELECT * FROM Job;
  
8.4.
1. Create an Audit Table:
CREATE TABLE SalaryAudit (
    AuditID INT PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    UpdateDate TIMESTAMP,
    UpdatedBy VARCHAR(50)
);

2. Create the Audit Trail Trigger:
CREATE OR REPLACE TRIGGER SalaryUpdateTrigger
BEFORE UPDATE ON Employee
FOR EACH ROW
WHEN (NEW.Salary <> OLD.Salary)
DECLARE
    vAuditID INT;
BEGIN
    -- Generate a unique audit ID (You can use a sequence or any other method)
    SELECT NVL(MAX(AuditID), 0) + 1 INTO vAuditID FROM SalaryAudit;

    -- Insert audit trail information
    INSERT INTO SalaryAudit (AuditID, EmployeeID, OldSalary, NewSalary, UpdateDate, UpdatedBy)
    VALUES (vAuditID, :OLD.EmployeeID, :OLD.Salary, :NEW.Salary, SYSTIMESTAMP, USER);
END;
/

3. Test the trigger
UPDATE Employee SET Salary = 60000.00 WHERE EmployeeID = 1;


8.5.
-- Example update statement to trigger the audit trail
UPDATE Employee SET Salary = 65000.00 WHERE EmployeeID = 1;

-- Query the SalaryAudit table to verify the audit trail
SELECT * FROM SalaryAudit;
