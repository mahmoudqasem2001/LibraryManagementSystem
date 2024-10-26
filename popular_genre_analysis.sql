-- Popular Genre Analysis
SELECT 
    b.Genre, 
    COUNT(l.LoanID) AS GenreCount 
FROM 
    Books b
JOIN 
    Loans l ON b.BookID = l.BookID
WHERE 
    l.DateBorrowed BETWEEN '20231001' AND '20241031'  
GROUP BY 
    b.Genre 
ORDER BY 
    GenreCount DESC;
