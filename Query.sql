--- Query 1: List titles of all books in ascending order. 
SELECT TITLE
FROM Books
ORDER BY TITLE ASC;


-- Query 2: Find the name of the author who wrote the book titled "On The Road".   
SELECT Authors.Name
FROM Authors, Books, Books_Authors
WHERE Books.Title = 'On The Road' AND
Books.BID = Books_Authors.BID AND
Books_Authors.AID = Authors.AID;


-- Query 3: List the title and author of books whose price is greater than $20. List your result in the ascending order of the price 
SELECT Authors.Name, Books.Title
FROM Books, Authors, Books_Authors
WHERE Books.Price > 20 AND
Books.BID = Books_Authors.BID AND
Authors.AID = Books_Authors.AID
ORDER BY Books.Price ASC;

-- Query 4: Find the books that have the same title but different author(s). Each book title should only be displayed once. 
SELECT DISTINCT Books.Title
FROM Authors, Books_Authors, Books
WHERE Authors.AID = Books_Authors.AID and
Books.BID = Books_Authors.BID and
Books.Title in (
SELECT Title
FROM Books
GROUP BY Title
HAVING COUNT(*) > 1
);

-- Query 5: Find the publisher that has the largest revenue in 2021.  
SELECT Publishers.Name,SUM(Orders_Bid.Total) as Total
FROM Publishers,Books,
(SELECT Orders.BID,SUM(Orders.Sales_Price) as Total
FROM Orders
Join Books
On Books.BID = Orders.BID
GROUP BY Orders.BID) Orders_Bid
WHERE Orders_Bid.BID = Books.BID and
Books.PID = Publishers.PID
GROUP BY Publishers.Name
ORDER BY Total DESC
offset 0 rows
fetch next 1 rows only;

-- Query 6: List the title and price of all books written by the author of the best-selling book of 2021 (the book that has been sold the most number of copies in 2021).
SELECT Books.Title, Books.Price
FROM Books, Books_Authors,
(SELECT Orders.BID,
SUM(Orders.num_books) as Total_Sold,
Authors.AID
FROM Orders, Authors, Books_Authors
WHERE Orders.BID = Books_Authors.BID and
Authors.AID = Books_Authors.AID
GROUP BY Orders.BID, Authors.AID
ORDER BY Total_Sold DESC
offset 0 rows
fetch next 1 rows only) Best_Selling
WHERE Books.BID = Books_Authors.BID and
Books_Authors.AID = Best_Selling.AID;


-- Query 7: Find the customer who has purchased every book written by Stephen King.
SELECT Customers.Name
FROM orders,Customers
WHERE Customers.CID = orders.CID and
orders.BID IN (
SELECT Books.BID
FROM Books, Books_Authors, Authors
WHERE Authors.Name = 'Stephen King' and
Books.BID = Books_Authors.BID and
Books_Authors.AID = Authors.AID)
GROUP BY Customers.Name, Orders.CID HAVING COUNT(*) = 
(SELECT COUNT(*) 
FROM Books,Books_Authors, Authors
WHERE Authors.name = 'Stephen King' and
Books.BID = Books_Authors.BID and
Books_Authors.AID = Authors.AID);

-- Query 8: Insert a new author 
INSERT INTO Authors
VALUES (008,'172-55-3821', 'Johnny Depp', '10 Caribean Lane, Portland, OR');

-- Query 9: Increase $2 to those books whose price is lower than $10 
UPDATE Books
SET Price = Price + 2
WHERE Price < 10;

-- Query 10: Delete publishers and books they have published who are in Chicago.
DELETE FROM Publishers
WHERE Publishers.City = 'Chicago';