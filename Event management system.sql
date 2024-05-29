-- Create database
CREATE DATABASE EventManagementSystem;
USE EventManagementSystem;

-- Create tables
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Contact VARCHAR(100)
);

CREATE TABLE Venues (
    VenueID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Capacity INT
);

CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    Date DATE,
    Time TIME,
    Description TEXT,
    Capacity INT,
    VenueID INT,
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT,
    ClientID INT,
    DateAndTime DATETIME,
    NumberOfAttendees INT,
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Insert sample data
INSERT INTO Clients (Name, Contact) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Carol White', 'carol@example.com'),
('David Brown', 'david@example.com');

INSERT INTO Venues (Name, Address, Capacity) VALUES
('Grand Hall', '123 Main St, Cityville', 500),
('Conference Center', '456 Elm St, Townsville', 300),
('Banquet Room', '789 Oak St, Villagetown', 200),
('Meeting Place', '101 Pine St, Hamletcity', 100);

INSERT INTO Events (EventName, Date, Time, Description, Capacity, VenueID) VALUES
('Tech Conference', '2024-06-15', '09:00:00', 'Annual tech conference.', 300, 2),
('Wedding Reception', '2024-07-20', '18:00:00', 'Reception for the wedding of Alice and Bob.', 200, 3),
('Business Meeting', '2024-08-05', '14:00:00', 'Quarterly business review meeting.', 100, 4),
('Charity Gala', '2024-09-10', '19:00:00', 'Annual charity fundraising gala.', 500, 1);

INSERT INTO Bookings (EventID, ClientID, DateAndTime, NumberOfAttendees) VALUES
(1, 1, '2024-06-15 09:00:00', 150),
(2, 2, '2024-07-20 18:00:00', 200),
(3, 3, '2024-08-05 14:00:00', 50),
(4, 4, '2024-09-10 19:00:00', 300);


INSERT INTO Venues (Name, Address, Capacity) VALUES
('Community Center', '202 Elm St', 250);
INSERT INTO Events (EventName, Date, Time, Description, Capacity, VenueID) VALUES
('Tech Meetup', '2024-11-01', '10:00:00', 'A meetup for tech enthusiasts.', 200, 1);
INSERT INTO Clients (Name, Contact) VALUES
('Emma Davis', 'emma@example.com');
INSERT INTO Bookings (EventID, ClientID, DateAndTime, NumberOfAttendees) VALUES
(1, 1, '2024-06-15 09:00:00', 20);


SELECT * FROM Venues;
SELECT * FROM Events;
SELECT * FROM Clients;
SELECT * FROM Bookings;
SELECT * FROM Events WHERE EventID = 1;
SELECT * FROM Bookings WHERE EventID = 1;
SELECT * FROM Bookings WHERE ClientID = 1;



UPDATE Venues
SET Capacity = 600
WHERE VenueID = 1;
UPDATE Events
SET Description = 'An updated description for the Annual Conference.'
WHERE EventID = 1;
UPDATE Clients
SET Contact = 'newemail@example.com'
WHERE ClientID = 1;
UPDATE Bookings
SET NumberOfAttendees = 75
WHERE BookingID = 1;


DELETE FROM Venues
WHERE VenueID = 1;
DELETE FROM Events
WHERE EventID = 1;
DELETE FROM Clients
WHERE ClientID = 1;
DELETE FROM Bookings
WHERE BookingID = 1;
