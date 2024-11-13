package kategorie;


import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("KATEGORIE")
public class Kategorie {

    @Id
    @NotNull
    private int kategorieID;
    @NotNull
    private String name;
    @NotNull
    private String typ;
    @NotNull
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
