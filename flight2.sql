
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
   BookingID INT PRIMARY KEY,
   BookingDate DATE, 
   Status VARCHAR2(20) NOT NULL, 
   TotalCost INT,
   PassengerID NUMBER,
   PRIMARY KEY (BookingDate), 
   FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Create the Airlines table
CREATE TABLE Airlines (
     AirlineName VARCHAR2(50) PRIMARY KEY,
     Country VARCHAR2(50) NOT NULL
);

-- Create the Airports table
CREATE TABLE Airports (
    AirportName VARCHAR2(50) PRIMARY KEY,
    City VARCHAR2(50) NOT NULL,
    Country VARCHAR2(50) NOT NULL
);

-- Create the Payment table
CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    BookingID DATE NOT NULL, 
    Amount NUMBER(10, 2),
    PaymentMethod VARCHAR2(50),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID) REFERENCES Booking(BookingDate)
);

-- Data Insertion
INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (1, 'John', 'Doe', '024466', 'A123', 'American', 'M');

INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (2, 'Jane', 'Smith', '098765', 'B432', 'British', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (3, 'Kwame', 'Mensah', '233501', 'C1234', 'Ghanaian', 'M');

INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (4, 'Ama', 'Boateng', '233507', 'D234', 'Ghanaian', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (5, 'Seyram', 'Avey', '11223', 'E987', 'American', 'F');

--insert data into booking table
INSERT INTO Booking (BookingID, BookingDate, Status, TotalCost, PassengerID) 
VALUES (1, TO_DATE('2024-11-24','YY-MM-DD'), 'Confirmed', 499.00, 2);

INSERT INTO Booking (BookingID, BookingDate, Status, TotalCost, PassengerID) 
VALUES (2, TO_DATE('2024-11-24','YY-MM-DD'), 'Confirmed', 499.00, 2);

INSERT INTO Booking (BookingID, BookingDate, Status, TotalCost, PassengerID) 
VALUES (3, TO_DATE('2024-11-12', 'YYYY-MM-DD'), 'Confirmed', 629.99, 3);

INSERT INTO Booking (BookingID, BookingDate, Status, TotalCost, PassengerID) 
VALUES (4, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 'Confirmed', 399.00, 4);

INSERT INTO Booking (BookingID, BookingDate, Status, TotalCost, PassengerID) 
VALUES (5, TO_DATE('2024-11-29', 'YYYY-MM-DD'), 'Pending', 789.99, 5);

-- Insert data into Airlines table
INSERT INTO Airlines (AirlineName, Country) 
VALUES ('Ghana Airways', 'Ghana');

INSERT INTO Airlines (AirlineName, Country) 
VALUES ('Delta Airlines', 'USA');

INSERT INTO Airlines (AirlineName, Country) 
VALUES ('British Airways', 'UK');

INSERT INTO Airlines (AirlineName, Country) 
VALUES ('Emirates', 'UAE');

INSERT INTO Airlines (AirlineName, Country) 
VALUES ('Turkish Airlines', 'Turkey');

-- Insert data into Airports table
INSERT INTO Airports (AirportName, City, Country) 
VALUES ('Kotoka International Airport', 'Accra', 'Ghana');

INSERT INTO Airports (AirportName, City, Country) 
VALUES ('Heathrow Airport', 'London', 'UK');

INSERT INTO Airports (AirportName, City, Country) 
VALUES ('Hartsfield-Jackson Atlanta International', 'Atlanta', 'USA');

INSERT INTO Airports (AirportName, City, Country) 
VALUES ('Dubai International Airport', 'Dubai', 'UAE');

INSERT INTO Airports (AirportName, City, Country) 
VALUES ('Istanbul Airport', 'Istanbul', 'Turkey');

-- Insert data into Payment table
INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) 
VALUES (1, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 1200.00, 'CASH', SYSDATE);

INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) 
VALUES (2, TO_DATE('2024-11-24', 'YYYY-MM-DD'), 1200.00, 'DEBIT CARD', SYSDATE);

INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) 
VALUES (3, TO_DATE('2024-11-12', 'YYYY-MM-DD'), 1500.00, 'CASH', SYSDATE);

INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) 
VALUES (4, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 1500.00, 'CASH', SYSDATE);

INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentMethod, PaymentDate) 
VALUES (5, TO_DATE('2024-11-29', 'YYYY-MM-DD'), 1000.00, 'DEBIT CARD', SYSDATE);

-- A built-in function in Oracle SQL that retrieves the current date and time of the system


--print the tables
SELECT * FROM Passenger;
SELECT * FROM Booking;
SELECT * FROM Airlines;
SELECT * FROM Airports;
SELECT * FROM Payment;
