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


SELECT * FROM Passenger;


CREATE TABLE Baggage (
    BaggageID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    Weight DECIMAL(5, 2),
    Type VARCHAR(20),
    Status VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

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
