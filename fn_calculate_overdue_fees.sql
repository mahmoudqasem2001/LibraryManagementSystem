-- Database Function - Calculate Overdue Fees
CREATE FUNCTION fn_CalculateOverdueFees
    (@LoanID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @DueDate DATE, @DateReturned DATE, @OverdueDays INT, @Fee DECIMAL(10,2);

    SELECT @DueDate = DueDate, @DateReturned = DateReturned
    FROM Loans WHERE LoanID = @LoanID;

    IF @DateReturned IS NULL
    BEGIN
        SET @OverdueDays = DATEDIFF(DAY, @DueDate, GETDATE());
        
        IF @OverdueDays <= 30
            SET @Fee = @OverdueDays * 1.00; 
        ELSE
            SET @Fee = (30 * 1.00) + ((@OverdueDays - 30) * 2.00); 
    END
    ELSE
        SET @Fee = 0; 

    RETURN @Fee;
END;
