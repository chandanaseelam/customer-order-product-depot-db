-- Step 5.4 - Insert several records in each table

INSERT INTO Client VALUES(1, 'John', 'Doe', '123 Main St', 'New York', 'NY', '10001', '212', '555-1234');
INSERT INTO Client VALUES(2, 'Jane', 'Smith', '456 Elm St', 'Los Angeles', 'CA', '90001', '310', '555-5678');
INSERT INTO Client VALUES(3, 'Michael', 'Johnson', '789 Oak St', 'Chicago', 'IL', '60001', '312', '555-9876');
INSERT INTO Client VALUES(4, 'Emily', 'Davis', '101 Pine St', 'San Francisco', 'CA', '94101', '415', '555-1234');
INSERT INTO Client VALUES(5, 'William', 'Lee', '202 Elm St', 'Miami', 'FL', '33101', '305', '555-5678');
INSERT INTO Client VALUES(6, 'Olivia', 'Wilson', '303 Oak St', 'Houston', 'TX', '77001', '713', '555-9876');
commit;
 
INSERT INTO Meeting VALUES(1, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), 'MeetingRep1');
INSERT INTO Meeting VALUES(2, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00',' HH24:MI:SS'), 'MeetingRep2');
INSERT INTO Meeting VALUES(3, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 'MeetingRep3');
INSERT INTO Meeting VALUES(4, TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_TIMESTAMP('09:15:00', 'HH24:MI:SS'), 'MeetingRep4');
INSERT INTO Meeting VALUES(5, TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_TIMESTAMP('16:45:00', 'HH24:MI:SS'), 'MeetingRep5');
INSERT INTO Meeting VALUES(6, TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 'MeetingRep6');
commit;

INSERT INTO Photographer VALUES(101, 'Sarah', 'Brown', '111 Pine St', 'San Francisco', 'CA', '94101', '415', '555-1111');
INSERT INTO Photographer VALUES(102, 'David', 'Wilson', '222 Cedar St', 'Miami', 'FL', '33101', '305', '555-2222');
INSERT INTO Photographer VALUES(103, 'Linda', 'Garcia', '333 Oak St', 'Chicago', 'IL', '60001', '312', '555-3333');
INSERT INTO Photographer VALUES(104, 'Michael', 'Jones', '444 Elm St', 'Los Angeles', 'CA', '90001', '310', '555-4444');
INSERT INTO Photographer VALUES(105, 'Emily', 'Martinez', '555 Maple St', 'Houston', 'TX', '77001', '713', '555-5555');
INSERT INTO Photographer VALUES(106, 'Daniel', 'Hernandez', '666 Walnut St', 'New York', 'NY', '10001', '212', '555-6666');
commit;

INSERT INTO Booking VALUES(1, TO_DATE('2023-10-16', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'),4, 'Wedding', 101, 102);
INSERT INTO Booking VALUES(2, TO_DATE('2023-11-21', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'),3, 'Corporate', 101, 102);
INSERT INTO Booking VALUES(3, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'),2, 'Portrait', 103, 104);
INSERT INTO Booking VALUES(4, TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_TIMESTAMP('09:15:00', 'HH24:MI:SS'),5, 'Product', 104, 105);
INSERT INTO Booking VALUES(5, TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_TIMESTAMP('16:45:00', 'HH24:MI:SS'),1, 'Engagement', 102, 106);
INSERT INTO Booking VALUES(6, TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'),3, 'Birthday', 103, 105);
commit;

INSERT INTO PackageMenu VALUES(1, 10, 'Standard', 20, 'Leather', 500.00);
INSERT INTO PackageMenu VALUES(2, 15, 'Deluxe', 30, 'Hardcover', 800.00);
INSERT INTO PackageMenu VALUES(3, 12, 'Premium', 25, 'Metallic', 700.00);
INSERT INTO PackageMenu VALUES(4, 8, 'Basic', 15, 'Paperback', 300.00);
INSERT INTO PackageMenu VALUES(5, 20, 'Ultimate', 40, 'Canvas', 1000.00);
INSERT INTO PackageMenu VALUES(6, 5, 'Economy', 10, 'Plastic', 200.00);
commit;

INSERT INTO Job VALUES(1001, 'Wedding Photography', 'John and Jane Wedding', 'New York', 1, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_TIMESTAMP('10:00:00','HH24:MI:SS'), 4, 1200.00, 101, 102, 1, 1200.00, 800.00, 400.00);
INSERT INTO Job VALUES(1002, 'Corporate Event Photography', 'ABC Inc. Conference', 'Los Angeles', 2, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_TIMESTAMP('14:30:00','HH24:MI:SS'), 3, 1500.00, 101, 102, 2, 1500.00, 1000.00, 500.00);
INSERT INTO Job VALUES(1003, 'Family Portrait', 'Smith Family', 'Chicago', 3, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('11:00:00','HH24:MI:SS'), 2, 600.00, 103, 104, 3, 600.00, 400.00, 200.00);
INSERT INTO Job VALUES(1004, 'Product Photography', 'TechPro Product Shoot', 'San Francisco', 4, TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_TIMESTAMP('09:15:00','HH24:MI:SS'), 5, 2000.00, 104, 105, 5, 2000.00, 1500.00, 500.00);
INSERT INTO Job VALUES(1005, 'Engagement Session', 'Lee and Davis Engagement', 'Miami', 5, TO_DATE('2023-08-12', 'YYYY-MM-DD'), TO_TIMESTAMP('16:45:00','HH24:MI:SS'), 1, 400.00, 102, 106, 2, 500.00, 300.00, 200.00);
INSERT INTO Job VALUES(1006, 'Birthday Party Photography', 'Olivia 30th Birthday', 'Houston', 6, TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_TIMESTAMP('13:30:00','HH24:MI:SS'), 3, 800.00, 103, 105, 4, 1000.00, 700.00, 300.00);
commit;

INSERT INTO Proof VALUES(1001, 1, 'High Resolution');
INSERT INTO Proof VALUES(1002, 2, 'High Resolution');
INSERT INTO Proof VALUES(1003, 3, 'Low Resolution');
INSERT INTO Proof VALUES(1004, 4, 'Low Resolution');
INSERT INTO Proof VALUES(1005, 5, 'Medium Resolution');
INSERT INTO Proof VALUES(1006, 6, 'High Resolution');
commit;

INSERT INTO orders VALUES(5001, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 800.00, 1, 1001);
INSERT INTO orders VALUES(5002, TO_DATE('2023-11-21', 'YYYY-MM-DD'), 1000.00, 2, 1002);
INSERT INTO orders VALUES(5003, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 600.00, 3, 1003);
INSERT INTO orders VALUES(5004, TO_DATE('2023-09-25', 'YYYY-MM-DD'), 2000.00, 4, 1004);
INSERT INTO orders VALUES(5005, TO_DATE('2023-08-12', 'YYYY-MM-DD'), 400.00, 2, 1005);
INSERT INTO orders VALUES(5006, TO_DATE('2023-07-28', 'YYYY-MM-DD'), 800.00, 4, 1006);
commit;

INSERT INTO OrderItem VALUES(5001, 1, '8x10', 3, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO OrderItem VALUES(5002, 2, '5x7', 4, TO_DATE('2023-11-23', 'YYYY-MM-DD'));
INSERT INTO OrderItem VALUES(5003, 3, '8x10', 2, TO_DATE('2023-12-10', 'YYYY-MM-DD'));
INSERT INTO OrderItem VALUES(5004, 4, '5x7', 3, TO_DATE('2023-09-30', 'YYYY-MM-DD'));
INSERT INTO OrderItem VALUES(5005, 5, '4x6', 5, TO_DATE('2023-08-15', 'YYYY-MM-DD'));
INSERT INTO OrderItem VALUES(5006, 6, '4x6', 4, TO_DATE('2023-07-30', 'YYYY-MM-DD'));
commit;

INSERT INTO Payment VALUES(1001, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'Credit Card', 800.00);
INSERT INTO Payment VALUES(1002, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Check', 1000.00);
INSERT INTO Payment VALUES(1003, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'Cash', 400.00);
INSERT INTO Payment VALUES(1004, TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'Credit Card', 1500.00);
INSERT INTO Payment VALUES(1005, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'PayPal', 300.00);
INSERT INTO Payment VALUES(1006, TO_DATE('2023-07-30', 'YYYY-MM-DD'), 'Check', 700.00);
commit;

INSERT INTO EmergencyContact VALUES(1, 1001, 'EmergencyJohn', 'EmergencyDoe', '555-9999');
INSERT INTO EmergencyContact VALUES(2, 1002, 'EmergencyJane', 'EmergencySmith', '555-8888');
INSERT INTO EmergencyContact VALUES(3, 1003, 'EmergencyMichael', 'EmergencyJohnson', '555-7777');
INSERT INTO EmergencyContact VALUES(4, 1004, 'EmergencyEmily', 'EmergencyDavis', '555-6666');
INSERT INTO EmergencyContact VALUES(5, 1005, 'EmergencyWilliam', 'EmergencyLee', '555-5555');
INSERT INTO EmergencyContact VALUES(6, 1006, 'EmergencyOlivia', 'EmergencyWilson', '555-4444');
commit;
