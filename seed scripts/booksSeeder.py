import random
from faker import Faker

fake = Faker()
output = []

# Define sample genres and statuses
genres = ["Fiction", "Science Fiction", "Mystery", "Fantasy", "Historical", "Biography", "Children", "Non-Fiction"]
statuses = ["Available", "Borrowed"]

for i in range(1000):
    title = fake.sentence(nb_words=3).replace('.', '')  # Generate a 3-word title
    author = fake.name()
    isbn = fake.isbn13(separator='')  # Generates a 13-character ISBN without hyphens
    # Format `PublishedDate` in `yyyymmdd`
    published_date = fake.date_between(start_date='-10y', end_date='today').strftime('%Y%m%d')
    genre = random.choice(genres)
    shelf_location = f"{chr(65 + random.randint(0, 5))}{random.randint(1, 10)}"  # Generate a shelf location like A1, B5, etc.
    current_status = random.choice(statuses)

    output.append(f"INSERT INTO Books (BookID, Title, Author, ISBN, PublishedDate, Genre, ShelfLocation, CurrentStatus) "
                  f"VALUES ('{i+1}', '{title}', '{author}', '{isbn}', '{published_date}', '{genre}', '{shelf_location}', '{current_status}');")

with open("C:\\Users\\HP\\Desktop\\Seeders Scripts\\seed_books.sql", "w") as file:
    file.write("\n".join(output))
