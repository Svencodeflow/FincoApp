package de.sic.finco.fincowebapp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.context.annotation.Primary;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("KATEGORIE")
public class Kategorie {

    @Id
    private int kategorieID;

    @NotEmpty
    private String name;
    @NotEmpty
    private String typ;
    @NotEmpty
    private String k_Beschreibung;

    public Kategorie() {
    }

    public int getKategorieID() {
        return kategorieID;
    }

    public void setKategorieID(int kategorieID) {
        this.kategorieID = kategorieID;
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
}
