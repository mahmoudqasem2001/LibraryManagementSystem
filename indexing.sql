-- Indexing Primary Keys
CREATE UNIQUE INDEX idx_Books_BookID ON Books(BookID);
CREATE UNIQUE INDEX idx_Borrowers_BorrowerID ON Borrowers(BorrowerID);
CREATE UNIQUE INDEX idx_Loans_LoanID ON Loans(LoanID);

-- Indexing Foreign Keys
CREATE INDEX idx_Loans_BookID ON Loans(BookID);
CREATE INDEX idx_Loans_BorrowerID ON Loans(BorrowerID);

-- Indexing Columns Used in WHERE Clauses
CREATE INDEX idx_Books_Title ON Books(Title);
CREATE INDEX idx_Books_Author ON Books(Author);
CREATE INDEX idx_Books_ISBN ON Books(ISBN);
CREATE INDEX idx_Books_Genre ON Books(Genre);
CREATE INDEX idx_Borrowers_Email ON Borrowers(Email);
CREATE INDEX idx_Borrowers_DateOfBirth ON Borrowers(DateOfBirth);
CREATE INDEX idx_Loans_DateBorrowed ON Loans(DateBorrowed);
CREATE INDEX idx_Loans_DueDate ON Loans(DueDate);
CREATE INDEX idx_Loans_DateReturned ON Loans(DateReturned);

-- Indexing Composite Keys on Join Models
CREATE INDEX idx_Loans_BookID_BorrowerID ON Loans(BookID, BorrowerID);

-- Indexing Varchar/String Columns Used for Storing State
CREATE INDEX idx_Books_CurrentStatus ON Books(CurrentStatus);

-- Indexing Datetime Columns
CREATE INDEX idx_Books_PublishedDate ON Books(PublishedDate);
CREATE INDEX idx_Borrowers_MembershipDate ON Borrowers(MembershipDate);

-- Indexing All Columns That Will Generate Queries from Model Validations
CREATE INDEX idx_Books_ShelfLocation ON Books(ShelfLocation);


