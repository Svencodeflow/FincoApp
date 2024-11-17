package de.sic.finco.fincowebapp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CsvToArrayConverter {

    private String csvString;

    public CsvToArrayConverter(String csvString) {
        this.csvString = csvString;
    }

    public List<List<String>> convertCsvToArray() {
        String[] lines = csvString.split("\n");
        List<List<String>> arrayList = new ArrayList<>();

        for (String line : lines) {
            String[] values = line.split(";");
            arrayList.add(Arrays.asList(values));
        }

        return arrayList;
    }

    public String convertToHtmlTable(List<List<String>> arrayList) {
        StringBuilder htmlTable = new StringBuilder("<table border='1'>");

        for (List<String> line : arrayList) {
            htmlTable.append("<tr>");
            for (String value : line) {
                htmlTable.append("<td>").append(value).append("</td>");
            }
            htmlTable.append("</tr>");
        }
        htmlTable.append("</table>");

        return htmlTable.toString();
    }

    public static void main(String[] args) {
        String csvString = "Auftragskonto;Buchungstag;Valutadatum;Buchungstext;Verwendungszweck;Beguenstigter/Zahlungspflichtiger;Kontonummer;BLZ;Betrag;Waehrung;Info\n" +
                "DE1625050000089898989;15.11.2024;15.11.2024;KARTENZAHLUNG;Parkgebuhren+Parkstrasse//Parkhausen/DE;PARKSTRASSE;DE81300500000007777777;WELADEDDXXX;-1;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;12.11.2024;12.11.2024;ONLINE-UEBERWEISUNG;Zurück Peter Pan;Peter Pan;DE67250500000207777777;NOLADE2HXXX;-10;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;12.11.2024;12.11.2024;GUTSCHR. UEBERWEISUNG;Einkauf Tick-Trick-Track;Peter Pan;DE672505000007777777;NOLADE2HXXX;10;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;11.11.2024;11.11.2024;ECHTZEIT-UEBERWEISUNG;Handyman GmbH - Danke ;Handyman GmbH;DE263004000007777777;COBADEFFXXX;-31,66;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;11.11.2024;11.11.2024;BARGELDEINZAHLUNG SB;SB-EINZAHLUNG ENTENHAUSEN;;;25050000;30;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;07.11.2024;07.11.2024;ONLINE-UEBERWEISUNG;Deine Rücklage;Peter Pan;DE672505000007777777;NOLADE2HXXX;-45;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;07.11.2024;07.11.2024;ONLINE-UEBERWEISUNG;Danke;Peter Pan;DE57356500007777777;WELADED1WES;-60;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;07.11.2024;07.11.2024;BARGELDEINZAHLUNG SB;SB-EINZAHLUNG ;;;25050000;100;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;GANSTALER IMMOBILIEN//GANSTAL/DE;PBG.8451202;DE762699107777777;GENODEF1WOB;-1,5;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;00963 MCGOOFYS;00963 MCGOOFYS;DE83664926000007777777;GENODE61APP;-18,27;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHL. MIT BARAUSZAHL.;Bargeldausz. 100,00 EURABWA+Brutto Marken-Discoun;Brutto Marken-Discoun;DE68750200730007777777;HYVEDEMM447;-127,43;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;Kauffix;Kauffix;DE86300500000007777777;WELADEDDXXX;-17,97;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;Dagobert HOLDING+k kiosk 5047;Dagobert HOLDING;DE86300500000007777777;WELADEDDXXX;-10,6;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;Beulenfix Carservice;Beulenfix Carservice;DE8325950130007777777;NOLADE21HIK;-14,55;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;KARTENZAHLUNG;OIL Benzino;OIL Benzino;DE7430050000007777777;WELADEDDXXX;-55,49;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;03.11.2024;ECHTZEIT-UEBERWEISUNG;Pilotenbrille;Peter Pan;DE122505000007777777;NOLADE2HXXX;-30;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;04.11.2024;04.11.2024;DAUERAUFTRAG;Rundfunk Entenhausen sagt Danke;Rundfunk Entenhausen;DE25250500007777777;NOLADE2HXXX;-55,08;EUR;Umsatz gebucht\n" +
                "DE1625050000089898989;01.11.2024;01.11.2024;ENTGELTABSCHLUSS;Entgeltabrechnungsiehe Anlage;;;25050000;-14,6;EUR;Umsatz gebucht\n";

        CsvToArrayConverter converter = new CsvToArrayConverter(csvString);
        List<List<String>> arrayList = converter.convertCsvToArray();

        // ausgabe als HTMLTable
        //String htmlTable = converter.convertToHtmlTable(arrayList);
        //System.out.println(htmlTable);

        // Ausgabe als Text Feld für Feld
        for (List<String> line : arrayList) {
            for (String value : line) {
                System.out.print(value + "\t");
            }
            System.out.println();
            // New line between each record }
        }
    }
}
