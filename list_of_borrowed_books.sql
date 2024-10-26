-- List of Borrowed Books
SELECT 
    b.Title, 
    b.Author, 
    bo.FirstName, 
    bo.LastName, 
    l.DateBorrowed, 
    l.DueDate 
FROM 
    Loans l
JOIN 
    Books b ON l.BookID = b.BookID
JOIN 
    Borrowers bo ON l.BorrowerID = bo.BorrowerID
WHERE 
    l.DateReturned IS NULL; 
