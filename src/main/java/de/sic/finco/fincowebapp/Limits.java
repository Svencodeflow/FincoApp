package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("LIMITS")
public class Limits {
    @Id @NotNull
    private int limitID;
    @NotNull
    private String kdNr;
    @NotNull
    private int kategorieID;
    @NotNull
    private double ausgabeLimit;

    public Limits() {
    }

    public int getLimitID() {
        return limitID;
    }

    public void setLimitID(int limitID) {
        this.limitID = limitID;
    }

    public String getKdNr() {
        return kdNr;
    }

    public void setKdNr(String kdNr) {
        this.kdNr = kdNr;
    }

    public int getKategorieID() {
        return kategorieID;
    }

    public void setKategorieID(int kategorieID) {
        this.kategorieID = kategorieID;
    }

    public double getAusgabeLimit() {
        return ausgabeLimit;
    }

    public void setAusgabeLimit(double ausgabeLimit) {
        this.ausgabeLimit = ausgabeLimit;
    }
}
