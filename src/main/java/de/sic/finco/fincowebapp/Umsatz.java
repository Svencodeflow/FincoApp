package de.sic.finco.fincowebapp;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;

@Table("umsatz")
public class Umsatz {
    @Id
    @NotNull
    private int umsatzid;
    @NotNull
    private double betrag;
    @NotNull
    private LocalDate datum;
    @NotNull
    private int kategorieid;
    @NotNull
    private String beschreibung;
    @NotNull
    private String kdnr;
    @NotNull
    private String useriban;
    @NotNull
    private String art;
    @NotNull
    private String kundenreferenz;
    //@Nullable
    //private Double ausgabelimit;

    public Umsatz() {

    }

    public int getUmsatzid() {
        return umsatzid;
    }

    public void setUmsatzid(int umsatzid) {
        this.umsatzid = umsatzid;
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

    public int getKategorieid() {
        return kategorieid;
    }

    public void setKategorieid(int kategorieid) {
        this.kategorieid = kategorieid;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public String getKdnr() {
        return kdnr;
    }

    public void setkdnr(String kdnr) {
        this.kdnr=kdnr;
    }

    public String getIBAN() {
        return useriban;
    }

    public void setIBAN(String userIBAN) {
        this.useriban =userIBAN;
    }

    public String getArt() {
        return art;
    }

    public void setArt(String art) {
        this.art = art;
    }

    public String getKundenreferenz() {
        return kundenreferenz;
    }

    public void setKundenreferenz(String kundenreferenz) {
        this.kundenreferenz = kundenreferenz;
    }

    /*@Nullable
    public Double getAusgabelimit() {
        return ausgabelimit;
    }

    public void setAusgabelimit(@Nullable Double ausgabelimit) {
        this.ausgabelimit = ausgabelimit;
    }*/
}