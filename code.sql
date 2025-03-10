create database ott;
use ott;
-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    EndDate DATE
);

-- Subscriptions table
CREATE TABLE Subscriptions (
    SubscribeID INT PRIMARY KEY,
    UserID INT,
    Type VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Payments table
CREATE TABLE Payments (
    PayID INT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    SubscribeID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SubscribeID) REFERENCES Subscriptions(SubscribeID)
);

-- Contents table
CREATE TABLE Contents (
    ContentID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseDate DATE,
    Type VARCHAR(50),
    Genre VARCHAR(100)
);

-- Views table
CREATE TABLE Views (
    ViewID INT PRIMARY KEY,
UserID INT,
    ContentID INT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ContentID) REFERENCES Contents(ContentID)
);

-- Ratings table
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    UserID INT,
    ContentID INT,
    Rating INT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ContentID) REFERENCES Contents(ContentID)
);

-- Awards table
CREATE TABLE Awards (
    AwardID INT PRIMARY KEY,
    ContentID INT,
    AwardName VARCHAR(255),
    Year INT,
    FOREIGN KEY (ContentID) REFERENCES Contents(ContentID)
);

-- Subtitles table
CREATE TABLE Subtitles (
    SubtitleID INT PRIMARY KEY,
    ContentID INT,
    NoOfLanguages INT,
    English BOOL,
    Hindi BOOL,
    Tamil BOOL,
    Telugu BOOL,
    FOREIGN KEY (ContentID) REFERENCES Contents(ContentID)
);

-- For_Content table
CREATE TABLE ForContent (
    PayID INT,
    ContentID INT,
    PRIMARY KEY (PayID, ContentID),
FOREIGN KEY (PayID) REFERENCES Payments(PayID),
    FOREIGN KEY (ContentID) REFERENCES Contents(ContentID)
);
--INSERTING VALUES 
--1)	Users
INSERT INTO Users (UserID, Username, Email, Password, EndDate)
VALUES
    (10045, 'Rayudu', 'Rayudu@gmail.com', 'password123', '2021-12-31'),
    (12342, 'Hrushik', 'hru@gmail.com', 'password456', '2022-06-30'),
    (10123, 'Alekhya', 'Alu_1@gmail.com', 'password789', '2022-10-15'),
    (77777, 'Krishna', 'Krish@gmail.com', 'password321', '2021-08-20'),
  (54321, 'Aishwarya', 'Aish@gmail.com', 'password654', '2022-09-25'),
   (98765, 'Shreya', 'Shrey@gmail.com', 'password987', '2021-01-10'),
   (24680, 'Vaishnavi', 'Vaish@gmail.com', 'password126', '2022-12-05'),
    (11111, 'Karthik', 'Karti@gmail.com', 'password789', '2022-04-30'),
    (88888, 'Deekshith', 'dee@gmail.com', 'password956', '2021-03-15'),
    (55555, 'Virat', 'viru@gmail.com', 'password763', '2022-11-20'),
    (22222, 'sakshi', 'sa1234@gmail.com', 'password906', '2021-02-25'),
    (99999, 'Rithika', 'Rith@gmail.com', 'password999', '2022-07-10'),
    (44444, 'vikram', 'viky@gmail.com', 'password543', '2022-08-15'),
    (77799, 'kaushal', 'kau@gmail.com', 'password232', '2021-05-30'),
    (33333, 'vedika', 'vedh@gmail.com', 'password781', '2021-09-05');


-- 2)	Subscriptions 
INSERT INTO Subscriptions (SubscribeID, UserID, Type, StartDate, EndDate)
VALUES
    (12258, 10045, 'Premium', '2020-01-01', '2021-12-31'),
    (138492, 12342, 'Basic', '2022-01-30', '2022-06-30'),
    (980124, 10123, 'Super', '2022-01-15', '2022-10-15'),
    (25081, 77777, 'Premium', '2020-08-20', '2021-08-20'),
    (14582, 54321, 'Basic', '2022-03-15', '2022-09-25'),
    (98632, 98765, 'Premium', '2020-01-10', '2021-01-10'),
    (36512, 24680, 'Super', '2022-06-05', '2022-12-05'),
    (75492, 11111, 'Basic', '2021-10-30', '2022-04-30'),
   (25417, 88888, 'Premium', '2020-03-15', '2021-03-15'),
    (12039, 55555, 'Basic', '2022-05-20', '2022-11-20'),
    (93621, 22222, 'Premium', '2020-02-25', '2021-02-25'),
    (75432, 99999, 'Super', '2022-01-10', '2022-07-10'),
    (15874, 44444, 'Basic', '2022-02-15', '2022-08-15'),
    (33659, 77799, 'Premium', '2020-05-30', '2021-05-30'),
    (57234, 33333, 'Super', '2021-03-05', '2021-09-05');

--3)	Payments 
INSERT INTO Payments (PayID, UserID, Amount, PaymentDate, SubscribeID)
VALUES
    (122, 10045, 1725.00, '2020-01-01', 12258),
    (123, 12342, 999.00, '2022-01-30', 138492),
    (124, 10123, 1250.00, '2022-01-15', 980124),
    (125, 77777, 1725.00, '2020-08-20', 25081),
    (126, 54321, 999.00, '2022-03-15', 14582),
    (127, 98765, 1725.00, '2020-01-10', 98632),
    (128, 24680, 1250.00, '2022-06-05', 36512),
    (129, 11111, 999.00, '2021-10-30', 75492),
    (130, 88888, 1725.00, '2020-03-15', 25417),
    (131, 55555, 999.00, '2022-05-20', 12039),
    (132, 22222, 1725.00, '2020-02-25', 93621),
    (133, 99999, 1250.00, '2022-01-10', 75432),
    (134, 44444, 999.00, '2022-02-15', 15874),
    (135, 77799, 1725.00, '2020-05-30', 33659),
    (136, 33333, 1250.00, '2021-03-05', 57234);

--4)	Contents 
INSERT INTO Contents (ContentID, Title, ReleaseDate, Type, Genre)
VALUES
    (13910, 'The Matrix', '1999-03-31', 'Movie', 'Sci-Fi'),
    (13911, 'Breaking Bad', '2008-01-20', 'TV Show', 'Drama'),
    (13912, 'The Shawshank Redemption', '1994-09-23', 'Movie', 'Drama'),
    (13913, 'Friends', '1994-09-22', 'TV Show', 'Comedy'),
    (13914, 'The Godfather', '1972-03-24', 'Movie', 'Crime'),
    (13915, 'Stranger Things', '2016-07-15', 'TV Show', 'Sci-Fi'),
    (13916, 'Inception', '2010-07-16', 'Movie', 'Action'),
    (13917, 'Game of Thrones', '2011-04-17', 'TV Show', 'Fantasy'),
    (13918, 'Pulp Fiction', '1994-10-14', 'Movie', 'Crime'),
    (13919, 'The Office', '2005-03-24', 'TV Show', 'Comedy'),
    (13920, 'The Dark Knight', '2008-07-18', 'Movie', 'Action'),
    (13921, 'Breaking Bad', '2008-01-20', 'TV Show', 'Drama'),
    (13922, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 'Movie', 'Adventure'),
    (13923, 'The Crown', '2016-11-04', 'TV Show', 'Drama'),
    (13924, 'Forrest Gump', '1994-07-06', 'Movie', 'Drama');

--5)	Awards
INSERT INTO Awards (AwardID, ContentID, AwardName, Year)
VALUES
    (1001, 13910, 'Best Visual Effects', 2000),
    (1002, 13914, 'Best Picture', 1973),
    (1003, 13916, 'Best Cinematography', 2011),
    (1004, 13917, 'Best Drama Series', 2015),
    (1005, 13920, 'Best Supporting Actor', 2009),
    (1006, 13922, 'Best Visual Effects', 2002),
    (1007, 13924, 'Best Actor', 1995),
    (1008, 13911, 'Best Drama Series', 2013),
    (1009, 13913, 'Best Comedy Series', 2002),
    (1010, 13915, 'Best Ensemble Cast', 2017),
    (1011, 13919, 'Best Comedy Series', 2006),
    (1012, 13921, 'Best Actor', 2010),
    (1013, 13923, 'Best Drama Series', 2018),
    (1014, 13912, 'Best Picture', 1995),
    (1015, 13918, 'Best Original Screenplay', 1995);

-- 6)	Views
INSERT INTO Views (ViewID, UserID, ContentID, Timestamp)
VALUES
    (1001, 10045, 13910, '2021-05-01 08:30:00'),
    (1002, 12342, 13914, '2022-04-15 12:45:00'),
    (1003, 10123, 13913, '2022-07-20 17:20:00'),
    (1004, 77777, 13920, '2020-10-09 19:10:00'),
    (1005, 54321, 13912, '2022-07-15 22:55:00'),
    (1006, 98765, 13921, '2020-02-01 14:30:00'),
    (1007, 24680, 13916, '2022-08-20 09:40:00'),
    (1008, 11111, 13923, '2022-03-30 16:25:00'),
    (1009, 88888, 13915, '2020-04-15 11:15:00'),
    (1010, 55555, 13919, '2022-09-09 20:05:00'),
    (1011, 22222, 13922, '2020-03-14 18:00:00'),
    (1012, 99999, 13911, '2022-01-27 13:10:00'),
    (1013, 44444, 13918, '2022-08-03 10:20:00'),
    (1014, 77799, 13917, '2020-06-01 14:50:00'),
    (1015, 33333, 13924, '2021-09-05 16:35:00');

--7)	Subtitles
INSERT INTO Subtitles (SubtitleID, ContentID, NoOfLanguages, English, Hindi, Tamil, Telugu)
VALUES
    (1, 13910, 3, TRUE,TRUE, FALSE, TRUE),
    (2, 13911, 2, TRUE, TRUE, FALSE, FALSE),
    (3, 13912, 1, TRUE, FALSE, FALSE, FALSE),
    (4, 13913, 3, TRUE, TRUE, FALSE, TRUE),
    (5, 13914, 3, TRUE, TRUE, TRUE, FALSE),
    (6,  13915, 4, TRUE, TRUE, TRUE, TRUE),
    (7,  13916, 2, TRUE, FALSE, TRUE, FALSE),
    (8,  13917, 3, TRUE, TRUE, TRUE, FALSE),
    (9, 13918 , 4, TRUE, TRUE, TRUE, TRUE),
    (10,  13919, 3, TRUE, FALSE, TRUE, TRUE),
    (11, 13920,  2, TRUE, FALSE, FALSE, TRUE),
    (12, 13921, 2, TRUE, FALSE, TRUE, FALSE),
    (13, 13922, 4, TRUE, TRUE, TRUE, TRUE),
    (14, 13923, 3, TRUE, TRUE, TRUE, FALSE),
    (15, 13924, 2, TRUE, TRUE, FALSE, FALSE);

--8)	Ratings
INSERT INTO Ratings (RatingID, UserID, ContentID, Rating, Timestamp)
VALUES
    (1, 10045, 13910, 4, '2020-01-25 12:45:00'),
    (2, 12342,13911 , 5, '2022-06-21 09:30:00'),
    (3, 10123,13912 , 5, '2022-09-26 14:20:00'),
    (4, 77777,13913 , 3, '2021-02-10 10:00:00'),
    (5, 54321,13914 , 4, '2022-07-25 16:30:00'),
    (6, 98765,13915 , 5, '2020-07-15 11:45:00'),
    (7, 24680, 13916, 4, '2022-12-01 08:15:00'),
    (8, 11111,13917 , 3, '2021-10-30 14:00:00'),
    (9, 88888, 13918, 5, '2020-03-25 17:00:00'),
    (10, 55555, 13919, 4, '2023-11-01 20:30:00'),
    (11, 22222,  13920, 2,'2020-09-25 13:45:00'),
    (12, 99999, 13921, 3, '2022-07-06 09:00:00'),
    (13, 44444,13922 , 4, '2022-06-30 11:20:00'),
    (14, 77799,13923 , 5, '2021-04-15 18:45:00'),
    (15, 33333,13924 , 5, '2021-03-25 12:00:00');
    
--9)	ForContent
INSERT INTO ForContent (PayID, ContentID)
VALUES
    (122, 13910),
    (123, 13914),
    (124, 13913),
    (125, 13920),
    (126, 13912),
    (127, 13921),
    (128, 13916),
    (129, 13923),
    (130, 13915),
    (131, 13919),
    (132, 13922),
    (133, 13911),
    (134, 13918),
    (135, 13917),
    (136, 13924);



 