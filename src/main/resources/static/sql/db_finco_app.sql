CREATE DATABASE IF NOT EXISTS `finco` COLLATE utf8_general_ci;
USE `finco`;

  CREATE TABLE `kategorie`
  (`KategorieID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(30) NOT NULL ,
   `Typ` VARCHAR(8) NOT NULL ,
   `Beschreibung` VARCHAR(50) NOT NULL);

   CREATE TABLE `users`
  (`userID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `KdNr` VARCHAR(50) NOT NULL ,
   `UserIBAN` VARCHAR(22) NOT NULL ,
   `Oauth1` VARCHAR(32) ,
   `Oauth2` VARCHAR(32) ,
   `Vorname` VARCHAR(30) NOT NULL ,
   `Nachname` VARCHAR(30) NOT NULL ,
   `EMail` VARCHAR(50) NOT NULL ,
   `PasswortHash` VARCHAR(64) NOT NULL ,
   `RegDatum` DATE NOT NULL ,
   `Ausgabelimit` DECIMAL(10,2));

  CREATE TABLE `umsatz`
  (`UmsatzID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `Betrag` DECIMAL(10,2) NOT NULL ,
   `Datum` DATE NOT NULL ,
   `KategorieID` INT NOT NULL ,
   `Beschreibung` VARCHAR(50) NOT NULL ,
   `userID` INT NOT NULL,
   `KdNr` VARCHAR(50) NOT NULL ,
   `UserIBAN` VARCHAR(22) NOT NULL ,
   `Art` VARCHAR(1) NOT NULL ,
   `Kundenreferenz` VARCHAR(35) NOT NULL ,
    FOREIGN KEY (`KategorieID`) REFERENCES `kategorie` (`KategorieID`),
    FOREIGN KEY (`userID`) REFERENCES `users` (`userID`));

   CREATE TABLE `login`
   (`LoginID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userID` INT NOT NULL,
    `KdNr` VARCHAR(50) NOT NULL ,
    `UserIBAN` VARCHAR(22) NOT NULL ,
    `LoginZeit` DATETIME NOT NULL ,
    `IPAdresse` VARCHAR(50) NOT NULL ,
    `Status` VARCHAR(1) NOT NULL ,
     FOREIGN KEY (`userID`) REFERENCES `users` (`userID`));

    CREATE TABLE `limits`
    (`LimitID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
     `userID` INT NOT NULL,
	 `KdNr` VARCHAR(50) NOT NULL ,
     `KategorieID` INT NOT NULL  ,
     `Ausgabelimit` DECIMAL(10,2) NOT NULL ,
	  FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
      FOREIGN KEY (`KategorieID`) REFERENCES `kategorie` (`KategorieID`));

    INSERT INTO `kategorie` (`KategorieID`, `Name`, `Typ`, `Beschreibung`) VALUES
    (1, 'Bruttogehalt', 'Einnahme', 'Monatliches Gehalt vor den Abzügen'),
    (2, 'Nettogehalt', 'Einnahme', 'Monatliches Gehalt nach den Abzügen'),
    (3, 'Miete', 'Ausgabe', 'Monatliche Miete für die Wohnung'),
    (4, 'Lebensmittel', 'Ausgabe', 'Einkäufe im Supermarkt'),
    (5, 'Sozialversicherungen', 'Ausgabe', 'Kranken-/Renten-/Arbeitslosen-/Pflegeversicherung'),
    (6, 'Freizeit', 'Ausgabe', 'Ausgaben für Freizeitaktivitäten'),
    (7, 'Zinsen', 'Einnahme', 'Zinsen aus Ersparnissen'),
    (8, 'Restaurantbesuch', 'Ausgabe', 'Ausgaben für Restaurantbesuche'),
    (9, 'Elektronik-Kauf', 'Ausgabe', 'Käufe von elektronischen Geräten'),
    (10, 'Nebeneinkünfte', 'Einnahme', 'Einkünfte aus Nebenjobs oder Freelance-Arbeiten'),
    (11, 'Reisebuchung', 'Ausgabe', 'Ausgaben für Reisebuchungen');


   INSERT INTO `users` (`userID`, `KdNr`, `UserIBAN`, `OAuth1`, `OAuth2`, `Vorname`, `Nachname`, `EMail`, `PasswortHash`, `RegDatum`, `Ausgabelimit`) VALUES
   (1, '0123456789ABCDEF', 'DE02701500000000594937', NULL, NULL, 'Jane', 'Doe', 'jane.doe@gmail.com', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '2024-11-12', NULL),
   (2, '1EDCBA9876543210', 'DE02700100800030876808', NULL, NULL, 'John', 'Doe', 'john.doe@appleid.com', '027f505a89058a84673b9c1e49e28a217d5ce538ea86b7fe36be68518285d394', '2024-11-12', NULL),
   (3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', NULL, NULL, 'Alice', 'Smith', 'alice.smith@example.com', 'b3b5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', 2000.00),
   (4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', NULL, NULL, 'Bob', 'Johnson', 'bob.johnson@example.com', 'c3c5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', 5000.00),
   (5, '3C4D5E6F7G8H9I0J', 'DE02700100800030876811', NULL, NULL, 'Charlie', 'Williams', 'charlie.williams@example.com', 'd3d5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-13', 200.00),
   (6, '3D4E5F6G7H8I9J0K', 'DE02700100800030876812', NULL, NULL, 'Dave', 'Brown', 'dave.brown@example.com', 'e3e5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-14', NULL),
   (7, '4E5F6G7H8I9J0K1L', 'DE02700100800030876813', NULL, NULL, 'Eve', 'Taylor', 'eve.taylor@example.com', 'f3f5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-15', NULL),
   (8, '5F6G7H8I9J0K1L2M', 'DE02700100800030876814', NULL, NULL, 'Fay', 'Martin', 'fay.martin@example.com', 'g3g5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-16', NULL),
   (9, '6G7H8I9J0K1L2M3N', 'DE02700100800030876815', NULL, NULL, 'Gary', 'Moore', 'gary.moore@example.com', 'h3h5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-17', NULL),
   (10, '7H8I9J0K1L2M3N4O', 'DE02700100800030876816', NULL, NULL, 'Hannah', 'Lee', 'hannah.lee@example.com', 'i3i5060d9e3c4e8b7c1b5f3a0e7f4e5d2d5b8b7a8a7b8b8b7c9c3d8d9e0f2e3f', '2024-11-18', NULL);


     INSERT INTO `umsatz`
     (`UmsatzID`, `Betrag`, `Datum`, `KategorieID`, `Beschreibung`, `userID`, `KdNr`, `UserIBAN`, `Art`, `Kundenreferenz`)
     VALUES
     (1, 4250.00, '2024-11-11 23:00:00', 1, 'Gehalt für Oktober 2024', 1, '0123456789ABCDEF', 'DE02701500000000594937', 'E', '001122334455667788990987654321'),
     (2, 320.00, '2024-11-11 23:00:00', 2, 'Bonusgehalt für Oktober 2024', 2, '1EDCBA9876543210', 'DE02700100800030876808', 'E', '998877665544332211001234567890'),
     (3, -1500.00, '2024-11-12 23:00:00', 3, 'Monatliche Miete für November 2024', 3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', 'A', '001122334455667788990987654322'),
     (4, -200.00, '2024-11-12 23:00:00', 4, 'Lebensmittel-Einkäufe für November 2024', 4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', 'A', '998877665544332211001234567891'),
     (5, -50.00, '2024-11-12 23:00:00', 6, 'Freizeitaktivitäten im November 2024', 5, '3C4D5E6F7G8H9I0J', 'DE02700100800030876811', 'A', '123456789012345678901234567890'),
     (6, 350.00, '2024-11-13 23:00:00', 7, 'Verkauf von Kunstwerken', 6, '3D4E5F6G7H8I9J0K', 'DE02700100800030876812', 'E', '223344556677889900001234567890'),
     (7, -75.00, '2024-11-14 23:00:00', 8, 'Restaurantbesuch', 7, '4E5F6G7H8I9J0K1L', 'DE02700100800030876813', 'A', '334455667788990011223344556677'),
     (8, -120.00, '2024-11-15 23:00:00', 9, 'Elektronik-Kauf', 8, '5F6G7H8I9J0K1L2M', 'DE02700100800030876814', 'A', '445566778899001122334455667788'),
     (9, 600.00, '2024-11-16 23:00:00', 10, 'Nebeneinkünfte aus Freelance-Arbeit', 9, '6G7H8I9J0K1L2M3N', 'DE02700100800030876815', 'E', '556677889900112233445566778899'),
     (10, -300.00, '2024-11-17 23:00:00', 11, 'Reisebuchung', 10, '7H8I9J0K1L2M3N4O', 'DE02700100800030876816', 'A', '667788990011223344556677889900'),
     (11, 4250.00, '2024-12-11 23:00:00', 1, 'Gehalt(Netto) für November 2024', 1, '0123456789ABCDEF', 'DE02701500000000594937', 'E', '001122334455667788990987654321'),
     (12, 400.00, '2024-12-11 23:00:00', 2, 'Bonus für November 2024', 2, '1EDCBA9876543210', 'DE02700100800030876808', 'E', '998877665544332211001234567890'),
     (13, -1500.00, '2024-12-12 23:00:00', 3, 'Monatliche Miete für Dezember 2024', 3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', 'A', '001122334455667788990987654322'),
     (14, -200.00, '2024-12-12 23:00:00', 4, 'Lebensmittel-Einkäufe für Dezember 2024', 4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', 'A', '998877665544332211001234567891'),
     (15, -50.00, '2024-12-12 23:00:00', 6, 'Freizeitaktivitäten im Dezember 2024', 5, '3C4D5E6F7G8H9I0J', 'DE02700100800030876811', 'A', '123456789012345678901234567890'),
     (16, 500.00, '2024-12-13 23:00:00', 7, 'Verkauf von Kunstwerken', 6, '3D4E5F6G7H8I9J0K', 'DE02700100800030876812', 'E', '223344556677889900001234567890'),
     (17, -85.00, '2024-12-14 23:00:00', 8, 'Kinobesuch', 7, '4E5F6G7H8I9J0K1L', 'DE02700100800030876813', 'A', '334455667788990011223344556677'),
     (18, -150.00, '2024-12-15 23:00:00', 9, 'Geschenke für Weihnachten', 8, '5F6G7H8I9J0K1L2M', 'DE02700100800030876814', 'A', '445566778899001122334455667788'),
     (19, 800.00, '2024-12-16 23:00:00', 10, 'Freelance-Arbeit im Dezember', 9, '6G7H8I9J0K1L2M3N', 'DE02700100800030876815', 'E', '556677889900112233445566778899'),
     (20, -400.00, '2024-12-17 23:00:00', 11, 'Flugbuchung für Urlaub', 10, '7H8I9J0K1L2M3N4O', 'DE02700100800030876816', 'A', '667788990011223344556677889900'),
     (21, 4250.00, '2025-01-11 23:00:00', 1, 'Gehalt(Netto) für Dezember 2024', 1, '0123456789ABCDEF', 'DE02701500000000594937', 'E', '001122334455667788990987654321'),
     (22, 450.00, '2025-01-11 23:00:00', 2, 'Neujahrsbonus 2025', 2, '1EDCBA9876543210', 'DE02700100800030876808', 'E', '998877665544332211001234567890'),
     (23, -1600.00, '2025-01-12 23:00:00', 3, 'Monatliche Miete für Januar 2025', 3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', 'A', '001122334455667788990987654322'),
     (24, -250.00, '2025-01-12 23:00:00', 4, 'Lebensmittel-Einkäufe für Januar 2025', 4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', 'A', '998877665544332211001234567891'),
     (25, -60.00, '2025-01-12 23:00:00', 6, 'Freizeitaktivitäten im Januar 2025', 5,'3C4D5E6F7G8H9I0J', 'DE02700100800030876811', 'A', '123456789012345678901234567890'),
     (26, 5250.00, '2024-11-11 23:00:00', 1, 'Gehalt für November 2024', 7, '4E5F6G7H8I9J0K1L', 'DE02700100800030876813', 'A', '001122334455667788990987654321'),
     (27, -90.00, '2025-01-14 23:00:00', 8, 'Essengehen', 7, '4E5F6G7H8I9J0K1L', 'DE02700100800030876813', 'A', '334455667788990011223344556677'),
     (28, 550.00, '2025-01-15 23:00:00', 10, 'Verkauf von Elektronik', 8, '5F6G7H8I9J0K1L2M', 'DE02700100800030876814', 'E', '445566778899001122334455667788'),
     (29, -200.00, '2025-01-16 23:00:00', 4, 'Einkäufe für die Woche', 9, '6G7H8I9J0K1L2M3N', 'DE02700100800030876815', 'A', '556677889900112233445566778899'),
     (30, 900.00, '2025-01-17 23:00:00', 7, 'Verkauf von Antiquitäten', 10, '7H8I9J0K1L2M3N4O', 'DE02700100800030876816', 'E', '667788990011223344556677889900');

     INSERT INTO `login` (`LoginID`, `userID`, `KdNr`, `UserIBAN`, `LoginZeit`, `IPAdresse`, `Status`) VALUES
     (1, 1, '0123456789ABCDEF', 'DE02701500000000594937', '2024-11-12 23:01:45.000000', '192.168.64.1', 'Y'),
     (2, 2, '1EDCBA9876543210', 'DE02700100800030876808', '2024-11-12 23:01:45.000000', '192.168.127.254', 'N'),
     (3, 3, '2A3B4C5D6E7F8G9H', 'DE02700100800030876809', '2024-11-13 09:00:00.000000', '192.168.1.1', 'Y'),
     (4, 4, '2B3C4D5E6F7G8H9I', 'DE02700100800030876810', '2024-11-13 12:30:00.000000', '192.168.1.2', 'N'),
     (5, 5, '3C4D5E6F7G8H9I0J', 'DE02700100800030876811', '2024-11-13 15:45:00.000000', '192.168.1.3', 'Y');

     INSERT INTO `limits` (`LimitID`, `userID`, `KdNr`, `KategorieID`, `Ausgabelimit`) VALUES
     (1, 1, '0123456789ABCDEF', '3', '2000.00'),
     (2, 2, '1EDCBA9876543210', '4', '500.00'),
     (3, 3, '2A3B4C5D6E7F8G9H', '5', '5000.00'),
     (4, 4, '2B3C4D5E6F7G8H9I', '6', '200.00');

     SELECT KdNr FROM `users` WHERE Nachname = 'Doe' AND EMail LIKE 'john%appleid%';
     SELECT * FROM `umsatz` ORDER BY KdNr;
     SELECT * FROM `umsatz` ORDER BY Kundenreferenz;


