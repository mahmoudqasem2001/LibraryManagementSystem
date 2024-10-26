-- Genre Preference by Age
SELECT 
    CASE 
        WHEN YEAR(GETDATE()) - YEAR(DateOfBirth) BETWEEN 0 AND 10 THEN '0-10'
        WHEN YEAR(GETDATE()) - YEAR(DateOfBirth) BETWEEN 11 AND 20 THEN '11-20'
        WHEN YEAR(GETDATE()) - YEAR(DateOfBirth) BETWEEN 21 AND 30 THEN '21-30'
        ELSE '31+' 
    END AS AgeGroup,
    b.Genre,
    COUNT(l.LoanID) AS BorrowCount
FROM 
    Borrowers bo
JOIN 
    Loans l ON bo.BorrowerID = l.BorrowerID
JOIN 
    Books b ON l.BookID = b.BookID
GROUP BY 
    AgeGroup, b.Genre 
HAVING 
    COUNT(l.LoanID) > 0; -- Genres with at least one loan
