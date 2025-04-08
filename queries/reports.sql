Step 5.5 Design SQL statements that will process five non-routine requests for information from the database. Then execute the SQL statements in the database. 
 
Step 5.5.a. - List Clients with Outstanding Payments: To retrieve a list of clients with outstanding payments (where amtDue is greater than 0).

SELECT C.clientId, C.firstName, C.lastName, J.amtDue FROM Client C 
JOIN Job J ON 
C.clientId = J.clientId 
WHERE J.amtDue > 0;

Step 5.5.b. - Find the Most Popular Album Type.

SELECT albumType, COUNT(*) AS popularity FROM PackageMenu 
JOIN Job ON 
PackageMenu.packageNo = Job.packageNoChosen 
GROUP BY albumType 
ORDER BY COUNT(*) DESC 
FETCH FIRST 1 ROWS ONLY;


Step 5.5.c. - Retrieve Total Revenue by Photographer.

SELECT Photographer.empId, Photographer.firstName, Photographer.lastName, SUM(Job.totalCost) AS totalRevenue FROM Photographer 
LEFT JOIN Job ON 
Photographer.empId = Job.empId1 OR Photographer.empId = Job.empId2 
GROUP BY Photographer.empId, Photographer.firstName, Photographer.lastName;


Step 5.5.d. - List Clients Who Haven't Booked a Job.

SELECT clientId, firstName, lastName FROM Client 
WHERE clientId NOT IN (SELECT DISTINCT clientId FROM Job);


Step 5.5.e. - Retrieve Details of Orders with Specific Package Numbers:

SELECT O.orderNo, O.dateOrdered, O.totalAmount, O.packageNoOrdered, J.type, J.eventName FROM Orders O 
JOIN Job J ON 
O.contractNo = J.contractNo 
WHERE O.packageNoOrdered IN (1, 2);


