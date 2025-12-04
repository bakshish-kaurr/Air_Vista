-- Air Vista: Holistic Aviation Data Manager

-- Description: Comprehensive aviation data management system
-- Tables: 7 main tables with 10 sample records each
-- Features: Views, Stored Procedures, Functions, Triggers, Indexes

-- Creating Database --
CREATE DATABASE AirVistaDB;
USE AirVistaDB;




-- Creating Tables --


-- Table 1: Airports
CREATE TABLE Airports (
    AirportID INT PRIMARY KEY IDENTITY(1,1),
    AirportCode VARCHAR(10) NOT NULL UNIQUE,
    AirportName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    TotalRunways INT DEFAULT 0,
    TotalGates INT DEFAULT 0,
    CreatedDate DATETIME DEFAULT GETDATE()
);
-- Inserting values
INSERT INTO Airports (AirportCode, AirportName, City, Country, TotalRunways, TotalGates) VALUES 
                    ('DEL', 'Indira Gandhi International Airport', 'New Delhi', 'India', 3, 78),
                    ('BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India', 2, 56),
                    ('BLR', 'Kempegowda International Airport', 'Bangalore', 'India', 2, 44),
                    ('JFK', 'John F. Kennedy International Airport', 'New York', 'USA', 4, 128),
                    ('LHR', 'London Heathrow Airport', 'London', 'UK', 2, 115),
                    ('DXB', 'Dubai International Airport', 'Dubai', 'UAE', 2, 97),
                    ('SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore', 3, 82),
                    ('HKG', 'Hong Kong International Airport', 'Hong Kong', 'China', 2, 88),
                    ('SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia', 3, 46),
                    ('FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany', 4, 103);
SELECT * FROM Airports;


-- Table 2: Airlines
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY IDENTITY(1,1),
    AirlineCode VARCHAR(10) NOT NULL UNIQUE,
    AirlineName VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    ContactEmail VARCHAR(100),
    ContactPhone VARCHAR(20),
    IsActive BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE()
);
-- Inserting values
INSERT INTO Airlines (AirlineCode, AirlineName, Country, ContactEmail, ContactPhone, IsActive) VALUES 
('AI', 'Air India', 'India', 'contact@airindia.in', '+91-1800-180-1407', 1),
('6E', 'IndiGo', 'India', 'support@goindigo.in', '+91-9910-383-838', 1),
('SG', 'SpiceJet', 'India', 'care@spicejet.com', '+91-987-180-3333', 1),
('BA', 'British Airways', 'UK', 'contact@ba.com', '+44-344-493-0787', 1),
('EK', 'Emirates', 'UAE', 'support@emirates.com', '+971-600-555-555', 1),
('SQ', 'Singapore Airlines', 'Singapore', 'info@singaporeair.com', '+65-6223-8888', 1),
('AA', 'American Airlines', 'USA', 'contact@aa.com', '+1-800-433-7300', 1),
('QF', 'Qantas', 'Australia', 'support@qantas.com', '+61-13-13-13', 1),
('LH', 'Lufthansa', 'Germany', 'info@lufthansa.com', '+49-69-86-799-799', 1),
('CX', 'Cathay Pacific', 'Hong Kong', 'contact@cathaypacific.com', '+852-2747-3333', 1);
SELECT * FROM Airlines;


-- Table 3: Aircraft
CREATE TABLE Aircraft (
    AircraftID INT PRIMARY KEY IDENTITY(1,1),
    AirlineID INT FOREIGN KEY REFERENCES Airlines(AirlineID),
    RegistrationNumber VARCHAR(20) NOT NULL UNIQUE,
    AircraftType VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50),
    TotalSeats INT NOT NULL,
    ManufactureYear INT,
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Maintenance', 'Grounded'))
);
-- Inserting values
INSERT INTO Aircraft (AirlineID, RegistrationNumber, AircraftType, Manufacturer, TotalSeats, ManufactureYear, Status) VALUES 
(1, 'VT-ANL', 'Boeing 787-8', 'Boeing', 256, 2018, 'Active'),
(1, 'VT-ALH', 'Airbus A320neo', 'Airbus', 180, 2019, 'Active'),
(2, 'VT-IFM', 'Airbus A320neo', 'Airbus', 186, 2020, 'Active'),
(3, 'VT-SGH', 'Boeing 737-800', 'Boeing', 189, 2016, 'Active'),
(4, 'G-EUUA', 'Airbus A320-200', 'Airbus', 168, 2015, 'Active'),
(5, 'A6-EEB', 'Airbus A380-800', 'Airbus', 517, 2014, 'Active'),
(6, '9V-SKA', 'Airbus A380-800', 'Airbus', 471, 2013, 'Active'),
(7, 'N123AA', 'Boeing 777-300ER', 'Boeing', 368, 2017, 'Active'),
(8, 'VH-OQA', 'Airbus A380-800', 'Airbus', 484, 2012, 'Active'),
(9, 'D-AIMA', 'Airbus A380-800', 'Airbus', 509, 2015, 'Active');
SELECT * FROM Aircraft;


-- Table 4: Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    DateOfBirth DATE,
    PassportNumber VARCHAR(20) UNIQUE,
    Nationality VARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE()
);
-- Inserting values
INSERT INTO Passengers (FirstName, LastName, Email, Phone, DateOfBirth, PassportNumber, Nationality) VALUES 
('Arjun', 'Mehta', 'arjun.mehta@email.com', '+91-98765-11111', '1990-05-12', 'P1234567', 'Indian'),
('Neha', 'Gupta', 'neha.gupta@email.com', '+91-98765-22222', '1985-08-20', 'P2345678', 'Indian'),
('Rohan', 'Verma', 'rohan.verma@email.com', '+91-98765-33333', '1992-11-15', 'P3456789', 'Indian'),
('Sarah', 'Johnson', 'sarah.j@email.com', '+1-555-123-4567', '1988-03-25', 'US1234567', 'American'),
('David', 'Smith', 'david.smith@email.com', '+44-7700-123456', '1975-07-10', 'UK9876543', 'British'),
('Mei', 'Chen', 'mei.chen@email.com', '+65-9876-5432', '1995-12-05', 'SG7654321', 'Singaporean'),
('Fatima', 'Ali', 'fatima.ali@email.com', '+971-50-987-6543', '1987-09-18', 'AE5432109', 'Emirati'),
('James', 'Wilson', 'james.wilson@email.com', '+61-412-345-678', '1982-06-30', 'AU8765432', 'Australian'),
('Hans', 'Mueller', 'hans.mueller@email.com', '+49-170-123-4567', '1978-02-14', 'DE6543210', 'German'),
('Li', 'Wang', 'li.wang@email.com', '+852-9123-4567', '1993-09-22', 'HK4321098', 'Chinese');
SELECT * FROM Passengers;


-- Table 5: Flights
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY IDENTITY(1,1),
    FlightNumber VARCHAR(20) NOT NULL,
    AirlineID INT FOREIGN KEY REFERENCES Airlines(AirlineID),
    AircraftID INT FOREIGN KEY REFERENCES Aircraft(AircraftID),
    DepartureAirportID INT FOREIGN KEY REFERENCES Airports(AirportID),
    ArrivalAirportID INT FOREIGN KEY REFERENCES Airports(AirportID),
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    FlightDuration INT, -- in minutes
    Status VARCHAR(20) DEFAULT 'Scheduled' CHECK (Status IN ('Scheduled', 'Boarding', 'Departed', 'Landed', 'Cancelled', 'Delayed')),
    GateNumber VARCHAR(10),
    CreatedDate DATETIME DEFAULT GETDATE()
);
-- Inserting values
INSERT INTO Flights (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, DepartureDateTime, ArrivalDateTime, FlightDuration, Status, GateNumber) VALUES 
('AI101', 1, 1, 1, 4, '2025-11-26 08:00:00', '2025-11-26 18:30:00', 870, 'Scheduled', 'G12'),
('6E202', 2, 3, 2, 6, '2025-11-26 14:30:00', '2025-11-26 18:45:00', 255, 'Scheduled', 'G23'),
('SG303', 3, 4, 3, 7, '2025-11-27 10:15:00', '2025-11-27 16:00:00', 285, 'Scheduled', 'G15'),
('BA404', 4, 5, 5, 1, '2025-11-27 22:00:00', '2025-11-28 10:30:00', 540, 'Scheduled', 'G45'),
('EK505', 5, 6, 6, 8, '2025-11-28 03:45:00', '2025-11-28 11:30:00', 465, 'Scheduled', 'D22'),
('SQ606', 6, 7, 7, 1, '2025-11-28 23:00:00', '2025-11-29 06:45:00', 345, 'Scheduled', 'T3-A8'),
('AA707', 7, 8, 4, 9, '2025-11-29 09:00:00', '2025-11-30 06:15:00', 1275, 'Scheduled', 'T8-B12'),
('QF808', 8, 9, 9, 7, '2025-11-29 15:30:00', '2025-11-29 22:45:00', 435, 'Scheduled', 'G34'),
('LH909', 9, 10, 10, 5, '2025-11-30 11:00:00', '2025-11-30 12:30:00', 90, 'Scheduled', 'A15'),
('AI110', 1, 2, 1, 2, '2025-11-26 06:00:00', '2025-11-26 08:15:00', 135, 'Scheduled', 'G8');
SELECT * FROM Flights;


-- Table 6: Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    BookingReference VARCHAR(20) NOT NULL UNIQUE,
    PassengerID INT FOREIGN KEY REFERENCES Passengers(PassengerID),
    FlightID INT FOREIGN KEY REFERENCES Flights(FlightID),
    SeatNumber VARCHAR(10),
    SeatClass VARCHAR(20) CHECK (SeatClass IN ('Economy', 'Business', 'First Class')),
    BookingDate DATETIME DEFAULT GETDATE(),
    BookingStatus VARCHAR(20) DEFAULT 'Confirmed' CHECK (BookingStatus IN ('Confirmed', 'Cancelled', 'Checked-In')),
    TotalPrice DECIMAL(10,2) NOT NULL,
    PaymentStatus VARCHAR(20) DEFAULT 'Pending' CHECK (PaymentStatus IN ('Pending', 'Completed', 'Refunded'))
);
-- Inserting values
INSERT INTO Bookings (BookingReference, PassengerID, FlightID, SeatNumber, SeatClass, TotalPrice, BookingStatus, PaymentStatus) VALUES 
('BK20251101', 1, 1, '12A', 'Business', 85000.00, 'Confirmed', 'Completed'),
('BK20251102', 2, 2, '15C', 'Economy', 18000.00, 'Confirmed', 'Completed'),
('BK20251103', 3, 3, '22F', 'Economy', 22000.00, 'Confirmed', 'Completed'),
('BK20251104', 4, 1, '1A', 'First Class', 250000.00, 'Confirmed', 'Completed'),
('BK20251105', 5, 4, '8B', 'Business', 95000.00, 'Confirmed', 'Completed'),
('BK20251106', 6, 5, '25D', 'Economy', 35000.00, 'Confirmed', 'Completed'),
('BK20251107', 7, 6, '18E', 'Economy', 42000.00, 'Confirmed', 'Pending'),
('BK20251108', 8, 7, '35A', 'Economy', 55000.00, 'Confirmed', 'Completed'),
('BK20251109', 9, 8, '10C', 'Business', 78000.00, 'Confirmed', 'Completed'),
('BK20251110', 10, 9, '5F', 'Business', 45000.00, 'Confirmed', 'Completed');
SELECT * FROM Bookings;


-- Table 7: Baggage
CREATE TABLE Baggage (
    BaggageID INT PRIMARY KEY IDENTITY(1,1),
    BookingID INT FOREIGN KEY REFERENCES Bookings(BookingID),
    BaggageTag VARCHAR(20) NOT NULL UNIQUE,
    Weight DECIMAL(5,2) NOT NULL,
    BaggageType VARCHAR(20) CHECK (BaggageType IN ('Checked', 'Carry-On', 'Special')),
    Status VARCHAR(20) DEFAULT 'Checked-In' CHECK (Status IN ('Checked-In', 'Loaded', 'In-Transit', 'Delivered', 'Lost')),
    CreatedDate DATETIME DEFAULT GETDATE()
);
-- Inserting values
INSERT INTO Baggage (BookingID, BaggageTag, Weight, BaggageType, Status) VALUES 
(1, 'AI10112345', 23.5, 'Checked', 'Checked-In'),
(2, '6E20223456', 18.0, 'Checked', 'Checked-In'),
(3, 'SG30334567', 15.5, 'Checked', 'Checked-In'),
(4, 'AI10145678', 20.0, 'Checked', 'Checked-In'),
(5, 'BA40456789', 25.0, 'Checked', 'Loaded'),
(6, 'EK50567890', 22.5, 'Checked', 'Loaded'),
(7, 'SQ60678901', 19.0, 'Checked', 'Checked-In'),
(8, 'AA70789012', 17.5, 'Checked', 'Checked-In'),
(9, 'QF80890123', 21.0, 'Checked', 'Loaded'),
(10, 'LH90901234', 16.5, 'Checked', 'Checked-In');
SELECT * FROM Baggage;


-- Table 8: Audit Table for Baggage Status Changes
CREATE TABLE BaggageAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    BaggageID INT,
    OldStatus VARCHAR(20),
    NewStatus VARCHAR(20),
    ChangedDate DATETIME DEFAULT GETDATE(),
    ChangedBy VARCHAR(100) DEFAULT SYSTEM_USER
);
SELECT * FROM BaggageAudit;



-- Creating VIEWS for Reporting --


-- View 1: Complete Flight Schedule
CREATE VIEW vw_FlightSchedule AS
SELECT 
    f.FlightID,
    f.FlightNumber,
    al.AirlineName,
    ac.RegistrationNumber AS AircraftReg,
    ac.AircraftType,
    dep.AirportCode AS DepartureCode,
    dep.AirportName AS DepartureAirport,
    dep.City AS DepartureCity,
    arr.AirportCode AS ArrivalCode,
    arr.AirportName AS ArrivalAirport,
    arr.City AS ArrivalCity,
    f.DepartureDateTime,
    f.ArrivalDateTime,
    f.FlightDuration,
    f.Status,
    f.GateNumber
FROM Flights f
INNER JOIN Airlines al ON f.AirlineID = al.AirlineID
INNER JOIN Aircraft ac ON f.AircraftID = ac.AircraftID
INNER JOIN Airports dep ON f.DepartureAirportID = dep.AirportID
INNER JOIN Airports arr ON f.ArrivalAirportID = arr.AirportID;

SELECT * FROM vw_FlightSchedule;

-- View 2: Booking Details with Passenger Info
CREATE VIEW vw_BookingDetails AS
SELECT 
    b.BookingID,
    b.BookingReference,
    p.FirstName + ' ' + p.LastName AS PassengerName,
    p.Email AS PassengerEmail,
    p.Phone AS PassengerPhone,
    p.PassportNumber,
    f.FlightNumber,
    al.AirlineName,
    b.SeatNumber,
    b.SeatClass,
    dep.AirportCode AS DepartureCode,
    arr.AirportCode AS ArrivalCode,
    f.DepartureDateTime,
    f.ArrivalDateTime,
    b.TotalPrice,
    b.BookingStatus,
    b.PaymentStatus
FROM Bookings b
INNER JOIN Passengers p ON b.PassengerID = p.PassengerID
INNER JOIN Flights f ON b.FlightID = f.FlightID
INNER JOIN Airlines al ON f.AirlineID = al.AirlineID
INNER JOIN Airports dep ON f.DepartureAirportID = dep.AirportID
INNER JOIN Airports arr ON f.ArrivalAirportID = arr.AirportID;

SELECT * FROM vw_BookingDetails;

-- View 3: Revenue Summary by Airline
CREATE VIEW vw_RevenueByAirline AS
SELECT 
    al.AirlineID,
    al.AirlineName,
    COUNT(b.BookingID) AS TotalBookings,
    SUM(CASE WHEN b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE 0 END) AS TotalRevenue,
    SUM(CASE WHEN b.PaymentStatus = 'Pending' THEN b.TotalPrice ELSE 0 END) AS PendingRevenue,
    AVG(CASE WHEN b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE NULL END) AS AvgBookingValue
FROM Airlines al
LEFT JOIN Flights f ON al.AirlineID = f.AirlineID
LEFT JOIN Bookings b ON f.FlightID = b.FlightID
GROUP BY al.AirlineID, al.AirlineName;

SELECT * FROM vw_RevenueByAirline;




-- Creating Procedures --


-- Procedure 1: Book a Flight
CREATE PROCEDURE sp_BookFlight
    @PassengerID INT,
    @FlightID INT,
    @SeatNumber VARCHAR(10),
    @SeatClass VARCHAR(20),
    @TotalPrice DECIMAL(10,2),
    @BookingReference VARCHAR(20) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Generate unique booking reference
    SET @BookingReference = 'BK' + CONVERT(VARCHAR(8), GETDATE(), 112) + 
                            RIGHT('0000' + CAST(ABS(CHECKSUM(NEWID())) % 10000 AS VARCHAR(4)), 4);
    
    -- Insert booking
    INSERT INTO Bookings (BookingReference, PassengerID, FlightID, SeatNumber, SeatClass, TotalPrice, BookingStatus, PaymentStatus)
    VALUES (@BookingReference, @PassengerID, @FlightID, @SeatNumber, @SeatClass, @TotalPrice, 'Confirmed', 'Pending');
    
    -- Return booking details
    SELECT 
        BookingID,
        BookingReference,
        PassengerID,
        FlightID,
        SeatNumber,
        SeatClass,
        TotalPrice,
        BookingStatus,
        PaymentStatus,
        BookingDate
    FROM Bookings
    WHERE BookingReference = @BookingReference;
END;

DECLARE @BookingRef VARCHAR(20);
EXEC sp_BookFlight
    @PassengerID = 1,
    @FlightID = 1,
    @SeatNumber = '12A',
    @SeatClass = 'Economy',
    @TotalPrice = 5000.00,
    @BookingReference = @BookingRef OUTPUT;
PRINT 'Booking Reference: ' + @BookingRef;


-- Procedure 2: Get Flight Status
CREATE PROCEDURE sp_GetFlightStatus
    @FlightNumber VARCHAR(20),
    @DepartureDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        f.FlightID,
        f.FlightNumber,
        al.AirlineName,
        dep.AirportName AS DepartureAirport,
        arr.AirportName AS ArrivalAirport,
        f.DepartureDateTime,
        f.ArrivalDateTime,
        f.Status,
        f.GateNumber,
        ac.AircraftType,
        COUNT(b.BookingID) AS TotalBookings,
        ac.TotalSeats - COUNT(b.BookingID) AS AvailableSeats
    FROM Flights f
    INNER JOIN Airlines al ON f.AirlineID = al.AirlineID
    INNER JOIN Aircraft ac ON f.AircraftID = ac.AircraftID
    INNER JOIN Airports dep ON f.DepartureAirportID = dep.AirportID
    INNER JOIN Airports arr ON f.ArrivalAirportID = arr.AirportID
    LEFT JOIN Bookings b ON f.FlightID = b.FlightID AND b.BookingStatus != 'Cancelled'
    WHERE f.FlightNumber = @FlightNumber 
        AND CAST(f.DepartureDateTime AS DATE) = @DepartureDate
    GROUP BY 
        f.FlightID, f.FlightNumber, al.AirlineName, 
        dep.AirportName, arr.AirportName, f.DepartureDateTime,
        f.ArrivalDateTime, f.Status, f.GateNumber,
        ac.AircraftType, ac.TotalSeats;
END;

EXEC sp_GetFlightStatus
    @FlightNumber = 'AI101',
    @DepartureDate = '2025-11-26';


-- Procedure 3: Update Flight Status
CREATE PROCEDURE sp_UpdateFlightStatus
    @FlightID INT,
    @NewStatus VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Validate status
    IF @NewStatus NOT IN ('Scheduled', 'Boarding', 'Departed', 'Landed', 'Cancelled', 'Delayed')
    BEGIN
        RAISERROR('Invalid flight status provided.', 16, 1);
        RETURN;
    END
    
    -- Update flight status
    UPDATE Flights
    SET Status = @NewStatus
    WHERE FlightID = @FlightID;
    
    -- Return updated flight information
    SELECT * FROM vw_FlightSchedule WHERE FlightID = @FlightID;
END;

EXEC sp_UpdateFlightStatus
    @FlightID = 1,
    @NewStatus = 'Boarding';


-- Procedure 4: Generate Revenue Report
CREATE PROCEDURE sp_GenerateRevenueReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        al.AirlineName,
        COUNT(DISTINCT f.FlightID) AS TotalFlights,
        COUNT(b.BookingID) AS TotalBookings,
        SUM(CASE WHEN b.PaymentStatus = 'Completed' THEN 1 ELSE 0 END) AS CompletedBookings,
        SUM(CASE WHEN b.PaymentStatus = 'Pending' THEN 1 ELSE 0 END) AS PendingBookings,
        SUM(CASE WHEN b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE 0 END) AS TotalRevenue,
        AVG(CASE WHEN b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE NULL END) AS AvgTicketPrice,
        SUM(CASE WHEN b.SeatClass = 'Economy' AND b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE 0 END) AS EconomyRevenue,
        SUM(CASE WHEN b.SeatClass = 'Business' AND b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE 0 END) AS BusinessRevenue,
        SUM(CASE WHEN b.SeatClass = 'First Class' AND b.PaymentStatus = 'Completed' THEN b.TotalPrice ELSE 0 END) AS FirstClassRevenue
    FROM Airlines al
    INNER JOIN Flights f ON al.AirlineID = f.AirlineID
    LEFT JOIN Bookings b ON f.FlightID = b.FlightID
    WHERE CAST(f.DepartureDateTime AS DATE) BETWEEN @StartDate AND @EndDate
    GROUP BY al.AirlineID, al.AirlineName
    ORDER BY TotalRevenue DESC;
END;

EXEC sp_GenerateRevenueReport
    @StartDate = '2025-11-01',
    @EndDate = '2025-11-30';




-- Creating Functions --


-- Function 1: Calculate Flight Occupancy Rate
CREATE FUNCTION fn_CalculateOccupancyRate(@FlightID INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @TotalSeats INT;
    DECLARE @BookedSeats INT;
    DECLARE @OccupancyRate DECIMAL(5,2);
    
    -- Get total seats
    SELECT @TotalSeats = ac.TotalSeats
    FROM Flights f
    INNER JOIN Aircraft ac ON f.AircraftID = ac.AircraftID
    WHERE f.FlightID = @FlightID;
    
    -- Get booked seats
    SELECT @BookedSeats = COUNT(*)
    FROM Bookings
    WHERE FlightID = @FlightID AND BookingStatus != 'Cancelled';
    
    -- Calculate occupancy rate
    IF @TotalSeats > 0
        SET @OccupancyRate = (@BookedSeats * 100.0) / @TotalSeats;
    ELSE
        SET @OccupancyRate = 0;
    
    RETURN @OccupancyRate;
END;

SELECT dbo.fn_CalculateOccupancyRate(1) AS OccupancyRate;


-- Function 2: Get Passenger Booking Count
CREATE FUNCTION fn_GetPassengerBookingCount(@PassengerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @BookingCount INT;
    
    SELECT @BookingCount = COUNT(*)
    FROM Bookings
    WHERE PassengerID = @PassengerID AND BookingStatus = 'Confirmed';
    
    RETURN ISNULL(@BookingCount, 0);
END;

SELECT dbo.fn_GetPassengerBookingCount(1) AS BookingCount;




-- Adding Cursors --


-- Cursor 1: Print all Active Flights
DECLARE @FlightID INT, @FlightNumber VARCHAR(20), @Status VARCHAR(20);

DECLARE cursor_ActiveFlights CURSOR FOR
SELECT FlightID, FlightNumber, Status 
FROM Flights 
WHERE Status = 'Scheduled';

OPEN cursor_ActiveFlights;
FETCH NEXT FROM cursor_ActiveFlights INTO @FlightID, @FlightNumber, @Status;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Flight ID: ' + CAST(@FlightID AS VARCHAR) + ', Number: ' + @FlightNumber + ', Status: ' + @Status;
    FETCH NEXT FROM cursor_ActiveFlights INTO @FlightID, @FlightNumber, @Status;
END;

CLOSE cursor_ActiveFlights;
DEALLOCATE cursor_ActiveFlights;


-- Cursor 2: Update Bookings PaymentStatus from 'Pending' to 'Completed' for a given FlightID
DECLARE @BookingID INT;
DECLARE @FlightID INT = 1;  -- Set this to the Flight ID you want to update

DECLARE cursor_PendingPayments CURSOR FOR
SELECT BookingID
FROM Bookings
WHERE FlightID = @FlightID AND PaymentStatus = 'Pending';

OPEN cursor_PendingPayments;
FETCH NEXT FROM cursor_PendingPayments INTO @BookingID;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Bookings SET PaymentStatus = 'Completed' WHERE BookingID = @BookingID;
    PRINT 'Updated BookingID ' + CAST(@BookingID AS VARCHAR) + ' to Completed';
    FETCH NEXT FROM cursor_PendingPayments INTO @BookingID;
END;

CLOSE cursor_PendingPayments;
DEALLOCATE cursor_PendingPayments;




-- Creating Indexes --


-- Index 1: Flights table, on DepartureDateTime for fast schedule queries
CREATE NONCLUSTERED INDEX IX_Flights_DepartureDateTime 
ON Flights(DepartureDateTime);


-- Index 2: Flights table, on FlightNumber for quick flight lookups
CREATE NONCLUSTERED INDEX IX_Flights_FlightNumber 
ON Flights(FlightNumber);


-- Index 3: Bookings table, on PassengerID for fast passenger booking searches
CREATE NONCLUSTERED INDEX IX_Bookings_PassengerID 
ON Bookings(PassengerID);


-- Index 4: Bookings table, on FlightID for quick lookup of bookings by flight
CREATE NONCLUSTERED INDEX IX_Bookings_FlightID 
ON Bookings(FlightID);


-- Index 5: Passengers table, on Email for efficient email searches
CREATE NONCLUSTERED INDEX IX_Passengers_Email 
ON Passengers(Email);




-- Creating Triggers --


-- Trigger 1: Auto-Update Flight Duration
CREATE TRIGGER trg_UpdateFlightDuration
ON Flights
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE f
    SET f.FlightDuration = DATEDIFF(MINUTE, i.DepartureDateTime, i.ArrivalDateTime)
    FROM Flights f
    INNER JOIN inserted i ON f.FlightID = i.FlightID;
END;

UPDATE Flights
SET ArrivalDateTime = DATEADD(MINUTE, 15, ArrivalDateTime)
WHERE FlightID = 1;


-- Trigger 2: Prevent Overbooking
CREATE TRIGGER trg_PreventOverbooking
ON Bookings
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @FlightID INT;
    DECLARE @TotalSeats INT;
    DECLARE @BookedSeats INT;
    
    SELECT @FlightID = FlightID FROM inserted;
    
    -- Get total seats for the flight
    SELECT @TotalSeats = ac.TotalSeats
    FROM Flights f
    INNER JOIN Aircraft ac ON f.AircraftID = ac.AircraftID
    WHERE f.FlightID = @FlightID;
    
    -- Get currently booked seats
    SELECT @BookedSeats = COUNT(*)
    FROM Bookings
    WHERE FlightID = @FlightID AND BookingStatus != 'Cancelled';
    
    -- Check if seats are available
    IF @BookedSeats < @TotalSeats
    BEGIN
        INSERT INTO Bookings (BookingReference, PassengerID, FlightID, SeatNumber, SeatClass, BookingDate, BookingStatus, TotalPrice, PaymentStatus)
        SELECT BookingReference, PassengerID, FlightID, SeatNumber, SeatClass, BookingDate, BookingStatus, TotalPrice, PaymentStatus
        FROM inserted;
    END
    ELSE
    BEGIN
        RAISERROR('Flight is fully booked. Cannot create new booking.', 16, 1);
    END
END;

INSERT INTO Bookings (BookingReference, PassengerID, FlightID, SeatNumber, SeatClass, BookingDate, BookingStatus, TotalPrice, PaymentStatus)
VALUES ('BKTEST001', 1, 1, '15B', 'Economy', GETDATE(), 'Confirmed', 5000, 'Pending');


-- Trigger 3: Log Baggage Status Changes
CREATE TRIGGER trg_LogBaggageStatusChange
ON Baggage
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO BaggageAudit (BaggageID, OldStatus, NewStatus)
    SELECT d.BaggageID, d.Status, i.Status
    FROM deleted d
    INNER JOIN inserted i ON d.BaggageID = i.BaggageID
    WHERE d.Status != i.Status;
END;

UPDATE Baggage
SET Status = 'Loaded'
WHERE BaggageID = 1;




PRINT 'Air Vista project completed successfully with all database objects created and tested.';
PRINT '© 2025 Created by Bakshish Kaur. All rights reserved.';