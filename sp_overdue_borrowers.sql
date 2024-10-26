-- SQL Stored Procedure with Temp Table
CREATE PROCEDURE sp_OverdueBorrowers
AS
BEGIN
    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT,
        FirstName NVARCHAR(100),
        LastName NVARCHAR(100)
    );

    INSERT INTO #OverdueBorrowers (BorrowerID, FirstName, LastName)
    SELECT 
        bo.BorrowerID, 
        bo.FirstName, 
        bo.LastName
    FROM 
        Borrowers bo
    JOIN 
        Loans l ON bo.BorrowerID = l.BorrowerID
    WHERE 
        l.DateReturned IS NULL AND 
        l.DueDate < GETDATE(); -- Overdue books

    SELECT 
        ob.BorrowerID, 
        ob.FirstName, 
        ob.LastName, 
        b.Title 
    FROM 
        #OverdueBorrowers ob
    JOIN 
        Loans l ON ob.BorrowerID = l.BorrowerID
    JOIN 
        Books b ON l.BookID = b.BookID;

    DROP TABLE #OverdueBorrowers; -- Cleanup
END;
