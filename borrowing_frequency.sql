-- Borrowing Frequency using Window Functions
SELECT 
    bo.BorrowerID, 
    bo.FirstName, 
    bo.LastName, 
    COUNT(l.LoanID) AS BorrowCount,
    ROW_NUMBER() OVER (ORDER BY COUNT(l.LoanID) DESC) AS BorrowRank
FROM 
    Borrowers bo
LEFT JOIN 
    Loans l ON bo.BorrowerID = l.BorrowerID
GROUP BY 
    bo.BorrowerID, bo.FirstName, bo.LastName;
