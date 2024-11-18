package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("KATEGORIE")
public class Kategorie {

    @Id
    @NotNull
    private int kategorieid;
    @NotNull
    private String name;
    @NotNull
    private String typ;
    @NotNull
    private String beschreibung;

    public Kategorie() {
    }

    public int getKategorieid() {
        return kategorieid;
    }

    public void setKategorieid(int kategorieid) {
        this.kategorieid = kategorieid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }
}
