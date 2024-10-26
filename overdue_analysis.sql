-- Overdue Analysis
SELECT 
    b.Title, 
    bo.FirstName, 
    bo.LastName, 
    DATEDIFF(DAY, l.DueDate, GETDATE()) AS OverdueDays 
FROM 
    Loans l
JOIN 
    Books b ON l.BookID = b.BookID
JOIN 
    Borrowers bo ON l.BorrowerID = bo.BorrowerID
WHERE 
    l.DateReturned IS NULL AND 
    l.DueDate < GETDATE(); 
