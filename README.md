# Library Management System

## Project Overview
The Library Management System is designed to streamline and digitize the library operations of a local library. It replaces traditional book-keeping by implementing a relational database in MS SQL that helps the library track books, borrowers, loans, returns, and borrowing trends efficiently.

## Objectives
- Create an entity relationship model (ERM) to represent the library's entities and their relationships.
- Implement a relational database schema in MS SQL based on the ERM.
- Seed the database with meaningful data for testing and analysis.
- Develop complex queries, stored procedures, and triggers to perform various library-related operations and generate insights.

## Database Schema
The database consists of three main tables: **Books**, **Borrowers**, and **Loans**. Below is the schema for each table:

### 1. Books Table
Stores information about each book in the library.
- **BookID**: Unique identifier for each book (Primary Key).
- **Title**: Title of the book.
- **Author**: Name of the author.
- **ISBN**: ISBN number, formatted as a 13-character string.
- **PublishedDate**: Date the book was published.
- **Genre**: Genre of the book.
- **ShelfLocation**: Location of the book within the library.
- **CurrentStatus**: Indicates if the book is available or borrowed.

### 2. Borrowers Table
Stores information about each borrower who is a registered member of the library.
- **BorrowerID**: Unique identifier for each borrower (Primary Key).
- **FirstName**: First name of the borrower.
- **LastName**: Last name of the borrower.
- **Email**: Email address of the borrower.
- **DateOfBirth**: Date of birth of the borrower.
- **MembershipDate**: Date the borrower became a member of the library.

### 3. Loans Table
Tracks each borrowing transaction, linking books to borrowers.
- **LoanID**: Unique identifier for each loan transaction (Primary Key).
- **BookID**: Reference to the borrowed book (Foreign Key).
- **BorrowerID**: Reference to the borrower (Foreign Key).
- **DateBorrowed**: Date the book was borrowed.
- **DueDate**: Due date for returning the book.
- **DateReturned**: Date the book was returned (NULL if not yet returned).

## Seed Data
The database is seeded with:
- **1000 Books** with diverse genres, authors, and publication dates.
- **1000 Borrowers** with unique personal details.
- **1000 Loans** records, reflecting various borrowing and return dates.

Each seed data file (`seed_books.sql`, `seed_borrowers.sql`, `seed_loans.sql`) includes `INSERT` statements for quickly populating the database.

## Queries and Procedures
This section provides details of each query, function, procedure, and trigger used in the system.

### 1. List of Borrowed Books
This query retrieves all books borrowed by a specific borrower, including unreturned ones, using a simple `SELECT` statement with joins between Loans and Books.

### 2. Active Borrowers with CTEs
Using a Common Table Expression (CTE), this query identifies borrowers who have borrowed two or more books and haven't returned any. The CTE helps isolate borrowers with specific conditions, making the query more readable.

### 3. Borrowing Frequency using Window Functions
This query ranks borrowers based on their borrowing frequency using `ROW_NUMBER()` or `RANK()` window functions to analyze top borrowers.

### 4. Popular Genre Analysis
This query identifies the most popular genre in a specified month by joining Books and Loans, then aggregating the data using `GROUP BY` and window functions for month-wise analysis.

### 5. Stored Procedure - Add New Borrowers (`sp_AddNewBorrower`)
This stored procedure allows easy addition of new borrowers. It includes:
- **Error Handling**: Checks if the email already exists to prevent duplicate borrowers.
- **Parameters**: Accepts FirstName, LastName, Email, DateOfBirth, and MembershipDate.
- **Return Value**: Returns the BorrowerID for new records or an error message if the email already exists.

### 6. Database Function - Calculate Overdue Fees (`fn_CalculateOverdueFees`)
This function calculates overdue fees for a loan, where:
- **Fee Calculation**: $1 per day for up to 30 days and $2 per day thereafter.
- **Return Value**: The total overdue fee for the LoanID.

### 7. Database Function - Book Borrowing Frequency (`fn_BookBorrowingFrequency`)
Calculates the borrowing frequency for a specific book using the BookID parameter.

### 8. Overdue Analysis
Lists all books that are overdue by more than 30 days, along with associated borrowers, by joining Books and Loans and filtering on overdue days.

### 9. Author Popularity using Aggregation
Ranks authors based on the borrowing frequency of their books, using `GROUP BY` on the author and counting the loan records.

### 10. Genre Preference by Age
Groups borrowers by age ranges (e.g., 0-10, 11-20) and identifies the most popular genre within each group using `GROUP BY` and `HAVING`.

### 11. Stored Procedure - Borrowed Books Report (`sp_BorrowedBooksReport`)
Generates a report of books borrowed within a specified date range:
- **Parameters**: Accepts StartDate and EndDate.
- **Return Value**: A table listing borrowed books, including borrower names and borrowing dates.

### 12. Trigger Implementation
A trigger on the Books table logs an entry in an AuditLog table whenever a book’s status changes from 'Available' to 'Borrowed' or vice versa. This helps keep track of book availability history.

### 13. SQL Stored Procedure with Temp Table
This procedure uses a temporary table to identify borrowers with overdue books. It then joins the temp table with Loans to list specific overdue books for each borrower.

## Additional Information
### Bonus Query
A query to identify the three busiest days of the week based on loan frequency, sorted by percentage of total loans for each day. This information can assist the library in scheduling part-time workers on peak days.

## Files and Organization
The SQL scripts are organized as follows:
- **Schema Creation**: `create_schema.sql`
- **Seed Data**: `seed_books.sql`, `seed_borrowers.sql`, `seed_loans.sql`
- **Queries**: Individual `.sql` files for each complex query.
- **Procedures**: Separate files for each stored procedure.
- **Functions**: SQL files for each user-defined function.
- **Trigger**: `trigger_audit_log.sql`

Each file is stored in the GitHub repository, with individual commits and documentation.

## License
This project is licensed under the MIT License. See LICENSE file for details.
