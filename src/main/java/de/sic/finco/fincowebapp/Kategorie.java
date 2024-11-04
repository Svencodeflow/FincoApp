package de.sic.finco.fincowebapp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("KATEGORIE")
public class Kategorie {

    @Id
    private Integer id;

    @NotEmpty
    private int KategorieID;

    private String name;
    private String typ;
    private String k_Beschreibung;
    @JsonIgnore
    private byte[] data;

    public Kategorie() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getKategorieID() {
        return KategorieID;
    }

    public void setKategorieID(int kategorieID) {
        KategorieID = kategorieID;
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

    public String getK_Beschreibung() {
        return k_Beschreibung;
    }

    public void setK_Beschreibung(String k_Beschreibung) {
        this.k_Beschreibung = k_Beschreibung;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }
}
