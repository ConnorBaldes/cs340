/*
    TASK 1 - CREATE A CUSTOMER OBJECT TABLE

    ! NOTES !

    Anytime you see [SQUARE BRACKETS] it means something that is optional.

    Anytime you see ... three dots - it means continued iterations of the same thing.
*/



/*
    CREATE THE CUSTOMERS TABLE

    Create the table customers, replace it if it exists, defined by the columns within the parentheses.

    We can use CREATE OR REPLACE instead of putting the usual DROP IF EXISTS statements at the top of the SQL file.

    The general syntax of CREATE [OR REPLACE] (Square brackets indicates its optional) is:

    CREATE [OR REPLACE] tableName 
    (
        columnName datatype constraints,
        ...
        [[PRIMARY KEY (columnName, ...)],
        FOREIGN KEY (columnName) REFERENCES primaryTableName(primaryKey, ...)]
    );
*/

CREATE TABLE Customers (
     CustomerID int NOT NULL AUTO_INCREMENT,
     CustomerName varchar(50),
     AddressLine1 varchar(50),
     AddressLine2 varchar(50),
     City varchar(50),
     State varchar(50),
     PostalCode varchar(50),
     YTDPurchases decimal(19,2),
     PRIMARY KEY (CustomerID)
);

INSERT INTO Customers (CustomerName, AddressLine1, City, State, PostalCode)
VALUES ('Bike World', '60025 Bollinger Canyon Road', 'San Ramon', 'California', '94583'),
('Metro Sports', '482505 Warm Springs Blvd.', 'Freemont', 'California', '94536'),
('SuperDuper Sports', '1234 SW Ironman Blvd.', 'Corvallis', 'Oregon', '97333');


DROP TABLE IF EXISTS TermsCode;
CREATE TABLE TermsCode (
    TermsCodeID varchar(50) NOT NULL,
    Description varchar(50),
    PRIMARY KEY ( TermsCodeID )
);

INSERT INTO TermsCode (TermsCodeID, Description)
VALUES ('NET30', 'Payment due in 30 days.'),
('NET15', 'Payment due in 15 days.'),
('210NET30', '2% discount in 10 days Net 30');

DROP TABLE IF EXISTS Invoices;
CREATE TABLE Invoices (
    InvoiceID int NOT NULL AUTO_INCREMENT,
    CustomerID int,
    InvoiceDate datetime, 
    TermsCodeID varchar(50), 
    TotalDue decimal(19,2),
    PRIMARY KEY ( InvoiceID ),
    FOREIGN KEY ( CustomerID ) REFERENCES Customers( CustomerID ),
    FOREIGN KEY ( TermsCodeID ) REFERENCES TermsCode( TermsCodeID )
);


INSERT INTO Invoices (CustomerID, InvoiceDate, TotalDue, TermsCodeID)
VALUES (2, '2014-02-07', '2388.98', 'NET30'),
(1, '2014-02-02', '2443.35', '210NET30'),
(1, '2014-02-09', '8752.32', NULL)