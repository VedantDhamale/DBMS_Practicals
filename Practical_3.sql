-- 3) Create a table Supplier(SNO, Sname, Status, City), Parts (PNO, Pname, Color, Weight, City), 
-- Shipments(SNO,PNO,QTY)
-- i) Find shipment information (SNO, Sname, PNO, Pname, QTY) for those having quantity less than 157.
-- ii) List SNO, Sname, PNO, Pname for those suppliers who made shipments of parts whose quantity.
-- is larger than the average quantity
-- ii) Find aggregate quantity of PNO 1692 of color green for which shipments made by supplier number 
-- who residing Mumbai.
use problem_statement;

CREATE TABLE Supplier (
    SNO INT PRIMARY KEY,
    Sname VARCHAR(255),
    Status VARCHAR(255),
    City VARCHAR(255)
);

CREATE TABLE Parts (
    PNO INT PRIMARY KEY,
    Pname VARCHAR(255),
    Color VARCHAR(255),
    Weight INT,
    City VARCHAR(255)
);

CREATE TABLE Shipments (
    SNO INT,
    PNO INT,
    QTY INT,
    FOREIGN KEY (SNO) REFERENCES Supplier(SNO),
    FOREIGN KEY (PNO) REFERENCES Parts(PNO)
);

INSERT INTO Supplier (SNO, Sname, Status, City) VALUES
    (1, 'Supplier1', 'Active', 'Delhi'),
    (2, 'Supplier2', 'Inactive', 'Pune'),
    (3, 'Supplier3', 'Active', 'Mumbai'),
    (4, 'Supplier4', 'Active', 'Pune');
    
    
INSERT INTO Parts (PNO, Pname, Color, Weight, City) VALUES
    (101, 'PartA', 'Red', 2.5, 'Delhi'),
    (102, 'PartB', 'Blue', 1.8, 'Pune'),
    (103, 'PartC', 'Green', 3.2, 'Mumbai'),
    (104, 'PartD', 'Yellow', 4.0, 'Pune');
    
INSERT INTO Shipments (SNO, PNO, QTY) VALUES
    (1, 101, 50),
    (1, 102, 30),
    (2, 103, 25),
    (2, 101, 40),
    (3, 102, 60),
    (4, 104, 20);
    
-- 1 INNER JOIN
SELECT
    S.SNO,
    S.Sname,
    SH.PNO,
    P.Pname,
    SH.QTY
FROM Supplier S
JOIN Shipments SH ON S.SNO = SH.SNO
JOIN Parts P ON SH.PNO = P.PNO
WHERE SH.QTY < 57;


-- 2
SELECT S.SNO,S.Sname,SH.PNO,P.Pname
FROM Supplier S
INNER JOIN Shipments SH ON S.SNO=SH.SNO
INNER JOIN Parts P ON SH.PNO=P.PNO
WHERE SH.QTY > (SELECT AVG(QTY) FROM Shipments);

-- 3
SELECT SUM(SH.QTY) AS AggregateQuantity 
FROM shipments SH 
INNER JOIN parts P ON SH.PNO= P.PNO
INNER JOIN supplier S ON SH.SNO=S.SNO
WHERE P.PNO = 103 
	AND P.Color = 'green'
	AND S.City='Mumbai';



-- Natural join  SQL automatically joins the tables based on the common column(s).	
-- Inner join We explicitly need to specify the column(s) used for joining the table using the ON clause.
