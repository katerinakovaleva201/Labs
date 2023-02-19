INSERT INTO Items (Item_ID, Model, Producer, Year, Price, Color)
VALUES ("4H7U5674","iPhone 14","Apple", 2023, 829, "Bleu"),
("3G9Z4322","Samsung Galaxy S22 Ultra","Samsung", 2023, 1599, "Black"),
("5D4E8865","MacBook Pro 16","Apple", 2022, 2999, "Grey");

INSERT INTO Salespersons (First_Name, Last_Name, Store)
VALUES ("Jane", "Eyre", "Paris"),
("Robinson", "Crusoe", "Paris"),
("Don", "Quijote", "Paris");

INSERT INTO Customers (First_Name, Last_Name, Phone, Email, Address, City, Country, ZIP_Code)
VALUES ("James", "Bond", "+33 65 88 63 45", "jamesbond@gmail.com", "3 Rue de Castiglione", "Paris", "France", "75001"),
("Jack", "Sparrow", "+33 75 99 33 65", "jacksparrow@gmail.com", "228 Rue de Rivoli", "Paris", "France", "75001"),
("John", "Snow", "+34 00 45 23 96", "johnsnow@gmail.com", "4 Rue de Valois", "Paris", "France", "75001");

INSERT INTO Invoices (Invoice_Number, Invoice_Date, Item_ID, Customer_ID, Salesman_ID)
VALUES (0001,'2023-01-01',"4H7U5674",1,2),
(0002,'2023-01-02',"Z3G9Z4322",3,3), 
(0003,'2023-01-02',"5D4E8865",2,3);