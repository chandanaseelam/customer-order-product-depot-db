-- Step 6.7 - Write SQL statements that will process five non-routine requests for information from the database just created

Step 6.7.a. - List Clients Who Have Booked a Job: To list clients who have booked at least one job. 

SELECT C.clientId, C.firstName, C.lastName
FROM Client C
WHERE C.clientId IN (SELECT DISTINCT clientId FROM Job);

Step 6.7.b. - Retrieve Jobs for a Specific Photographer: To retrieve jobs assigned to a specific photographer (e.g., empId 101).

SELECT J.contractNo, J.type, J.eventName, J.date
FROM Job J
WHERE J.empId1 = 101 OR J.empId2 = 101;

Step 6.7.c. - Find the Highest-Paying Job Type: To find the job type that generates the highest total revenue.

SELECT J.type, SUM(J.totalCost) AS totalRevenue
FROM Job J
GROUP BY J.type
ORDER BY totalRevenue DESC
FETCH FIRST 1 ROWS ONLY;

Step 6.7.d. - d.List Clients Who Have Outstanding Payments and the Corresponding Jobs: To list clients with outstanding payments and the details of the jobs they've booked.

SELECT C.clientId, C.firstName, C.lastName, J.contractNo, J.type, J.amtDue
FROM Client C
JOIN Job J ON C.clientId = J.clientId
WHERE J.amtDue > 0;

Step 6.7.e. - Retrieve Total Payments by Payment Type: To retrieve the total payments made for each payment type.

SELECT P.payType, SUM(P.amount) AS totalPayment
FROM Payment P
GROUP BY P.payType;


