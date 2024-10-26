-- Stored Procedure - Add New Borrowers
CREATE PROCEDURE sp_AddNewBorrower
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(255),
    @DateOfBirth DATE,
    @MembershipDate DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
    BEGIN
        SELECT 'Error: Email already exists.' AS Message;
        RETURN;
    END
    
    INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
    VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
    
    SELECT SCOPE_IDENTITY() AS NewBorrowerID; 
END;
