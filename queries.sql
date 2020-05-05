use Chinook;


-- List all Artists, Albums & Tracks in the Grunge playlist

Select Playlist.Name as Playlist, Track.Name as Track, Album.Title as Album, Artist.Name as Artist
From Playlist
Inner Join PlaylistTrack 
 on Playlist.PlaylistId = PlaylistTrack.PlaylistId
Inner Join Track on Track.TrackId = PlaylistTrack.TrackId
Inner Join Album on Album.AlbumId = Track.AlbumId
Inner Join Artist on Artist.ArtistId = Album.ArtistId
Where Playlist.Name = 'Grunge'
Order By Artist.Name, Album.Title, Track.Name
;


select * from Track;

SELECT Playlist.Name as Playlist, COUNT(*) 
From Playlist 
INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  
GROUP BY Playlist HAVING count(*) = 1
;

use Chinook;
SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge'
;

SELECT InvoiceDate, BillingAddress, Total
	FROM Invoice 
	Order by InvoiceDate Desc; 
 

Select EmployeeId, LastName, FirstName, HireDate
FROM Employee
Order by HireDate desc, EmployeeID desc
Limit 4;

SELECT  concat(Customer.FirstName, " ", Customer.LastName) as Name,
		Invoice.InvoiceDate as Date, 
        Invoice.Total as Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerID = Customer.CustomerID
ORDER BY Invoice.Total DESC, Invoice.InvoiceDate DESC
LIMIT 10;

SELECT COUNT(*) 
FROM Customer
WHERE Customer.SupportRepID = '4';

SELECT Customer.FirstName, Customer.LastName, Customer.SupportRepId, Employee.FirstName as "Support Red FirstName",  Employee.LastName as "Support Rep Last Name"
FROM Customer
INNER JOIN Employee ON EmployeeId = SupportRepId
WHERE Customer.SupportRepId= '4'
ORDER BY LastName, FirstName;


SELECT count(*)
FROM Customer
INNER JOIN Employee ON EmployeeId = SupportRepId
WHERE Employee.FirstName = 'Jane' AND Employee.LastName = 'Peacock';
-- Jane Peacock = Employee ID 3

Select count(*) from Customer where SupportRepID = 3;

SELECT Employee.FirstName AS Employee, 
	COUNT(Customer.FirstName) AS Customer 
FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

SELECT MediaType.Name, COUNT(Track.MediaTypeId) 
FROM Track
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeID
WHERE MediaType.MediaTypeId = 4;

SELECT MIN(Employee.BirthDate)
FROM Employee;


SELECT MAX(Employee.HireDate) 
FROM Employee;

SELECT AVG(Total) FROM Invoice;


SELECT ROUND(AVG(Total), 2) FROM Invoice;


SELECT TOTAL FROM Invoice
WHERE InvoiceId = 2;

SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine
WHERE InvoiceId = 2;




SELECT COUNT(*) FROM  Track
GROUP BY AlbumId;

SELECT AlbumId, COUNT(*) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, COUNT(*) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;



SELECT AlbumId, MIN(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, MAX(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, ROUND(SUM(UnitPrice), 2) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, ROUND(SUM(UnitPrice), 2) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;



SELECT Customer.City, COUNT(Customer.City)
FROM Customer
WHERE Customer.City = 'Berlin';



SELECT Track.Name AS 'TrackName', 
	COUNT(InvoiceLine.TrackId) AS  'Number Purchased', 
    SUM(InvoiceLine.UnitPrice) AS 'Purchase Total Amount' 
FROM InvoiceLine
INNER JOIN Track ON InvoiceLine.TrackId = Track.TrackId
-- WHERE Track.Name = 'The Woman King'
GROUP BY InvoiceLine.TrackId
;



SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";



SELECT Artist.Name AS "Artist Name" , COUNT(Track.TrackId) as TrackCount
FROM Track
INNER JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY TrackCount DESC, Artist.Name ASC
LIMIT 5;


SELECT Artist.Name AS Artist, COUNT(Track.TrackId) AS Track FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name) DESC 
LIMIT  5;
;



/*
Create a dummy `MediaType`
*/
INSERT INTO MediaType (Name)
VALUES ("Test Media 1");

/*
Create a new `Album` record with a name of "Boy" and an
ArtistId of 150. This ArtistId is for U2
*/
INSERT INTO Album (Title, ArtistId)
VALUES ("Boy", 150);

/*
Get all of the relevant information that we need to enter all of
tracks for U2's "Boy" album
*/
SELECT AlbumId FROM Album WHERE Title = "Boy";

SELECT MediaTypeId FROM MediaType WHERE Name = "Protected AAC audio file";

SELECT GenreId FROM Genre WHERE Name = "Rock";

/*
Use the above information to create the new tracks
*/
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES ("I Will Follow", 348, 2, 1, "U2", 220000, 1234, 0.99);

select * from track where name = "I Will Follow";
select * from track where albumid = 348;

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Stories for Boys", 348, 2, 1, "U2", 150000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("The Ocean", 348, 2, 1, "U2", 175000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("A Day Without Me", 348, 2, 1, "U2", 185000, 1234, 0.99);


Insert into Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
values("Extra Track", 348, 2, 1, "U2", 290000, 1234, 0.99);

 INSERT INTO Track
    (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
    ("Another Time, Another Place", 348, 2, 1, "U2", 210000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 200000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 150000, 1234, 0.99);

select * from track where albumid = 348;use Chinook;
select * from Track;

SELECT Playlist.Name as Playlist, COUNT(*) 
From Playlist 
INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  
GROUP BY Playlist HAVING count(*) = 1
;

use Chinook;
SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge'
;

SELECT InvoiceDate, BillingAddress, Total
	FROM Invoice 
	Order by InvoiceDate Desc; 
 

Select EmployeeId, LastName, FirstName, HireDate
FROM Employee
Order by HireDate desc, EmployeeID desc
Limit 4;

SELECT  concat(Customer.FirstName, " ", Customer.LastName) as Name,
		Invoice.InvoiceDate as Date, 
        Invoice.Total as Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerID = Customer.CustomerID
ORDER BY Invoice.Total DESC, Invoice.InvoiceDate DESC
LIMIT 10;

SELECT COUNT(*) 
FROM Customer
WHERE Customer.SupportRepID = '4';

SELECT Customer.FirstName, Customer.LastName, Customer.SupportRepId, Employee.FirstName as "Support Red FirstName",  Employee.LastName as "Support Rep Last Name"
FROM Customer
INNER JOIN Employee ON EmployeeId = SupportRepId
WHERE Customer.SupportRepId= '4'
ORDER BY LastName, FirstName;


SELECT count(*)
FROM Customer
INNER JOIN Employee ON EmployeeId = SupportRepId
WHERE Employee.FirstName = 'Jane' AND Employee.LastName = 'Peacock';
-- Jane Peacock = Employee ID 3

Select count(*) from Customer where SupportRepID = 3;

SELECT Employee.FirstName AS Employee, 
	COUNT(Customer.FirstName) AS Customer 
FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

SELECT MediaType.Name, COUNT(Track.MediaTypeId) 
FROM Track
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeID
WHERE MediaType.MediaTypeId = 4;

SELECT MIN(Employee.BirthDate)
FROM Employee;


SELECT MAX(Employee.HireDate) 
FROM Employee;

SELECT AVG(Total) FROM Invoice;


SELECT ROUND(AVG(Total), 2) FROM Invoice;


SELECT TOTAL FROM Invoice
WHERE InvoiceId = 2;

SELECT SUM(UnitPrice * Quantity) FROM InvoiceLine
WHERE InvoiceId = 2;




SELECT COUNT(*) FROM  Track
GROUP BY AlbumId;

SELECT AlbumId, COUNT(*) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, COUNT(*) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;



SELECT AlbumId, MIN(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, MAX(UnitPrice) FROM Track
GROUP BY AlbumId;

SELECT AlbumId, ROUND(SUM(UnitPrice), 2) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, ROUND(SUM(UnitPrice), 2) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;



SELECT Customer.City, COUNT(Customer.City)
FROM Customer
WHERE Customer.City = 'Berlin';



SELECT Track.Name AS 'TrackName', 
	COUNT(InvoiceLine.TrackId) AS  'Number Purchased', 
    SUM(InvoiceLine.UnitPrice) AS 'Purchase Total Amount' 
FROM InvoiceLine
INNER JOIN Track ON InvoiceLine.TrackId = Track.TrackId
-- WHERE Track.Name = 'The Woman King'
GROUP BY InvoiceLine.TrackId
;



SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";



SELECT Artist.Name AS "Artist Name" , COUNT(Track.TrackId) as TrackCount
FROM Track
INNER JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY TrackCount DESC, Artist.Name ASC
LIMIT 5;


SELECT Artist.Name AS Artist, COUNT(Track.TrackId) AS Track FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name) DESC 
LIMIT  5;
;



/*
Create a dummy `MediaType`
*/
INSERT INTO MediaType (Name)
VALUES ("Test Media 1");

/*
Create a new `Album` record with a name of "Boy" and an
ArtistId of 150. This ArtistId is for U2
*/
INSERT INTO Album (Title, ArtistId)
VALUES ("Boy", 150);

/*
Get all of the relevant information that we need to enter all of
tracks for U2's "Boy" album
*/
SELECT AlbumId FROM Album WHERE Title = "Boy";

SELECT MediaTypeId FROM MediaType WHERE Name = "Protected AAC audio file";

SELECT GenreId FROM Genre WHERE Name = "Rock";

/*
Use the above information to create the new tracks
*/
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES ("I Will Follow", 348, 2, 1, "U2", 220000, 1234, 0.99);

select * from track where name = "I Will Follow";
select * from track where albumid = 348;

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Stories for Boys", 348, 2, 1, "U2", 150000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("The Ocean", 348, 2, 1, "U2", 175000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("A Day Without Me", 348, 2, 1, "U2", 185000, 1234, 0.99);


Insert into Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
values("Extra Track", 348, 2, 1, "U2", 290000, 1234, 0.99);

 INSERT INTO Track
    (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
    ("Another Time, Another Place", 348, 2, 1, "U2", 210000, 1234, 0.99),
    ("The Electric Co.", 348, 2, 1, "U2", 200000, 1234, 0.99),
    ("Shadows and Tall Trees", 348, 2, 1, "U2", 150000, 1234, 0.99);

select * from track where albumid = 348;

CREATE TABLE IF NOT EXISTS
    Friends(name char(20), age int, DOB datetime);
    
