package de.sic.finco.fincowebapp;
import org.springframework.boot.autoconfigure.pulsar.PulsarProperties;

import java.sql.*;

public class UmsatzEintrag {
    private static Date datum;

    public static void setDatum(Date datum) {
        UmsatzEintrag.datum = datum;
    }

    public static void setBetrag(double betrag) {
        UmsatzEintrag.betrag = betrag;
    }

    public static void setKategorieID(int kategorieID) {
        UmsatzEintrag.kategorieID = kategorieID;
    }

    public static void setBeschreibung(String beschreibung) {
        UmsatzEintrag.beschreibung = beschreibung;
    }

    public static void setUserIBAN(String userIBAN) {
        UmsatzEintrag.userIBAN = userIBAN;
    }

    public static void setArt(String art) {
        UmsatzEintrag.art = art;
    }

    public static Date getDatum() {
        return datum;
    }

    public static double getBetrag() {
        return betrag;
    }

    public static int getKategorieID() {
        return kategorieID;
    }

    public static String getBeschreibung() {
        return beschreibung;
    }

    public static String getUserIBAN() {
        return userIBAN;
    }

    public static String getArt() {
        return art;
    }

    private static double betrag;
    private static int kategorieID;
    private static String beschreibung;
    private static String userIBAN;
    private static String art;

    public static String getKundenreferenz() {
        return kundenreferenz;
    }

    public static void setKundenreferenz(String kundenreferenz) {
        UmsatzEintrag.kundenreferenz = kundenreferenz;
    }

    private static String kundenreferenz;




    public void saveTransaction(PulsarProperties.Transaction transaction, Connection conn) throws SQLException {


        String sql = "INSERT INTO umsatz (Betrag, Datum, KategorieID, Beschreibung, UserIBAN, Art, Kundenreferenz) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setDouble(1, UmsatzEintrag.getBetrag());
        pstmt.setDate(2, new java.sql.Date(UmsatzEintrag.getDatum().getTime()));
        pstmt.setInt(3, UmsatzEintrag.getKategorieID());
        pstmt.setString(4,UmsatzEintrag.getBeschreibung());
        pstmt.setString(5, UmsatzEintrag.getUserIBAN());
        pstmt.setString(6, UmsatzEintrag.getArt());
        pstmt.setString(7, UmsatzEintrag.getKundenreferenz());
        pstmt.executeUpdate();
    }
}
