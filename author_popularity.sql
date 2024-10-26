-- Author Popularity using Aggregation
SELECT 
    b.Author, 
    COUNT(l.LoanID) AS BorrowCount 
FROM 
    Books b
LEFT JOIN 
    Loans l ON b.BookID = l.BookID
GROUP BY 
    b.Author 
ORDER BY 
    BorrowCount DESC;
