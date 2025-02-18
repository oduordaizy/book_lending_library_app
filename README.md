# Book Lending Library Application

## Overview
This is a simple **Book Lending Library** application built with **Ruby on Rails (version 8)**. It allows users to **manage books** (create, view, update, delete) and **track their lending history**. The application does not require authentication and allows users to record **when a book is borrowed and returned**, including the borrower's name.

## Features
- 📚 **Manage Books** (Create, Read, Update, Delete)
- 🔍 **View Book Details** (including lending history)
- 📖 **Borrow Books** (record borrower's name and timestamp)
- ✅ **Return Books** (update book status and mark return date)
- 📋 **View Borrowing History** (track books borrowed by a user)
- 🚀 **Simple & User-Friendly Interface**

## Installation
### Prerequisites
Ensure you have the following installed:
- Ruby (>= 3.2)
- Rails (>= 8.0)
- PostgreSQL (or SQLite for development)

### Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/oduordaizy/book_lending_library_app.git
   cd book_lending_library_app
   ```

2. Install dependencies:
   ```sh
   bundle install
   ```

3. Set up the database:
   ```sh
   rails db:create db:migrate db:seed
   ```

4. Start the Rails server:
   ```sh
   rails s
   ```

5. Open your browser and navigate to:
   ```
   http://localhost:3000
   ```

## Models & Database Schema
### **Book**
| Column      | Type    | Description              |
|------------|--------|--------------------------|
| title      | string | Title of the book       |
| author     | string | Author's name           |
| available  | boolean | Availability status     |

### **LendingHistory**
| Column         | Type    | Description                          |
|---------------|--------|----------------------------------|
| book_id       | integer | Foreign key (Book)              |
| borrower_name | string  | Name of the borrower            |
| borrowed_at   | datetime | Timestamp when borrowed         |
| returned_at   | datetime | Timestamp when returned (nullable) |

## Routes
| HTTP Method | Path               | Controller#Action     | Description |
|------------|------------------|-----------------|-------------|
| GET        | /                | home#index     | Landing page |
| GET        | /books           | books#index    | List all books |
| GET        | /books/:id       | books#show     | Show book details |
| GET        | /books/new       | books#new      | Form to add a book |
| POST       | /books           | books#create   | Create a new book |
| GET        | /books/:id/edit  | books#edit     | Form to edit book |
| PATCH/PUT  | /books/:id       | books#update   | Update book details |
| DELETE     | /books/:id       | books#destroy  | Delete a book |
| POST       | /books/:id/borrow | books#borrow  | Borrow a book |
| POST       | /books/:id/return | books#return_book | Return a book |

## Testing
To run the tests:
```sh
rails test
```

## Styling
The application uses vanilla css for styling. You can modify styles in:
```sh
app/assets/stylesheets/application.css
```

## Contributing
1. Fork the repository
2. Create a new feature branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a Pull Request

## License
This project is open-source and available under the **MIT License**.

## Contact
For questions or suggestions, reach out via:
- GitHub: [oduordaizy](https://github.com/yourusername)
- Email: oduordaizy@gmail.com
