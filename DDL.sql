CREATE DATABASE LibraryManagementSystem;
GO

USE LibraryManagementSystem;
GO

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(255),
    Author NVARCHAR(255),
    ISBN NVARCHAR(13),
    PublishedDate DATE,
    Genre NVARCHAR(100),
    ShelfLocation NVARCHAR(100),
    CurrentStatus NVARCHAR(10) CHECK (CurrentStatus IN ('Available', 'Borrowed'))
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255) UNIQUE,
    DateOfBirth DATE,
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    BorrowerID INT FOREIGN KEY REFERENCES Borrowers(BorrowerID),
    DateBorrowed DATE,
    DueDate DATE,
    DateReturned DATE NULL
);
GO


GO
