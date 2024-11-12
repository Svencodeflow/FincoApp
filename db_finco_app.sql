CREATE DATABASE IF NOT EXISTS `finco` COLLATE utf8_general_ci;
USE `finco`;

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
   `Kundenreferenz` VARCHAR(35) NOT NULL ,
    FOREIGN KEY (`KategorieID`) REFERENCES `kategorie` (`KategorieID`),
    FOREIGN KEY (`KdNr`) REFERENCES `users` (`KdNr`));

   CREATE TABLE `login`
   (`Login_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `KdNr` VARCHAR(50) NOT NULL ,
    `UserIBAN` VARCHAR(22) NOT NULL ,
    `LoginZeit` DATETIME NOT NULL ,
    `IP_Adresse` VARCHAR(50) NOT NULL ,
    `Status` VARCHAR(1) NOT NULL ,
    FOREIGN KEY (`KdNr`) REFERENCES `users` (`KdNr`));

    INSERT INTO `kategorie` (`KategorieID`, `Name`, `Typ`, `Beschreibung`) VALUES
    (1, 'Bruttogehalt', 'Einnahme', 'Online übers Handy'),
    (2, 'Sozialversicherungen', 'Ausgabe', 'Offline per Überweisung übers Bankautomat');

    INSERT INTO `users` (`KdNr`, `UserIBAN`, `Vorname`, `Nachname`, `E_Mail`, `PasswortHash`, `RegDatum`) VALUES
    ('0123456789ABCDEF', 'DE02701500000000594937', 'Jane', 'Doe', 'jane.doe@gmail.com',
     'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '2024-11-12'),
    ('FEDCBA9876543210', 'DE02700100800030876808', 'John', 'Doe', 'john.doe@appleid.com',
     '027f505a89058a84673b9c1e49e28a217d5ce538ea86b7fe36be68518285d394', '2024-11-12');

     INSERT INTO `umsatz`
     (`UmsatzID`, `Betrag`, `Datum`, `KategorieID`, `Beschreibung`, `KdNr`, `UserIBAN`, `Art`, `Kundenreferenz`)
     VALUES (1, '35.00', '2024-11-12', '1', 'Einnahme online übers Handy', '0123456789ABCDEF',
     'DE02701500000000594937', 'A', '001122334455667788990987654321'),
     (2, '-25.00', '2024-11-12', '2', 'Ausgabe offline per Überweisung übers Bankautomat', 'FEDCBA9876543210',
     'DE02700100800030876808', 'B', '998877665544332211001234567890');

     INSERT INTO `login` (`Login_ID`, `KdNr`, `UserIBAN`, `LoginZeit`, `IP_Adresse`, `Status`) VALUES
     (1, '0123456789ABCDEF', 'DE02701500000000594937', '2024-11-12 23:01:45.000000', '192.168.64.1', 'Y'),
     (2, 'FEDCBA9876543210', 'DE02700100800030876808', '2024-11-12 23:01:45.000000', '192.168.127.254', 'N');
