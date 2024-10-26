-- Stored Procedure - Borrowed Books Report
CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        b.Title, 
        bo.FirstName, 
        bo.LastName, 
        l.DateBorrowed 
    FROM 
        Loans l
    JOIN 
        Books b ON l.BookID = b.BookID
    JOIN 
        Borrowers bo ON l.BorrowerID = bo.BorrowerID
    WHERE 
        l.DateBorrowed BETWEEN @StartDate AND @EndDate; 
END;
