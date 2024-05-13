create database Bookstore;
use Bookstore;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    Publication_Year INT,
    Price DECIMAL(10, 2)
);
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Price DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Book_ID INT,
    Quantity INT,
    Price_Per_Book DECIMAL(10, 2),
    Total_Price DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Position VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(15)
);
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Book_ID INT,
    Quantity INT,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Employee_ID INT,
    Transaction_Date DATETIME,
    Total_Sales DECIMAL(10, 2),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

INSERT INTO Books (Book_ID, Title, Author, Genre, Publication_Year, Price) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 12.99),
(2, '1984', 'George Orwell', 'Dystopian', 1949, 9.99),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 10.99),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 11.99),
(5, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 15.99);

INSERT INTO Customers (Customer_ID, Name, Email, Phone, Address) VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Anytown, USA'),
(2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, Anytown, USA'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Oak St, Anytown, USA');

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Price) VALUES
(1, 1, '2024-05-13', 38.97),
(2, 2, '2024-05-12', 25.98),
(3, 3, '2024-05-11', 46.97);

INSERT INTO Order_Details (Order_Detail_ID, Order_ID, Book_ID, Quantity, Price_Per_Book, Total_Price) VALUES
(1, 1, 1, 1, 12.99, 12.99),
(2, 1, 3, 2, 10.99, 21.98),
(3, 2, 2, 1, 9.99, 9.99),
(4, 3, 4, 3, 11.99, 35.97);

INSERT INTO Employees (Employee_ID, Name, Position, Email, Phone) VALUES
(1, 'Michael Johnson', 'Manager', 'michael.johnson@example.com', '555-555-5555'),
(2, 'Emily Davis', 'Sales Associate', 'emily.davis@example.com', '444-444-4444');

INSERT INTO Inventory (Inventory_ID, Book_ID, Quantity) VALUES
(1, 1, 20),
(2, 2, 15),
(3, 3, 10),
(4, 4, 25),
(5, 5, 30);

INSERT INTO Transactions (Transaction_ID, Employee_ID, Transaction_Date, Total_Sales) VALUES
(1, 1, '2024-05-13 10:00:00', 38.97),
(2, 2, '2024-05-12 09:30:00', 25.98),
(3, 1, '2024-05-11 11:15:00', 46.97);
