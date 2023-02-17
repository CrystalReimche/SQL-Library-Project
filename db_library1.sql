
-- ********** TABLE CREATION ********** --
CREATE DATABASE db_library1;

USE db_library1;


/******************************************************
 * Build our database tables and define ther schema
 ******************************************************/
CREATE TABLE publisher (
	name VARCHAR(100) PRIMARY KEY NOT NULL,
	address VARCHAR(100),
	phone VARCHAR(50)
);

CREATE TABLE borrower (
	cardNo INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	phone VARCHAR(50)
);

CREATE TABLE libraryBranch (
	branchID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	branchName VARCHAR(50) NOT NULL,
	address VARCHAR(100)
);

CREATE TABLE book (
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	title VARCHAR(50) NOT NULL,
	publisherName VARCHAR(100) NOT NULL CONSTRAINT fk_name FOREIGN KEY REFERENCES publisher(name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE bookAuthors (
	bookID INT NOT NULL CONSTRAINT fk_book_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	authorName VARCHAR(50) NOT NULL
);

CREATE TABLE bookCopies (
	bookID INT NOT NULL CONSTRAINT fk_bookCopies_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_libraryBranch_branchID FOREIGN KEY REFERENCES libraryBranch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	noOfCopies INT NOT NULL
);

CREATE TABLE bookLoans (
	bookID INT NOT NULL CONSTRAINT fk_bookLoans_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_branchLoan_branchID FOREIGN KEY REFERENCES libraryBranch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	cardNo INT NOT NULL CONSTRAINT fk_borrower_cardNo FOREIGN KEY REFERENCES borrower(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut DATE NOT NULL,
	dueDate DATE NOT NULL
);


/******************************************************
 * Now that the tables are built, we populate them
 ******************************************************/
INSERT INTO publisher
	(name, address, phone)
	VALUES
	('Scribner', '153-157 Fifth Avenue, New York City 11217', '(212)-632-4915'),
	('HarperCollins', '195 Broadway, New York, NY 10007', '(212) 207-7000'),
	('Algonquin Books of Chapel Hill', '127 Kingston Dr # 105, Chapel Hill, NC 27514', '(919) 967-0108'),
	('Anchor Books', '1745 Broadway, New York, NY 10019', '(212) 940-7390'),
	('CreateSpace', '4900 LaCross Road, North Charleston, SC 29406', '(206) 922-0860'),
	('Crown Publishers', '1745 Broadway, New York, NY 10019', '(212) 782-9000'),
	('DAW Books', '375 Hudson St, New York, NY 10014', '(212) 366-2000'),
	('Del Rey', '375 Hudson St, New York, NY 10014', '(212) 366-2000'),
	('Dover Publications', '31 East 2nd Street Mineola, NY 11501', '(516) 742-6953'),
	('Grand Central Publishing', '1290 Avenue of the Americas, New York, NY10104', '(570) 839-7477'),
	('Harper Collins', '195 Broadway, New York, NY 10007', '(212) 207-7000'),
	('Horizon Publishers', '191 N 650 E, Bountiful, UT 84010', '(801) 292-7102'),
	('Kensington Publishing', '119 W 40th St # 21, New York, NY 10018', '(212) 832-3753'),
	('Knopf Doubleday Publishing Group', '1745 Broadway, New York, NY 10019', '(212) 940-7390'),
	('Little, Brown and Company', '1290 6th Ave, New York, NY 10104', '(212) 364-1100'),
	('Penguin Group', '375 Hudson St, New York, NY 10014', '(212) 366-2000'),
	('St. Martin\''s Press', '175 5th Avenue, New York, NY 10010', '(212) 674-5151'),
	('Tor.com', '175 Fifth Avenue, New York, NY 10010', '(888) 330-8477')
;

INSERT INTO borrower
	(name, address, phone)
	VALUES
	('Honey Moshier', '1 Awesome Street', '(202) 555-0154'),
	('Jacquiline Gothard', '52 Fearless Avenue', '(202) 555-0194'),
	('Elliott Waddle', '746 Bathtub Row', '(202) 555-0122'),
	('Jeannetta Shephard', '2567 My Street', '(202) 555-0179'),
	('Claude Moronta', '89 Digestion Drive', '(202) 555-0101'),
	('Jonas Kinsman', '6 Needless Alley', '(202) 555-0129'),
	('Sumiko Macdonnell', '15 Old Guy Road', '(202) 555-0130'),
	('Matha Conard', '23 Short Cut Road', '(202) 555-0123'),
	('Eddy Schempp', '886 No Name Road', '(202) 555-0184'),
	('Faustina Lizaola', '23 Unexpected Road', '(202) 555-0158'),
	('Sherryl Armond', '94 Chicken Gristle Road', '(202) 555-0163'),
	('Aurelia Hamlett', '52 Shades of Death Road', '(202) 555-0102'),
	('Shantelle Amore', '3 Bad Route Road', '(202) 555-0187'),
	('Edris Mcnally', '36752 Zzyzx Road', '(202) 555-0143'),
	('Tarah Nissen', '894 Lois Lane', '(202) 555-0133'),
	('Ian Soles', '68854 Gasoline Alley', '(202) 555-0137'),
	('Merle Angelo', '4821 English Muffin Way', '(202) 555-0182'),
	('Cordell Griffen', '352 Velveeta Drive', '(202) 555-0199'),
	('Joyce Laman', '4835 Goa Way', '(202) 555-0191'),
	('Sharita Windom', '789 Yellow Brick Road', '(202) 555-0195')
;

INSERT INTO libraryBranch
	(branchName, address)
	VALUES
	('Bozeman', '626 E. Main Street'),
	('Central', '92 Baker Street'),
	('Sharpstown', '6211 Black Mane Way'),
	('Z.J. Loussac', '3600 Denali St')
;

INSERT INTO book
	(title, publisherName)
	VALUES
	('Sing, Unburied, Sing','Scribner'),
	('The Woman Left Behind','HarperCollins'),
	('The Power','Little, Brown and Company'),
	('The Great Alone','St. Martin\''s Press'),
	('A Gentleman in Moscow','Penguin Group'),
	('Pachinko','Grand Central Publishing'),
	('An American Marriage','Algonquin Books of Chapel Hill'),
	('Ready Player One','Crown Publishers'),
	('Homegoing','Knopf Doubleday Publishing Group'),
	('The Wife Between Us','St. Martin\''s Press'),
	('The Name of the Wind','DAW Books'),
	('Age of Myth','Del Rey'),
	('The Way of Kings','Tor.com'),
	('Carrie','Anchor Books'),
	('Misery','Scribner'),
	('The Edge of Lost','Kensington Publishing'),
	('The Price of Salt','Dover Publications'),
	('Unbroken','Penguin Group'),
	('77 Days in September','CreateSpace'),
	('The Lost Tribe','Horizon Publishers')
;

INSERT INTO bookAuthors
	(bookID, authorName)
	VALUES
	(1000, 'Jesmyn Ward'),
	(1001, 'Linda Howard'),
	(1002, 'Naomi Alderman'),
	(1003, 'Kristin Hannah'),
	(1004, 'Amor Towles'),
	(1005, 'Min Jin Lee'),
	(1006, 'Tayari Jones'),
	(1007, 'Ernest Cline'),
	(1008, 'Yaa Gyasi'),
	(1009, 'Greer Hendricks'),
	(1010, 'Patrick Rothfuss'),
	(1011, 'Michael J. Sullivan'),
	(1012, 'Brandon Sanderson'),
	(1013, 'Stephen King'),
	(1014, 'Stephen King'),
	(1015, 'Kristina Mcmorris'),
	(1016, 'Patricia Highsmith'),
	(1017, 'Laura Hillenbrand'),
	(1018, 'Ray Gorham'),
	(1019, 'R. Clayton Brough')
;

INSERT INTO bookCopies
	(bookID, branchID, noOfCopies)
	VALUES
	(1013, 100, 3),
	(1018, 100, 4),
	(1007, 100, 9),
	(1011, 100, 8),
	(1016, 100, 4),
	(1005, 100, 5),
	(1001, 100, 2),
	(1019, 100, 2),
	(1008, 100, 6),
	(1002, 100, 6),
	(1004, 100, 5),
	(1017, 100, 5),
	(1000, 100, 4),
	(1003, 100, 4),
	(1012, 100, 7),
	(1006, 101, 8),
	(1013, 101, 3),
	(1018, 101, 5),
	(1007, 101, 4),
	(1010, 101, 3),
	(1011, 101, 3),
	(1016, 101, 2),
	(1005, 101, 2),
	(1001, 101, 6),
	(1014, 101, 2),
	(1019, 102, 3),
	(1015, 102, 6),
	(1008, 102, 2),
	(1002, 102, 7),
	(1004, 102, 5),
	(1017, 102, 4),
	(1000, 102, 2),
	(1014, 102, 2),
	(1003, 102, 2),
	(1009, 102, 8),
	(1012, 102, 8),
	(1013, 103, 5),
	(1018, 103, 3),
	(1010, 103, 6),
	(1011, 103, 6),
	(1016, 103, 4),
	(1019, 103, 5),
	(1015, 103, 7),
	(1017, 103, 2),
	(1014, 103, 8),
	(1012, 103, 7)
;


INSERT INTO bookLoans
	(bookID, branchID, cardNo, dateOut, dueDate)
	VALUES
	(1018, 100, 5010, '2018-02-01', '2018-02-28'),
	(1007, 100, 5006, '2018-02-01', '2018-02-28'),
	(1011, 100, 5016, '2018-02-05', '2018-03-02'),
	(1016, 100, 5010, '2018-02-05', '2018-03-02'),
	(1005, 100, 5018, '2018-02-10', '2018-03-05'),
	(1019, 100, 5010, '2018-02-15', '2018-03-10'),
	(1008, 100, 5004, '2018-02-15', '2018-03-10'),
	(1002, 100, 5014, '2018-02-01', '2018-02-28'),
	(1004, 100, 5010, '2018-02-10', '2018-03-05'),
	(1000, 100, 5002, '2018-02-05', '2018-03-02'),
	(1003, 100, 5012, '2018-02-15', '2018-03-10'),
	(1012, 100, 5010, '2018-02-05', '2018-03-02'),
	(1006, 101, 5013, '2018-02-20', '2018-03-15'),
	(1006, 101, 5002, '2018-02-15', '2018-03-10'),
	(1013, 101, 5013, '2018-02-01', '2018-02-28'),
	(1013, 101, 5009, '2018-02-10', '2018-03-05'),
	(1018, 101, 5013, '2018-02-20', '2018-03-15'),
	(1007, 101, 5007, '2018-02-05', '2018-03-02'),
	(1007, 101, 5005, '2018-02-28', '2018-03-20'),
	(1011, 101, 5013, '2018-02-20', '2018-03-15'),
	(1016, 101, 5000, '2018-02-10', '2018-03-05'),
	(1001, 101, 5013, '2018-02-15', '2018-03-10'),
	(1014, 101, 5006, '2018-02-05', '2018-03-02'),
	(1014, 101, 5005, '2018-02-20', '2018-03-15'),
	(1019, 102, 5008, '2018-02-15', '2018-03-10'),
	(1019, 102, 5003, '2018-02-01', '2018-02-28'),
	(1015, 102, 5002, '2018-02-28', '2018-03-20'),
	(1008, 102, 5010, '2018-02-10', '2018-03-05'),
	(1008, 102, 5019, '2018-02-05', '2018-03-02'),
	(1008, 102, 5002, '2018-02-28', '2018-03-20'),
	(1002, 102, 5002, '2018-02-15', '2018-03-10'),
	(1004, 102, 5002, '2018-02-01', '2018-02-28'),
	(1017, 102, 5002, '2018-02-28', '2018-03-20'),
	(1014, 102, 5010, '2018-02-28', '2018-03-20'),
	(1003, 102, 5000, '2018-02-05', '2018-03-02'),
	(1013, 103, 5008, '2018-02-28', '2018-03-20'),
	(1013, 103, 5014, '2018-02-10', '2018-03-05'),
	(1018, 103, 5001, '2018-02-15', '2018-03-10'),
	(1010, 103, 5008, '2018-02-01', '2018-02-28'),
	(1016, 103, 5007, '2018-02-20', '2018-03-15'),
	(1016, 103, 5008, '2018-02-20', '2018-03-15'),
	(1015, 103, 5008, '2018-02-15', '2018-03-10'),
	(1012, 103, 5008, '2018-02-10', '2018-03-05'),
	(1013, 103, 5009, '2018-02-28', '2018-03-20'),
	(1018, 103, 5006, '2018-02-05', '2018-03-02'),
	(1018, 103, 5011, '2018-02-10', '2018-03-05'),
	(1011, 103, 5019, '2018-02-20', '2018-03-15'),
	(1015, 103, 5018, '2018-02-05', '2018-03-02'),
	(1017, 103, 5006, '2018-02-15', '2018-03-10'),
	(1017, 103, 5002, '2018-02-10', '2018-03-05')
;

INSERT INTO bookLoans
	(bookID, branchID, cardNo, dateOut, dueDate)
	VALUES
	(1000, 100, 5013, '2018-02-10', '2018-03-05'),
	(1019, 101, 5005, '2018-02-10', '2018-03-05'),
	(1013, 102, 5012, '2018-02-10', '2018-03-05'),
	(1006, 103, 5019, '2018-02-10', '2018-03-05')
;



/******************************************************
 * Stored Procedures
 ******************************************************/
USE db_library1
 
GO

/******************************************************
 * 1. How many copies of the book titled 
 "The Lost Tribe" are owned by the library branch
  whose name is "Sharpstown"?
 ******************************************************/

CREATE PROCEDURE LibraryInformation1
	@title varchar(50),
	@branchName varchar(50)
AS

SELECT title, branchName, noOfCopies
	FROM book
		JOIN bookCopies
			ON book.bookID = bookCopies.bookID
		JOIN libraryBranch
			ON bookCopies.branchID = libraryBranch.branchID
	WHERE title = @title
		AND branchName = @branchName

--  **********  RESULT  **********  --
 EXEC LibraryInformation1 'The Lost Tribe', 'Sharpstown'


 /******************************************************
 * 2. How many copies of the book titled 
 "The Lost Tribe" are owned by each library branch?
 ******************************************************/
CREATE PROCEDURE LibraryInformation2
	@title varchar(50)
AS

SELECT title, branchName, noOfCopies
	FROM book
		JOIN bookCopies
			ON book.bookID = bookCopies.bookID
		JOIN libraryBranch
			ON bookCopies.branchID = libraryBranch.branchID
	WHERE title = @title

--  **********  RESULT  **********  --
EXEC LibraryInformation2 'The Lost Tribe'
 

 /******************************************************
 * 3. Retrieve the names of all borrowers who do not 
 have any books checked out.
 ******************************************************/
CREATE PROCEDURE LibraryInformation3
AS

SELECT *
	FROM borrower
		JOIN bookLoans
			ON borrower.cardNo = bookLoans.cardNo
		JOIN book
			ON bookLoans.bookID = book.bookID
	WHERE borrower.cardNo NOT IN (bookLoans.cardNo)

--  **********  RESULT  **********  --
EXEC LibraryInformation3



/******************************************************
 * 4. For each book that is loaned out from the 
 "Sharpstown" branch and whose DueDate is today, 
 retrieve the book title, the borrower's name, and the 
 borrower's address.
 ******************************************************/
CREATE PROCEDURE LibraryInformation4
	@branchName VARCHAR(50),
	@dueDate DATE
AS

SELECT branchName, title, name, borrower.address, dueDate
	FROM bookLoans
		JOIN libraryBranch
			ON bookLoans.branchID = libraryBranch.branchID
		JOIN borrower
			ON bookLoans.cardNo = borrower.cardNo
		JOIN book
			ON book.bookID = bookLoans.bookID
	WHERE branchName = @branchName
		AND dueDate = @dueDate

--  **********  RESULT  **********  --
EXEC LibraryInformation4 'Sharpstown', '2018-02-19'



/******************************************************
 5. For each library branch, retrieve the branch name 
 and the total number of books loaned out from that 
 branch.
 ******************************************************/
 CREATE PROCEDURE LibraryInformation5
 AS

 SELECT branchName, COUNT(noOfCopies)
	FROM libraryBranch
		JOIN bookCopies
			ON libraryBranch.branchID = bookCopies.branchID
	GROUP BY branchName

--  **********  RESULT  **********  --
EXEC LibraryInformation5



/******************************************************
 6. Retrieve the names, addresses, and number of books 
 checked out for all borrowers who have more than five 
 books checked out.
 ******************************************************/
 CREATE PROCEDURE LibraryInformation6
 AS

 SELECT name, address, COUNT(bookLoans.cardNo) AS 'Book Total'
	FROM borrower
		JOIN bookLoans
			ON borrower.cardNo = bookLoans.cardNo
	GROUP BY name, address
	HAVING COUNT(bookLoans.cardNo) > 5

--  **********  RESULT  **********  --
EXEC LibraryInformation6
*/


/******************************************************
7. For each book authored (or co-authored) by 
"Stephen King", retrieve the title and the number of 
copies owned by the library branch whose name is 
"Central".
 ******************************************************/
 CREATE PROCEDURE LibraryInformation7
	@authorName VARCHAR(50),
	@branchName VARCHAR(50)
 AS

 SELECT title, branchName, COUNT(bookCopies.noOfCopies) AS '# of Copies'
	FROM book
		JOIN bookAuthors
			ON book.bookID = bookAuthors.bookID
		JOIN bookCopies
			ON bookAuthors.bookID = bookCopies.bookID
		JOIN libraryBranch
			ON bookCopies.branchID = libraryBranch.branchID
	WHERE authorName = @authorName
		AND branchName = @branchName
	GROUP BY title, branchName

--  **********  RESULT  **********  --
EXEC LibraryInformation7 'Stephen King', 'Central'




