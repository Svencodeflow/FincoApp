CREATE DATABASE IF NOT EXISTS `finco_app` COLLATE utf8_general_ci;
USE `finco_app`;

  CREATE TABLE `kategorie`
  (`KategorieID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(30) NOT NULL ,
   `Typ` VARCHAR(8) NOT NULL ,
   `K_Beschreibung` VARCHAR(50) NOT NULL);
   
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
   `U_Betrag` DECIMAL(10,2) NOT NULL ,
   `U_Datum` DATE NOT NULL ,
   `U_KategorieID` INT NOT NULL ,
   `U_Beschreibung` VARCHAR(50) NOT NULL ,
   `U_KdNr` VARCHAR(50) NOT NULL ,
   `U_UserIBAN` VARCHAR(22) NOT NULL ,
   `Art` VARCHAR(1) NOT NULL ,
   `Kundenreferenz` VARCHAR(50) NOT NULL ,
    FOREIGN KEY (`U_KategorieID`) REFERENCES `kategorie` (`KategorieID`),
    FOREIGN KEY (`U_KdNr`) REFERENCES `users` (`KdNr`));

   CREATE TABLE `login`
   (`Login_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `L_KdNr` VARCHAR(50) NOT NULL ,
    `L_UserIBAN` VARCHAR(22) NOT NULL ,
    `LoginZeit` DATETIME NOT NULL ,
    `IP_Adresse` VARCHAR(400) NOT NULL ,
    `Status` VARCHAR(1) NOT NULL ,
    FOREIGN KEY (`L_KdNr`) REFERENCES `users` (`KdNr`));