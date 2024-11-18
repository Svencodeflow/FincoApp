package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("LIMITS")
public class Limits {
    @Id @NotNull
    private int limitid;
    @NotNull
    private String kdnr;
    @NotNull
    private int kategorieid;
    @NotNull
    private double ausgabelimit;

    public Limits() {
    }

    public int getLimitid() {
        return limitid;
    }

    public void setLimitid(int limitid) {
        this.limitid = limitid;
    }

    public String getKdnr() {
        return kdnr;
    }

    public void setKdnr(String kdnr) {
        this.kdnr = kdnr;
    }

    public int getKategorieid() {
        return kategorieid;
    }

    public void setKategorieid(int kategorieid) {
        this.kategorieid = kategorieid;
    }

    public double getAusgabelimit() {
        return ausgabelimit;
    }

    public void setAusgabelimit(double ausgabelimit) {
        this.ausgabelimit = ausgabelimit;
    }
}
