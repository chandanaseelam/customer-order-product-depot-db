-- Step 6.5 - Create indexes for foreign keys and any other columns that will be used most often for queries.

CREATE INDEX idx_meeting_clientId ON Meeting(clientId);

CREATE INDEX idx_booking_clientId ON Booking(clientId);

CREATE INDEX idx_booking_empId1 ON Booking(empId1);
CREATE INDEX idx_booking_empId2 ON Booking(empId2);

CREATE INDEX idx_job_clientId ON Job(clientId);

CREATE INDEX idx_job_empId1 ON Job(empId1);
CREATE INDEX idx_job_empId2 ON Job(empId2);

CREATE INDEX idx_job_packageNoChosen ON Job(packageNoChosen);

CREATE INDEX idx_proof_contractNo ON Proof(contractNo);

CREATE INDEX idx_orders_contractNo ON Orders(contractNo);

CREATE INDEX idx_orderitem_orderNo ON OrderItem(orderNo);

CREATE INDEX idx_payment_contractNo ON Payment(contractNo);

CREATE INDEX idx_emergencycontact_clientId ON EmergencyContact(clientId);

CREATE INDEX idx_job_date ON Job(date);
 