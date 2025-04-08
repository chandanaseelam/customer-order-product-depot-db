-- Step 6.4 - drop the existing tables for the Images and Photography Studio, in reverse order

drop table Client;
drop table Meeting;
drop table Photographer;
drop table Booking;
drop table PackageMenu;
drop table Job;
drop table Proof;
drop table Order;
drop table OrderItem;
drop table Payment;
drop table EmergencyContact;

-- create the new tables in normalized form
-- Create Client table
CREATE TABLE Client (
    clientId NUMBER PRIMARY KEY,
    firstName VARCHAR2(50),
    lastName VARCHAR2(50)
);

-- Create Address table
CREATE TABLE Address (
    zip VARCHAR2(10) PRIMARY KEY,
    city VARCHAR2(50),
    state VARCHAR2(2)
);

-- Create Phonenumber Table
CREATE TABLE PhoneNumber (
    areaCode VARCHAR2(3),
    phoneNumber VARCHAR2(20),
    street VARCHAR2(100),
    zip VARCHAR2(10), -- Add a zip column
    PRIMARY KEY (areaCode, phoneNumber),
    FOREIGN KEY (zip) REFERENCES Address(zip)
);

-- Create Meeting table
CREATE TABLE Meeting (
    clientId NUMBER,
    meetDate DATE,
    meetTime TIMESTAMP,
    repName VARCHAR2(50),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

-- Create Photographer table 
CREATE TABLE Photographer (
    empId NUMBER PRIMARY KEY,
    firstName VARCHAR2(50),
    lastName VARCHAR2(50),
    zip VARCHAR2(10), 
    street VARCHAR2(100),
    FOREIGN KEY (zip) REFERENCES Address(zip)
);

-- Create Booking table
-- Create Booking table with foreign key references
CREATE TABLE Booking (
    clientId NUMBER,
    bookingDate DATE,
    bookingTime TIMESTAMP,
    duration NUMBER,
    type VARCHAR2(50),
    empId1 NUMBER,
    empId2 NUMBER,
    FOREIGN KEY (clientId) REFERENCES Client(clientId),
    FOREIGN KEY (empId1) REFERENCES Photographer(empId),
    FOREIGN KEY (empId2) REFERENCES Photographer(empId)
);

-- Create PackageMenu table
CREATE TABLE PackageMenu (
    packageNo NUMBER PRIMARY KEY,
    numWallet NUMBER,
    albumType VARCHAR2(50),
    albumPages NUMBER,
    albumCover VARCHAR2(50),
    price NUMBER
);

-- Create Job table
CREATE TABLE Job (
    contractNo NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    eventName VARCHAR2(100),
    location VARCHAR2(100),
    clientId NUMBER,
    jobdate DATE,
    time TIMESTAMP,
    duration NUMBER,
    cost NUMBER,
    empId1 NUMBER,
    empId2 NUMBER,
    packageNoChosen NUMBER,
    totalCost NUMBER,
    amtPaid NUMBER,
    amtDue NUMBER
);

-- Create Proof table
CREATE TABLE Proof (
    contractNo NUMBER,
    proofNo NUMBER,
    quality VARCHAR2(50),
    PRIMARY KEY (contractNo, proofNo),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create orders table
CREATE TABLE orders (
    orderNo NUMBER PRIMARY KEY,
    dateOrdered DATE,
    totalAmount NUMBER,
    packageNoOrdered NUMBER,
    contractNo NUMBER,
    FOREIGN KEY (packageNoOrdered) REFERENCES PackageMenu(packageNo),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create OrderItem table
CREATE TABLE OrderItem (
    orderNo NUMBER,
    proofNo NUMBER,
    photosize VARCHAR2(20),
    quantity NUMBER,
    dateDelivered DATE,
    PRIMARY KEY (orderNo, proofNo, photosize),
    FOREIGN KEY (orderNo) REFERENCES orders(orderNo)
);

-- Create Payment table
CREATE TABLE Payment (
    contractNo NUMBER,
    datePaid DATE,
    payType VARCHAR2(50),
    amount NUMBER,
    PRIMARY KEY (contractNo, datePaid),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create EmergencyContact table
CREATE TABLE EmergencyContact (
    clientId NUMBER,
    eventid NUMBER,
    Emergencyfirstname VARCHAR2(50),
    Emergencylastname VARCHAR2(50),
    Emergencyphonenumber VARCHAR2(20),
    PRIMARY KEY (clientId, eventid),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);
