CREATE DATABASE IF NOT EXISTS `finco_app` COLLATE utf8_general_ci;
USE `finco_app`;

  CREATE TABLE `kategorie`
  (`KategorieID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(30) NOT NULL ,
   `Typ` VARCHAR(8) NOT NULL ,
   `Beschreibung` VARCHAR(50) NOT NULL);
   
   CREATE TABLE `users`
  (`KdNr` VARCHAR(50) NOT NULL PRIMARY KEY ,
   `UserIBAN` VARCHAR(22) NOT NULL ,
   `Vorname` VARCHAR(30) NOT NULL ,
   `Nachname` VARCHAR(30) NOT NULL ,
   `E_Mail` VARCHAR(50) NOT NULL ,
   `PasswortHash` VARCHAR(64) NOT NULL ,
   `RegDatum` DATE NOT NULL);
   
  CREATE TABLE `umsatz`
  (`UmsatzID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Betrag` DECIMAL(10,2) NOT NULL ,
   `Datum` DATE NOT NULL ,
   `KategorieID` INT NOT NULL ,
   `Beschreibung` VARCHAR(50) NOT NULL ,
   `KdNr` VARCHAR(50) NOT NULL ,
   `UserIBAN` VARCHAR(22) NOT NULL ,
   `Art` VARCHAR(1) NOT NULL ,
   `Kundenreferenz` VARCHAR(50) NOT NULL ,
    FOREIGN KEY (`KategorieID`) REFERENCES `kategorie` (`KategorieID`),
    FOREIGN KEY (`KdNr`) REFERENCES `users` (`KdNr`));

   CREATE TABLE `login`
   (`Login_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `KdNr` VARCHAR(50) NOT NULL ,
    `UserIBAN` VARCHAR(22) NOT NULL ,
    `LoginZeit` DATETIME NOT NULL ,
    `IP_Adresse` VARCHAR(400) NOT NULL ,
    `Status` VARCHAR(1) NOT NULL ,
    FOREIGN KEY (`KdNr`) REFERENCES `users` (`KdNr`));