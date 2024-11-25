-- Create the Passenger table
CREATE TABLE Passenger ( 
    PassengerID NUMBER PRIMARY KEY, 
    FirstName VARCHAR2(50) NOT NULL, 
    LastName VARCHAR2(50) NOT NULL, 
    DateOfBirth DATE, 
    PhoneNumber VARCHAR2(15), 
    PassportNumber VARCHAR2(20) UNIQUE, 
    Nationality VARCHAR2(30), 
    Gender CHAR(1)
);

-- Create the Booking table
CREATE TABLE Booking (
   BookingDate VARCHAR PRIMARY KEY,
   Status VARCHAR NOT NULL,
   TotalCost INT,
   PassengerID  VARCHAR REFERENCES Passenger(Passenger ID)
);

-- Create the Flights table
CREATE TABLE Airport (
    Airport PRIMARY KEY,
    City NOT NULL,
    Country VARCHAR
    
);

-- Create the Baggage table
CREATE TABLE Airlines (
     AirlineName INT PRIMARY KEY,
     Country INT NOT NULL,
     
   
);

-- Create the Payment table
CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    BookingID NUMBER NOT NULL,
    Amount NUMBER(10, 2),
    PaymentMethod VARCHAR2(50),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);




-- View Schema
DESCRIBE Passenger;
DESCRIBE Booking;
DESCRIBE Flights;
DESCRIBE Baggage;
DESCRIBE Payment;
DESCRIBE Seats;



--Data Insertion
INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (1, 'John', 'Doe', '024466', 'A123', 'American', 'M');

INSERT INTO Passenger (PassengerID, FirstName, LastName,PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (2, 'Jane', 'Smith','098765', 'B432', 'British', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName,  PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (3, 'Kwame', 'Mensah','233501', 'C1234', 'Ghanaian','M');

INSERT INTO Passenger (PassengerID, FirstName, LastName,  PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (4, 'Ama', 'Boateng', '233507', 'D234', 'Ghanaian', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName, , PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (5, 'Seyram', 'Avey', '11223', 'E987', 'American', 'M');

INSERT INTO Booking (BookingDate, Status, TotalCost, PassengerID) VALUES 
(1-10-24, 'Confirmed', 299.99, 1),
(24-11-24, 'confirmed', 499.00, 2);
(12-11-24, 'confirmed', 629.99, 3);
(30-11-24, 'confirmed', 399.00, 4);
(29-11-24, 'Pending', 789.99, 5);




INSERT INTO Airlines (AirlineName, Country) VALUES
('Ghana Airways', 'Ghana'),
('Delta Airlines', 'USA'),
('British Airways', 'UK'),
('Emirates', 'UAE'),
('Turkish Airlines', 'Turkey');


INSERT INTO Airports (AirportName, City, Country) VALUES
('Kotoka International Airport', 'Accra', 'Ghana'),
('Heathrow Airport', 'London', 'UK'),
('Hartsfield-Jackson Atlanta International', 'Atlanta', 'USA'),
('Dubai International Airport', 'Dubai', 'UAE'),
('Istanbul Airport', 'Istanbul', 'Turkey');


INSERT INTO Payment (PaymentID NUMBER PRIMARY KEY,BookingID NUMBER NOT NULL,Amount NUMBER(10, 2),PaymentMethod VARCHAR2(50),PaymentDate) VALUES
(1, 1, SYSDATE, 1200.00, 'Active'),
(1, 2, SYSDATE, 1200.00, 'Active'),
(2, 3, SYSDATE, 1500.00, 'Active'),
(2, 4, SYSDATE, 1500.00, 'Active'),
(3, 5, SYSDATE, 1000.00, 'Active');

       
