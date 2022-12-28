/*
PUBLISHERS TABLE
*/
CREATE TABLE Publishers (PID int PRIMARY KEY, Name varchar(20), City varchar(20));
insert into Publishers (PID, name, city) VALUES (001,'The Penguin','Boston');
insert into Publishers (PID, name, city) VALUES (002, 'Harper Collins', 'NYC');
insert into Publishers (PID, name, city) VALUES (003, 'MacMillan', 'Chicago');
insert into Publishers (PID, name, city) VALUES (004, 'Hachette', 'Miami');
insert into Publishers (PID, name, city) VALUES (005, 'Pearson', 'Dallas');

create table Books(BID int PRIMARY KEY,PID int,ISBN varchar(13), Title varchar(22), Year int, Price DECIMAL(10,2),FOREIGN KEY(PID)REFERENCES Publishers(PID) ON DELETE CASCADE);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (001, 004, '9780661421529', 'The Serpent', 1999, 19.99);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (002, 001, '9789886608074', 'Down the Alley', 2021, 12.65);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (003, 003, '9782191073490', 'The Avengers', 2021, 7.00);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (004, 004, '9787126208497', 'Flying Grass', 2021, 21.99);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (005, 002, '9786196673198', 'On The Road', 2021, 25.99);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (006, 005, '9782847188323', 'On The Road', 2021, 25.99);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (007,004, '9782447932377', 'The Mist', 2021, 30.99);
INSERT INTO Books(BID,PID,ISBN,Title,Year, Price) VALUES (008,004, '0782337534356', 'Fairy Tale',2020, 15.99);


/*
AUTHORS TABLE
*/

CREATE TABLE Authors (AID int PRIMARY KEY, SSN varchar(12), Name varchar(15), Address varchar(36));
insert into Authors(AID, SSN, name, address) VALUES (001, '123-45-6789', 'LeBron James', '5 Goat Avenue, Los Angeles, CA');
insert into Authors(AID, SSN, name, address) VALUES (002, '987-65-4321', 'Nick Austin', '25 Wilfred Street, Lowell, MA');
insert into Authors(AID, SSN, name, address) VALUES (003, '135-79-1234', 'Tom Brady', '205 Divorced Lane, Tampa, FL');
insert into Authors(AID, SSN, name, address) VALUES (004, '246-80-3579', 'Will Smith', '17 Slaps Circle, Miami, FL');
insert into Authors(AID, SSN, name, address) VALUES (005, '789-10-3562', 'Chris Evans', '20 Captain America Road, Medford, MA');
insert into Authors(AID, SSN, name, address) VALUES (006, '789-10-3562', 'Brad Pitt', '55 Looks Way, Phoenix, AZ');
insert into Authors(AID, SSN, name, address) VALUES (007, '789-10-3562', 'Stephen King', '100 Bookstore, NYC, NY');

/*
CUSTOMERS TABLE
*/
CREATE TABLE Customers (CID int PRIMARY KEY, SSN varchar(12), Name varchar(15), Address varchar(36));
insert into Customers (CID, SSN, Name, Address) VALUES (001, '111-22-3333', 'Kevin Hart', '20 Short Lane, Seattle, WA');
insert into Customers (CID, SSN, Name, Address) VALUES (002, '222-33-4444', 'Yashvi Patel', '428 Playing Avenue, Lowell, MA');
insert into Customers (CID, SSN, Name, Address) VALUES (003, '999-88-7777', 'Emma Watson', '12 Harry Potter Road, Houston, TX');
insert into Customers (CID, SSN, Name, Address) VALUES (004, '666-11-2222', 'Jaylen Brown', '100 Legends Way, Boston, MA');
insert into Customers (CID, SSN, Name, Address) VALUES (005, '555-66-1111', 'Margot Robbie', '17 Australia Street, Atlanta, GA');


/*
ORDERS TABLE
*/

CREATE TABLE Orders(OID int,BID int NOT NULL,CID int NOT NULL,Num_Books int,Sales_Price DECIMAL(10,2),PRIMARY KEY(OID),FOREIGN KEY(BID) REFERENCES Books(BID) ON DELETE CASCADE,FOREIGN KEY(CID) REFERENCES Customers(CID) ON DELETE CASCADE);

insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (001,007,001,3,92.97);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (002,003,001,1,7.00);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (003,001,002,1,19.99);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (004,001,003,1,19.99);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (005,004,004,2,43.98);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (006,005,005,2,51.98);
insert into Orders (OID, BID, CID, Num_Books, Sales_Price) VALUES (007,008,001,1,15.99);





-- Books and Authors relation table
CREATE TABLE Books_Authors(BID int, AID int, PRIMARY KEY (BID, AID), FOREIGN KEY (BID) REFERENCES Books(BID) ON DELETE CASCADE, FOREIGN KEY (AID) REFERENCES Authors(AID));
insert into Books_Authors (BID, AID) VALUES (001,005);
insert into Books_Authors (BID, AID) VALUES (002,001);
insert into Books_Authors (BID, AID) VALUES (003,003);
insert into Books_Authors (BID, AID) VALUES (004,002);
insert into Books_Authors (BID, AID) VALUES (005,004);
insert into Books_Authors (BID, AID) VALUES (006,005);
insert into Books_Authors (BID, AID) VALUES (007,007);
insert into Books_Authors (BID, AID) VALUES (008,007);