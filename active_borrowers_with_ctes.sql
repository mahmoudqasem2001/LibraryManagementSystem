-- Active Borrowers with CTEs
WITH BorrowerCTE AS (
    SELECT 
        bo.BorrowerID, 
        bo.FirstName, 
        bo.LastName, 
        COUNT(l.LoanID) AS LoanCount
    FROM 
        Borrowers bo
    LEFT JOIN 
        Loans l ON bo.BorrowerID = l.BorrowerID
    GROUP BY 
        bo.BorrowerID, bo.FirstName, bo.LastName
)
SELECT 
    BorrowerID, 
    FirstName, 
    LastName 
FROM 
    BorrowerCTE 
WHERE 
    LoanCount >= 2 AND LoanCount = 0; 
