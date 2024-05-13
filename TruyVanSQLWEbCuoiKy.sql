CREATE SCHEMA ebook-app ;

CREATE TABLE ebook-app.`user` (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  phno VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  landmark VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  state VARCHAR(45) NULL,
  pincode varchar(45) null,
  role ENUM('User', 'Admin','manager'),
  PRIMARY KEY (id));

CREATE TABLE ebook-app.`book_dtls` (
  bookId INT NOT NULL AUTO_INCREMENT,
  bookname VARCHAR(45) NULL,
  author VARCHAR(45) NULL,
  price VARCHAR(45) NULL,
  bookCategory VARCHAR(45) NULL,
  status VARCHAR(45) NULL,
  photo VARCHAR(45) NULL,
  PRIMARY KEY (bookId));
ALTER TABLE ebook-app.`book_dtls` 
ADD COLUMN email VARCHAR(45) NULL AFTER photo;

CREATE TABLE ebook-app.`cart` (
  cid INT NOT NULL AUTO_INCREMENT,
  bid INT NULL,
  uid INT NULL,
  book_name VARCHAR(45) NULL,
  author VARCHAR(45) NULL,
  price DOUBLE NULL,
  total_price DOUBLE NULL,
  PRIMARY KEY (cid));

CREATE TABLE ebook-app.`book_order` (
  id INT NOT NULL AUTO_INCREMENT,
  order_id VARCHAR(45) NULL,
  user_name VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  address VARCHAR(500) NULL,
  phno VARCHAR(45) NULL,
  book_name VARCHAR(45) NULL,
  author VARCHAR(45) NULL,
  price VARCHAR(45) NULL,
  payment VARCHAR(45) NULL,
  PRIMARY KEY (id));

drop table if exists suppliers;
create table suppliers(
	id int auto_increment not null,
  name varchar(45) not null,
  phone varchar(45) not null,
  email varchar(45) not null,
  address varchar(45) not null,
  CONSTRAINT PK_supplier PRIMARY KEY CLUSTERED (id ASC),
	CONSTRAINT UK_supplier UNIQUE (id)
);

drop table if exists imported_books;
create table imported_books(
  id INT AUTO_INCREMENT PRIMARY KEY,
  importedQuantity INT,
  idBookDtls INT,
  idImportedBill INT
);

drop table if exists imported_bills;
create table imported_bills(
  id INT AUTO_INCREMENT PRIMARY KEY,
  importedDate DATETIME,
  totalAmount DOUBLE,
  idSupplier INT,
  idUser INT
);
