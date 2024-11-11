package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;

@Table("UMSATZ")
public class Umsatz extends Data{
    @Id
    @NotEmpty
    private int umsatzID;
    @NotEmpty
    private double betrag;
    @NotEmpty
    private Date datum;
    @NotEmpty
    private int kategorieID;
    @NotEmpty
    private String beschreibung;
    @NotEmpty
    private String kdNr;
    @NotEmpty
    private String userIBAN;
    @NotEmpty
    private Date art;
    @NotEmpty
    private Date kundenReferenz;

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

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
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
    String getKdNr() {
        return kdNr;
    }

    @Override
    void setKdNr(String kdNr) {
        this.kdNr=kdNr;
    }

    @Override
    String getIBAN() {
        return userIBAN;
    }

    @Override
    void setIBAN(String userIBAN) {
        this.userIBAN=userIBAN;
    }

    public Date getArt() {
        return art;
    }

    public void setArt(Date art) {
        this.art = art;
    }

    public Date getKundenReferenz() {
        return kundenReferenz;
    }

    public void setKundenReferenz(Date kundenReferenz) {
        this.kundenReferenz = kundenReferenz;
    }
}
