CREATE DATABASE my_store;
USE my_store;

CREATE TABLE IF NOT EXISTS Items (
	Item_ID VARCHAR(255) PRIMARY KEY NOT NULL,
    Model VARCHAR(255), 
    Producer VARCHAR(255),
    Year INT,
    Price INT NOT NULL,
    Color VARCHAR(255)
    );

CREATE TABLE Salespersons (
	Salesman_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Store VARCHAR(255)
);

CREATE TABLE Customers (
	Customer_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    First_Name VARCHAR(255) NOT NULL,
	Last_Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Adress VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    ZIP_Code INT
);

CREATE TABLE Invoices (
	Invoice_Number INT UNIQUE,
    Invoice_Date DATE,
    Item_ID VARCHAR(255),
    Customer_ID INT,
    Salesman_ID INT,
	FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Salesman_ID) REFERENCES Salespersons(Salesman_ID)
);

select * from customers;