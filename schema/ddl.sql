-- Step 5.2 - Create the tables for the initial relational model	
 
-- Create the Client table
CREATE TABLE Client (
    clientId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    areaCode VARCHAR(10),
    phoneNumber VARCHAR(20)
);

-- Create the Meeting table
CREATE TABLE Meeting (
    clientId INT,
    meetDate DATE,
    meetTime TIMESTAMP,
    repName VARCHAR(100),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

-- Create the Photographer table
CREATE TABLE Photographer (
    empId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    areaCode VARCHAR(10),
    number VARCHAR(20)
);

-- Create the Booking table
CREATE TABLE Booking (
    clientId INT,
    bookingDate DATE,
    bookingTime TIMESTAMP,
    duration INT,
    type VARCHAR(50),
    empId1 INT,
    empId2 INT,
    FOREIGN KEY (clientId) REFERENCES Client(clientId),
    FOREIGN KEY (empId1) REFERENCES Photographer(empId),
    FOREIGN KEY (empId2) REFERENCES Photographer(empId)
);

-- Create the PackageMenu table
CREATE TABLE PackageMenu (
    packageNo INT PRIMARY KEY,
    numWallet INT,
    albumType VARCHAR(50),
    albumPages INT,
    albumCover VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create the Job table
CREATE TABLE Job (
    contractNo INT PRIMARY KEY,
    type VARCHAR(50),
    eventName VARCHAR(100),
    location VARCHAR(100),
    clientId INT,
    Jobdate DATE,
    time TIMESTAMP,
    duration INT,
    cost DECIMAL(10, 2),
    empId1 INT,
    empId2 INT,
    packageNoChosen INT,
    totalCost DECIMAL(10, 2),
    amtPaid DECIMAL(10, 2),
    amtDue DECIMAL(10, 2),
    FOREIGN KEY (clientId) REFERENCES Client(clientId),
    FOREIGN KEY (empId1) REFERENCES Photographer(empId),
    FOREIGN KEY (empId2) REFERENCES Photographer(empId),
    FOREIGN KEY (packageNoChosen) REFERENCES PackageMenu(packageNo)
);

-- Create the Proof table
CREATE TABLE Proof (
    contractNo INT,
    proofNo INT PRIMARY KEY,
    quality VARCHAR(50),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create the orders table
CREATE TABLE Orders (
    orderNo INT PRIMARY KEY,
    dateOrdered DATE,
    totalAmount DECIMAL(10, 2),
    packageNoOrdered INT,
    contractNo INT,
    FOREIGN KEY (packageNoOrdered) REFERENCES PackageMenu(packageNo),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create the OrderItem table
CREATE TABLE OrderItem (
    orderNo INT,
    proofNo INT,
    photosize VARCHAR(50),
    quantity INT,
    dateDelivered DATE,
    FOREIGN KEY (orderNo) REFERENCES Orders(orderNo),
    FOREIGN KEY (proofNo) REFERENCES Proof(proofNo)
);

-- Create the Payment table
CREATE TABLE Payment (
    contractNo INT,
    datePaid DATE,
    payType VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (contractNo) REFERENCES Job(contractNo)
);

-- Create the Emergency Contact table
CREATE TABLE EmergencyContact (
    clientId INT,
    eventid INT,
    EmergencyFirstName VARCHAR(50),
    EmergencyLastName VARCHAR(50),
    EmergencyPhoneNumber VARCHAR(20),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);
