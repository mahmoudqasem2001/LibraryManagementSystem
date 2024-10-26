import random
from faker import Faker
from datetime import timedelta

fake = Faker()
output = []

for i in range(1000):
    book_id = random.randint(1, 1000)
    borrower_id = random.randint(1, 1000)
    
    # Generate `DateBorrowed`
    date_borrowed = fake.date_between(start_date='-1y', end_date='today').strftime('%Y%m%d')
    
    # Calculate `DueDate` by adding 14 days to `DateBorrowed`
    date_borrowed_obj = fake.date_between(start_date='-1y', end_date='today')
    due_date = (date_borrowed_obj + timedelta(days=14)).strftime('%Y%m%d')
    
    # Randomly set `DateReturned` as NULL or a date after `DueDate`
    if random.choice([True, False]):
        date_returned = "NULL"  # Set as literal NULL, without quotes
    else:
        date_returned = f"'{(date_borrowed_obj + timedelta(days=random.randint(15, 60))).strftime('%Y%m%d')}'"

    output.append(f"INSERT INTO Loans (LoanID, BookID, BorrowerID, DateBorrowed, DueDate, DateReturned) "
                  f"VALUES ('{i+1}', '{book_id}', '{borrower_id}', '{date_borrowed}', '{due_date}', {date_returned});")

with open("C:\\Users\\HP\\Desktop\\Seeders Scripts\\seed_loans.sql", "w") as file:
    file.write("\n".join(output))
