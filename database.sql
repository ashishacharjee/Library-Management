CREATE DATABASE IF NOT EXISTS `library_management`;
USE `library_management`;

CREATE TABLE `Books` (
    `BookID` INT AUTO_INCREMENT PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Author` VARCHAR(255) NOT NULL,
    `ISBN` VARCHAR(20) UNIQUE NOT NULL,
    `PublicationYear` INT,
    `Status` ENUM('Available', 'Borrowed') DEFAULT 'Available'
);

CREATE TABLE `Members` (
    `MemberID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `ContactInfo` VARCHAR(255)
);

CREATE TABLE `Borrowings` (
    `BorrowingID` INT AUTO_INCREMENT PRIMARY KEY,
    `BookID` INT,
    `MemberID` INT,
    `BorrowDate` DATE NOT NULL,
    `DueDate` DATE NOT NULL,
    `ReturnDate` DATE,
    FOREIGN KEY (`BookID`) REFERENCES `Books`(`BookID`),
    FOREIGN KEY (`MemberID`) REFERENCES `Members`(`MemberID`)
);
