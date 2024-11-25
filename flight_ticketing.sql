-- Create the Passenger table
CREATE TABLE Passenger ( 
    PassengerID NUMBER PRIMARY KEY, 
    FirstName VARCHAR2(50) NOT NULL, 
    LastName VARCHAR2(50) NOT NULL, 
    DateOfBirth DATE, 
    Email VARCHAR2(100), 
    PhoneNumber VARCHAR2(15), 
    PassportNumber VARCHAR2(20) UNIQUE, 
    Nationality VARCHAR2(30), 
    Gender CHAR(1)
);

-- Create the Booking table
CREATE TABLE Booking (
    BookingID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    FlightID NUMBER NOT NULL,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount NUMBER(10, 2)
);

-- Create the Flights table
CREATE TABLE Flights (
    FlightID NUMBER PRIMARY KEY,
    FlightNumber VARCHAR2(10) NOT NULL,
    DepartureCity VARCHAR2(50),
    ArrivalCity VARCHAR2(50),
    DepartureTime TIMESTAMP,
    ArrivalTime TIMESTAMP
);

-- Create the Baggage table
CREATE TABLE Baggage (
    BaggageID NUMBER PRIMARY KEY,
    BookingID NUMBER NOT NULL,
    Weight NUMBER(5, 2),
    Type VARCHAR2(20),
    Status VARCHAR2(20),
    CONSTRAINT FK_Baggage_Booking FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
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

-- Create the Seats table
CREATE TABLE Seats (
    SeatID NUMBER PRIMARY KEY,
    FlightID NUMBER NOT NULL,
    SeatNumber VARCHAR2(10) NOT NULL,
    SeatClass VARCHAR2(20) DEFAULT 'Economy' CHECK (SeatClass IN ('Economy', 'Business', 'First')),
    IsAvailable CHAR(1) DEFAULT 'Y' CHECK (IsAvailable IN ('Y', 'N')),
    CONSTRAINT FK_Flight_Seat FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);


INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (1, 'John', 'Doe', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'john.doe@example.com', '1234567890', 'A12345678', 'American', 'M');

INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (2, 'Jane', 'Smith', TO_DATE('1992-05-10', 'YYYY-MM-DD'), 'jane.smith@example.com', '0987654321', 'B98765432', 'British', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (3, 'Kwame', 'Mensah', TO_DATE('1985-03-15', 'YYYY-MM-DD'), 'kwame.mensah@example.com', '233501234567', 'C12345678', 'Ghanaian', 'M');

INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (4, 'Ama', 'Boateng', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 'ama.boateng@example.com', '233507654321', 'D23456789', 'Ghanaian', 'F');

INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber, PassportNumber, Nationality, Gender) 
VALUES (5, 'Admin', 'User', TO_DATE('1980-11-11', 'YYYY-MM-DD'), 'admin@example.com', '1122334455', 'E98765432', 'American', 'M');


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


INSERT INTO Tickets (BookingID, SeatID, IssueDate, Price, Status) VALUES
(1, 1, SYSDATE, 1200.00, 'Active'),
(1, 2, SYSDATE, 1200.00, 'Active'),
(2, 3, SYSDATE, 1500.00, 'Active'),
(2, 4, SYSDATE, 1500.00, 'Active'),
(3, 5, SYSDATE, 1000.00, 'Active');

SELECT * FROM Passenger;

