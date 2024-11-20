/* SQL-Suche nach nicht direkt vorhandenen Werten mit bereits gegebenen Daten */

/* Summe aller jährlichen Beträge aus der Tabelle Umsatz */
SELECT 12*SUM(`Betrag`) AS 'Jährlicher Betrag' FROM `umsatz`;

/* Summe aller jährlichen Einnahmen aus der Tabelle Umsatz */
SELECT 12*SUM(`Betrag`) AS 'Jährliche Einnahmen' FROM `umsatz` WHERE `Betrag` > 0/*
AND NOT(`KategorieID` BETWEEN 3 AND 6)*/;

/* Summe aller jährlichen Ausgaben aus der Tabelle Umsatz */
SELECT 12*SUM(`Betrag`) AS 'Jährliche Ausgaben' FROM `umsatz` WHERE `Betrag` < 0/*
AND `KategorieID` BETWEEN 3 AND 6*/;

/* monatliche Ausgaben für Sozialversicherungen bei Arbeitnehmer/-innen (einmalig, ohne Unfallversicherung)*/
SELECT DISTINCT((SELECT `Betrag` FROM `umsatz` WHERE `KategorieID` = 1) -
                (SELECT `Betrag` FROM `umsatz` WHERE `KategorieID` = 2)) AS
                 'Monatliche Sozialversicherungen bei Arbeitnehmer/-innen' FROM `umsatz`;

/* alle vorhandenen IP-Adressen, von denen aus der Login erfolgreich war */
SELECT `IPAdresse` FROM `login` WHERE `Status` = 'Y';

/* alle vorhandenen IP-Adressen, von denen aus der Login nicht gelingen konnte  */
SELECT `IPAdresse` FROM `login` WHERE `Status` = 'N';

/* Ausgabelimits für Miete und Sozialversicherungen */
SELECT `Ausgabelimit` FROM `limits` WHERE `KategorieID` = 3 OR `KategorieID` = 5;

/* Summe aller jährlichen Ausgabelimits */
SELECT 12*SUM(`Ausgabelimit`) AS 'Gesamter jährlicher Ausgabelimit' FROM `limits`;
