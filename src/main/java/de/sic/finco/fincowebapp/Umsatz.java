package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;

@Table("UMSATZ")
public class Umsatz extends Data{
    @Id
    @NotNull
    private int umsatzID;
    @NotNull
    private double betrag;
    @NotNull
    private LocalDate datum;
    @NotNull
    private int kategorieID;
    @NotNull
    private String beschreibung;
    @NotNull
    private String kdNr;
    @NotNull
    private String userIBAN;
    @NotNull
    private String art;
    @NotNull
    private String kundenReferenz;

    public Umsatz() {
        super();
    }

    public int getUmsatzID() {
        return umsatzID;
    }

    public void setUmsatzID(int umsatzID) {
        this.umsatzID = umsatzID;
    }

    public double getBetrag() {
        return betrag;
    }

    public void setBetrag(double betrag) {
        this.betrag = betrag;
    }

    public LocalDate getDatum() {
        return datum;
    }

    public void setDatum(LocalDate datum) {
        this.datum = datum;
    }

    public int getKategorieID() {
        return kategorieID;
    }

    public void setKategorieID(int kategorieID) {
        this.kategorieID = kategorieID;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    @Override
    public String getKdNr() {
        return kdNr;
    }

    @Override
    public void setKdNr(String kdNr) {
        this.kdNr=kdNr;
    }

    @Override
    public String getIBAN() {
        return userIBAN;
    }

    @Override
    public void setIBAN(String userIBAN) {
        this.userIBAN=userIBAN;
    }

    public String getArt() {
        return art;
    }

    public void setArt(String art) {
        this.art = art;
    }

    public String getKundenReferenz() {
        return kundenReferenz;
    }

    public void setKundenReferenz(String kundenReferenz) {
        this.kundenReferenz = kundenReferenz;
    }
}
