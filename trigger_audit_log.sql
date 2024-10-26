-- Trigger Implementation
CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    StatusChange NVARCHAR(20),
    ChangeDate DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange)
    SELECT 
        i.BookID, 
        CASE 
            WHEN i.CurrentStatus <> d.CurrentStatus THEN 'Changed from ' + d.CurrentStatus + ' to ' + i.CurrentStatus 
        END
    FROM 
        inserted i
    JOIN 
        deleted d ON i.BookID = d.BookID
    WHERE 
        i.CurrentStatus <> d.CurrentStatus;
END;
