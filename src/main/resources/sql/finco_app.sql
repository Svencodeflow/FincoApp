CREATE DATABASE IF NOT EXISTS `finco_app` COLLATE utf8_general_ci;
USE `finco_app`;

CREATE TABLE `users`
(`UserIBAN` VARCHAR(22) NOT NULL PRIMARY KEY,
 `Vorname` VARCHAR(30) NOT NULL ,
 `Nachname` VARCHAR(30) NOT NULL ,
 `E_Mail` VARCHAR(50) NOT NULL ,
 `PasswortHash` VARCHAR(64) NOT NULL ,
 `RegDatum` DATE NOT NULL);

  CREATE TABLE `kategorie`
  (`KategorieID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(30) NOT NULL ,
   `Typ` VARCHAR(8) NOT NULL ,
   `K_Beschreibung` VARCHAR(50) NOT NULL);

  CREATE TABLE `einnahmen`
  (`EinnahmenID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `E_Betrag` DECIMAL(10,2) NOT NULL ,
   `E_Datum` DATE NOT NULL ,
   `E_KategorieID` INT NOT NULL ,
   `E_Beschreibung` VARCHAR(50) NOT NULL ,
   `E_UserIBAN` VARCHAR(22) NOT NULL ,
    FOREIGN KEY (`E_KategorieID`) REFERENCES `kategorie` (`KategorieID`),
    FOREIGN KEY (`E_UserIBAN`) REFERENCES `users` (`UserIBAN`));

   CREATE TABLE `ausgaben`
   (`AusgabenID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `A_Betrag` DECIMAL(10,2) NOT NULL ,
    `A_Datum` DATE NOT NULL ,
    `A_KategorieID` INT NOT NULL ,
    `A_Beschreibung` VARCHAR(50) NOT NULL ,
    `A_UserIBAN` VARCHAR(22) NOT NULL ,
     FOREIGN KEY (`A_KategorieID`) REFERENCES `kategorie` (`KategorieID`),
     FOREIGN KEY (`A_UserIBAN`) REFERENCES `users` (`UserIBAN`));

   CREATE TABLE `login`
   (`Login_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `L_UserIBAN` VARCHAR(22) NOT NULL ,
    `LoginZeit` DATETIME NOT NULL ,
    `IP_Adresse` VARCHAR(400) NOT NULL ,
    `Erfolgreich` BOOLEAN NOT NULL ,
    FOREIGN KEY (`L_UserIBAN`) REFERENCES `users` (`UserIBAN`));