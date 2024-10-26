import random
from faker import Faker

fake = Faker()
output = []

for _ in range(1000):
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.email()
    date_of_birth = fake.date_of_birth(minimum_age=18, maximum_age=80).strftime('%Y%m%d')
    membership_date = fake.date_this_year().strftime('%Y%m%d')

    output.append(f"INSERT INTO Borrowers (BorrowerID ,FirstName, LastName, Email, DateOfBirth, MembershipDate) "
                  f"VALUES ('{_}', '{first_name}', '{last_name}', '{email}', '{date_of_birth}', '{membership_date}');")

with open("C:\\Users\\HP\\Documents\\SQL Server Management Studio\\seed_borrowers.sql", "w") as file:
    file.write("\n".join(output))
