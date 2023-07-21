# Library Management System Database
This PostgreSQL database, named db_librarymanagement, manages the operations of a library system, including details about books, branches, publishers, authors, borrowers, and loans.

## Tables
tbl_publisher: Publisher details (name, address, phone number)
tbl_book: Book details (ID, title, publisher name)
tbl_library_branch: Library branch details (ID, name, address)
tbl_borrower: Borrower details (card number, name, address, phone number)
tbl_book_loans: Loan details (loan ID, book ID, branch ID, card number, date out, due date)
tbl_book_copies: Details on the number of copies of each book at each branch
tbl_book_authors: Author details (author ID, book ID, author name)
## Stored Procedures
This project also includes several stored procedures for retrieving specific pieces of data:

bookCopiesAtAllSharpstown(): Returns the number of copies of a specific book at the Sharpstown branch.
bookCopiesAtAllBranches(): Returns the number of copies of a specific book at each library branch.
NoLoans(): Retrieves the names of all borrowers who do not have any books checked out.
LoanersInfo(): For each book loaned out from a specific branch with the due date of today, it retrieves the book title, borrower's name, and borrower's address.
TotalLoansPerBranch(): Retrieves the total number of books loaned out from each library branch.
BooksLoanedOut(): Retrieves the names, addresses, and the number of books checked out for all borrowers who have checked out more than a specific number of books.
BookbyAuthorandBranch(): For each book authored by a specific author, it retrieves the title and the number of copies owned by a specific library branch.
