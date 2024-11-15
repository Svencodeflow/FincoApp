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
   `Oauth1` VARCHAR(32) ,
   `Oauth2` VARCHAR(32) ,
   `Vorname` VARCHAR(30) NOT NULL ,
   `Nachname` VARCHAR(30) NOT NULL ,
   `E_Mail` VARCHAR(50) NOT NULL ,
   `PasswortHash` VARCHAR(64) NOT NULL ,
   `RegDatum` DATE NOT NULL ,
   `Ausgabelimit` DECIMAL(10,2));

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

    CREATE TABLE `limits`
    (`LimitID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	 `KdNr` VARCHAR(50) NOT NULL ,
     `KategorieID` INT NOT NULL  ,
     `Ausgabelimit` DECIMAL(10,2) NOT NULL ,
	  FOREIGN KEY (`KdNr`) REFERENCES `users` (`KdNr`),
      FOREIGN KEY (`KategorieID`) REFERENCES `kategorie` (`KategorieID`));

    INSERT INTO `kategorie` (`KategorieID`, `Name`, `Typ`, `Beschreibung`) VALUES
    (1, 'Bruttogehalt', 'Einnahme', 'Monatliches Gehalt vor den Abzügen'),
    (2, 'Nettogehalt', 'Einnahme', 'Monatliches Gehalt nach den Abzügen'),
    (3, 'Miete', 'Ausgabe', 'Monatliche Miete für die Wohnung'),
    (4, 'Lebensmittel', 'Ausgabe', 'Einkäufe im Supermarkt'),
    (5, 'Sozialversicherungen', 'Ausgabe', 'Kranken-/Renten-/Arbeitslosen-/Pflegeversicherung'),
    (6, 'Freizeit', 'Ausgabe', 'Ausgaben für Freizeitaktivitäten'),
    (7, 'Zinsen', 'Einnahme', 'Zinsen aus Ersparnissen');

    INSERT INTO `users` (`KdNr`, `UserIBAN`, `OAuth1`, `OAuth2`, `Vorname`, `Nachname`, `E_Mail`, `PasswortHash`, `RegDatum`, `Ausgabelimit`)
    VALUES
    ('0123456789ABCDEF', 'DE02701500000000594937', NULL, NULL, 'Jane', 'Doe', 'jane.doe@gmail.com',
     'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '2024-11-12', NULL),
    ('1EDCBA9876543210', 'DE02700100800030876808', NULL, NULL, 'John', 'Doe', 'john.doe@appleid.com',
     '027f505a89058a84673b9c1e49e28a217d5ce538ea86b7fe36be68518285d394', '2024-11-12', NULL),
    ('2A3B4C5D6E7F8G9H', 'DE02700100800030876809', NULL, NULL, 'Alice', 'Smith', 'alice.smith@example.com',
     'b3b5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', '2000.00'),
    ('2B3C4D5E6F7G8H9I', 'DE02700100800030876810', NULL, NULL, 'Bob', 'Johnson', 'bob.johnson@example.com',
     'c3c5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', '5000.00'),
    ('3C4D5E6F7G8H9I0J', 'DE02700100800030876811', NULL, NULL, 'Charlie', 'Williams', 'charlie.williams@example.com',
    'd3d5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', '200.00');

     INSERT INTO `umsatz`
     (`UmsatzID`, `Betrag`, `Datum`, `KategorieID`, `Beschreibung`, `KdNr`, `UserIBAN`, `Art`, `Kundenreferenz`)
     VALUES
     (1, '42500.00', '2024-11-12', '1', 'Monatliches Bruttogehalt für Oktober 2024', '0123456789ABCDEF',
     'DE02701500000000594937', 'E', '001122334455667788990987654321'),
     (2, '40000.00', '2024-11-12', '2', 'Monatliches Nettogehalt für Oktober 2024', '1EDCBA9876543210',
     'DE02700100800030876808', 'E', '998877665544332211001234567890'),
     (3, '-1500.00', '2024-11-13', '3', 'Monatliche Miete für November 2024', '2A3B4C5D6E7F8G9H',
      'DE02700100800030876809', 'A', '001122334455667788990987654322'),
     (4, '-200.00', '2024-11-13', '4', 'Lebensmittel-Einkäufe für November 2024', '2B3C4D5E6F7G8H9I',
      'DE02700100800030876810', 'A', '998877665544332211001234567891'),
     (5, '-50.00', '2024-11-13', '6', 'Freizeitaktivitäten im November 2024', '3C4D5E6F7G8H9I0J',
      'DE02700100800030876811', 'A', '123456789012345678901234567890');

     INSERT INTO `login` (`Login_ID`, `KdNr`, `UserIBAN`, `LoginZeit`, `IP_Adresse`, `Status`) VALUES
     (1, '0123456789ABCDEF', 'DE02701500000000594937', '2024-11-12 23:01:45.000000', '192.168.64.1', 'Y'),
     (2, '1EDCBA9876543210', 'DE02700100800030876808', '2024-11-12 23:01:45.000000', '192.168.127.254', 'N'),
     (3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', '2024-11-13 09:00:00.000000', '192.168.1.1', 'Y'),
     (4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', '2024-11-13 12:30:00.000000', '192.168.1.2', 'N'),
     (5, '3C4D5E6F7G8H9I0J', 'DE02700100800030876811', '2024-11-13 15:45:00.000000', '192.168.1.3', 'Y');

     INSERT INTO `limits` (`LimitID`, `KdNr`, `KategorieID`, `Ausgabelimit`) VALUES
     (1, '0123456789ABCDEF', '3', '2000.00'),
     (2, '1EDCBA9876543210', '4', '500.00'),
     (3, '2A3B4C5D6E7F8G9H', '5', '5000.00'),
     (4, '2B3C4D5E6F7G8H9I', '6', '200.00');