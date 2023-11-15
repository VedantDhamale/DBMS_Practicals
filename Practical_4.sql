-- Create a table Books (BookID, Title, Author, ISBN), Customers (CustomerID, FirstName, LastName, 
-- Email), Checkouts (CheckoutID, CustomerID, BookID, CheckoutDate, ReturnDate)
-- i) Create a view named "CheckedOutBooks" that displays the book title, customer's full name, and 
-- checkout date for all checked-out books.
-- ii) Create a sub-query to find the book with the earliest checkout date.
-- iii) Retrieve the book titles and authors of books that have never been checked out by any customer.


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    ISBN VARCHAR(20)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Checkouts (
    CheckoutID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    CheckoutDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books (BookID, Title, Author, ISBN) VALUES
    (1, 'Book 1', 'Author A', 'ISBN123456'),
    (2, 'Book 2', 'Author B', 'ISBN789012'),
    (3, 'Book 3', 'Author C', 'ISBN345678');

INSERT INTO Books VALUES
    (4, 'Book 4', 'Author D', 'ISBN123457');
    
INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com');

INSERT INTO Checkouts (CheckoutID, CustomerID, BookID, CheckoutDate, ReturnDate) VALUES
    (1, 1, 1, '2023-01-15', '2023-01-30'),
    (2, 2, 2, '2023-02-20', '2023-03-05'),
    (3, 1, 3, '2023-03-10', '2023-03-25');


-- 1
CREATE VIEW CheckedOutBooks AS
SELECT
    B.Title AS BookTitle,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerFullName,
    CO.CheckoutDate
FROM
    Books B
JOIN
    Checkouts CO ON B.BookID = CO.BookID
JOIN
    Customers C ON CO.CustomerID = C.CustomerID;


SELECT * FROM CheckedOutBooks;


-- 2
SELECT Title
FROM Books 
WHERE BookID = (
    SELECT BookID
    FROM Checkouts 
    ORDER BY CheckoutDate
    LIMIT 1
);

-- 3 left join
SELECT B.Title, B.Author
FROM Books B
LEFT JOIN Checkouts C ON B.BookID = C.BookID
WHERE C.BookID IS NULL;






