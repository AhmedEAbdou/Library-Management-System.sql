-- Standalone database creation.
CREATE DATABASE db_librarymanagement;

\c db_librarymanagement;  -- Connect to the new database

/* ======================= TABLES ========================*/

CREATE TABLE tbl_publisher (
    publisher_publishername VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_publisheraddress VARCHAR(200) NOT NULL,
    publisher_publisherphone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book (
    book_bookid SERIAL PRIMARY KEY NOT NULL,
    book_title VARCHAR(100) NOT NULL,
    book_publishername VARCHAR(100) NOT NULL REFERENCES tbl_publisher(publisher_publishername) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_library_branch (
    library_branch_branchid SERIAL PRIMARY KEY NOT NULL,
    library_branch_branchname VARCHAR(100) NOT NULL,
    library_branch_branchaddress VARCHAR(200) NOT NULL
);

CREATE TABLE tbl_borrower (
    borrower_cardno SERIAL PRIMARY KEY NOT NULL,
    borrower_borrowername VARCHAR(100) NOT NULL,
    borrower_borroweraddress VARCHAR(200) NOT NULL,
    borrower_borrowerphone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
    book_loans_loansid SERIAL PRIMARY KEY NOT NULL,
    book_loans_bookid INT NOT NULL REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
    book_loans_branchid INT NOT NULL REFERENCES tbl_library_branch(library_branch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
    book_loans_cardno INT NOT NULL REFERENCES tbl_borrower(borrower_cardno) ON UPDATE CASCADE ON DELETE CASCADE,
    book_loans_dateout DATE NOT NULL,
    book_loans_duedate DATE NOT NULL
);

CREATE TABLE tbl_book_copies (
    book_copies_copiesid SERIAL PRIMARY KEY NOT NULL,
    book_copies_bookid INT NOT NULL REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
    book_copies_branchid INT NOT NULL REFERENCES tbl_library_branch(library_branch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
    book_copies_no_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_authors (
    book_authors_authorid SERIAL PRIMARY KEY NOT NULL,
    book_authors_bookid INT NOT NULL REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
    book_authors_authorname VARCHAR(50) NOT NULL
);

/* View the tables*/

SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_book_authors;

/*==================== POPULATING TABLES ======================*/
INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;

SELECT * FROM tbl_publisher

	INSERT INTO tbl_book
		(book_Title, book_PublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');


SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin'

	INSERT INTO tbl_library_branch
		(library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');


/*UPDATE tbl_library_branch
SET library_branch_branchname = 'Central'
WHERE library_branch_branchid = 2;*/

SELECT * FROM tbl_library_branch

INSERT INTO tbl_borrower
		(borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	
	SELECT * FROM tbl_borrower

INSERT INTO tbl_book_loans
    (book_loans_bookid, book_loans_branchid, book_loans_cardno, book_loans_dateout, book_loans_duedate)
VALUES
    (1,1,100,'2018-01-01','2018-02-02'),
    (2,1,100,'2018-01-01','2018-02-02'),
    (3,1,100,'2018-01-01','2018-02-02'),
    (4,1,100,'2018-01-01','2018-02-02'),
    (5,1,102,'2018-01-03','2018-02-03'),
    (6,1,102,'2018-01-03','2018-02-03'),
    (7,1,102,'2018-01-03','2018-02-03'),
    (8,1,102,'2018-01-03','2018-02-03'),
    (9,1,102,'2018-01-03','2018-02-03'),
    (11,1,102,'2018-01-03','2018-02-03'),
    (12,2,105,'2017-12-12','2018-01-12'),
    (10,2,105,'2017-12-12','2017-01-12'),
    (20,2,105,'2018-02-03','2018-03-03'),
    (18,2,105,'2018-01-05','2018-02-05'),
    (19,2,105,'2018-01-05','2018-02-05'),
    (19,2,100,'2018-01-03','2018-02-03'),
    (11,2,106,'2018-01-07','2018-02-07'),
    (1,2,106,'2018-01-07','2018-02-07'),
    (2,2,100,'2018-01-07','2018-02-07'),
    (3,2,100,'2018-01-07','2018-02-07'),
    (5,2,105,'2017-12-12','2018-01-12'),
    (4,3,103,'2018-01-09','2018-02-09'),
    (7,3,102,'2018-01-03','2018-02-03'),
    (17,3,102,'2018-01-03','2018-02-03'),
    (16,3,104,'2018-01-03','2018-02-03'),
    (15,3,104,'2018-01-03','2018-02-03'),
    (15,3,107,'2018-01-03','2018-02-03'),
    (14,3,104,'2018-01-03','2018-02-03'),
    (13,3,107,'2018-01-03','2018-02-03'),
    (13,3,102,'2018-01-03','2018-02-03'),
    (19,3,102,'2017-12-12','2018-01-12'),
    (20,4,103,'2018-01-03','2018-02-03'),
    (1,4,102,'2018-01-12','2018-02-12'),
    (3,4,107,'2018-01-03','2018-02-03'),
    (18,4,107,'2018-01-03','2018-02-03'),
    (12,4,102,'2018-01-04','2018-02-04'),
    (11,4,103,'2018-01-15','2018-02-15'),
    (9,4,103,'2018-01-15','2018-02-15'),
    (7,4,107,'2018-01-19','2018-02-19'),
    (4,4,103,'2018-01-19','2018-02-19'),
    (1,4,103,'2017-02-02','2018-03-02'),
    (20,4,103,'2018-01-03','2018-02-03'),
    (1,4,102,'2018-01-12','2018-02-12'),
    (3,4,107,'2018-01-13','2018-02-13'),
    (18,4,107,'2018-01-13','2018-02-13'),
    (12,4,102,'2018-01-14','2018-02-14'),
    (11,4,103,'2018-01-15','2018-02-15'),
    (9,4,103,'2018-01-15','2018-02-15'),
    (7,4,107,'2018-01-19','2018-02-19'),
    (4,4,103,'2018-01-19','2018-02-19'),
    (1,4,103,'2018-01-22','2018-02-22');


	
	SELECT * FROM tbl_book_loans

	INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');

	SELECT * FROM tbl_book_copies
 

	INSERT INTO tbl_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');

	SELECT * FROM tbl_book_authors
END
	/*============================== END POPULATING TABLES ==============================*/


     /* =================== STORED PROCEDURE QUERY QUESTIONS =================================== */

/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

CREATE OR REPLACE FUNCTION bookCopiesAtAllSharpstown(
    bookTitle VARCHAR(70) DEFAULT 'The Lost Tribe', 
    branchName VARCHAR(70) DEFAULT 'Sharpstown'
)
RETURNS TABLE (
    BranchID INT, 
    BranchName VARCHAR(70), 
    NumberOfCopies INT,
    BookTitle VARCHAR(70)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        copies.book_copies_branchid AS BranchID,
        branch.library_branch_branchname AS BranchName,
        copies.book_copies_no_of_copies AS NumberOfCopies,
        book.book_title AS BookTitle
    FROM 
        tbl_book_copies AS copies
    INNER JOIN 
        tbl_book AS book ON copies.book_copies_bookid = book.book_bookid
    INNER JOIN 
        tbl_library_branch AS branch ON copies.book_copies_branchid = branch.library_branch_branchid
    WHERE 
        book.book_title = bookTitle AND branch.library_branch_branchname = branchName;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM bookCopiesAtAllSharpstown();



/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

CREATE OR REPLACE FUNCTION bookCopiesAtAllBranches(
    p_bookTitle VARCHAR(70) DEFAULT 'The Lost Tribe'
)
RETURNS TABLE (
    BranchID INT, 
    BranchName VARCHAR(70), 
    NumberOfCopies INT,
    BookTitle VARCHAR(70)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        copies.book_copies_branchid AS BranchID,
        branch.library_branch_branchname AS BranchName,
        copies.book_copies_no_of_copies AS NumberOfCopies,
        book.book_title AS BookTitle
    FROM 
        tbl_book_copies AS copies
    INNER JOIN 
        tbl_book AS book ON copies.book_copies_bookid = book.book_bookid
    INNER JOIN 
        tbl_library_branch AS branch ON copies.book_copies_branchid = branch.library_branch_branchid
    WHERE 
        book.book_title = p_bookTitle;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM bookCopiesAtAllBranches();


/* #3- Retrieve the names of all borrowers who do not have any books checked out. */

CREATE OR REPLACE FUNCTION NoLoans()
RETURNS TABLE (
    BorrowerName VARCHAR(100)
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT borrower_borrowername 
    FROM tbl_borrower
    WHERE NOT EXISTS (
        SELECT 1 FROM tbl_book_loans
        WHERE book_loans_cardno = borrower_cardno
    );
END;
$$ LANGUAGE plpgsql;

SELECT * FROM NoLoans();



/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */

CREATE OR REPLACE FUNCTION LoanersInfo(
    p_DueDate DATE DEFAULT CURRENT_DATE, 
    p_LibraryBranchName VARCHAR(50) DEFAULT 'Sharpstown'
)
RETURNS TABLE (
    BranchName VARCHAR(100),
    BookName VARCHAR(100),
    BorrowerName VARCHAR(100),
    BorrowerAddress VARCHAR(200),
    DateOut DATE,
    DueDate DATE
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        branch.library_branch_branchname AS BranchName, 
        book.book_title AS BookName,
        borrower.borrower_borrowername AS BorrowerName, 
        borrower.borrower_borroweraddress AS BorrowerAddress,
        loans.book_loans_dateout AS DateOut, 
        loans.book_loans_duedate AS DueDate
    FROM 
        tbl_book_loans AS loans
    INNER JOIN 
        tbl_book AS book ON loans.book_loans_bookid = book.book_bookid
    INNER JOIN 
        tbl_borrower AS borrower ON loans.book_loans_cardno = borrower.borrower_cardno
    INNER JOIN 
        tbl_library_branch AS branch ON loans.book_loans_branchid = branch.library_branch_branchid
    WHERE 
        loans.book_loans_duedate = p_DueDate AND branch.library_branch_branchname = p_LibraryBranchName;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM LoanersInfo();

/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

CREATE OR REPLACE FUNCTION TotalLoansPerBranch()
RETURNS TABLE (
    BranchName VARCHAR(100),
    TotalLoans INT
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        branch.library_branch_branchname AS BranchName, 
        COUNT(loans.book_loans_branchid) AS TotalLoans
    FROM 
        tbl_book_loans AS loans
    INNER JOIN 
        tbl_library_branch AS branch ON loans.book_loans_branchid = branch.library_branch_branchid
    GROUP BY 
        branch.library_branch_branchname;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM TotalLoansPerBranch();


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */


CREATE OR REPLACE FUNCTION BooksLoanedOut(
    p_BooksCheckedOut INT DEFAULT 5
)
RETURNS TABLE (
    BorrowerName VARCHAR(100),
    BorrowerAddress VARCHAR(200),
    BooksCheckedOut INT
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        borrower.borrower_borrowername AS BorrowerName, 
        borrower.borrower_borroweraddress AS BorrowerAddress,
        COUNT(borrower.borrower_borrowername) AS BooksCheckedOut
    FROM 
        tbl_book_loans AS loans
    INNER JOIN 
        tbl_borrower AS borrower ON loans.book_loans_cardno = borrower.borrower_cardno
    GROUP BY 
        borrower.borrower_borrowername, borrower.borrower_borroweraddress
    HAVING 
        COUNT(borrower.borrower_borrowername) >= p_BooksCheckedOut;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM BooksLoanedOut();


/* #7- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

CREATE OR REPLACE FUNCTION BookbyAuthorandBranch(
    p_BranchName VARCHAR(50) DEFAULT 'Central', 
    p_AuthorName VARCHAR(50) DEFAULT 'Stephen King'
)
RETURNS TABLE (
    BranchName VARCHAR(100),
    Title VARCHAR(100),
    NumberOfCopies INT
)
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        branch.library_branch_branchname AS BranchName, 
        book.book_title AS Title, 
        copies.book_copies_no_of_copies AS NumberOfCopies
    FROM 
        tbl_book_authors AS authors
    INNER JOIN 
        tbl_book AS book ON authors.book_authors_bookid = book.book_bookid
    INNER JOIN 
        tbl_book_copies AS copies ON authors.book_authors_bookid = copies.book_copies_bookid
    INNER JOIN 
        tbl_library_branch AS branch ON copies.book_copies_branchid = branch.library_branch_branchid
    WHERE 
        branch.library_branch_branchname = p_BranchName AND authors.book_authors_authorname = p_AuthorName;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM BookbyAuthorandBranch();


/* ==================================== STORED PROCEDURE QUERY QUESTIONS =================================== */



