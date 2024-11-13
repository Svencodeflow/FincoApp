package de.sic.finco.fincowebapp.users;

import java.util.Date;

import de.sic.finco.fincowebapp.Data;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("USERS")
public class Users implements Data {
    @Id
    @NotNull
    private String kdNr;
    @NotNull
    private String userIBAN;
    @NotNull
    private String vorname;
    @NotNull
    private String nachname;
    @NotNull
    private String eMail;
    @NotNull
    private String passwortHash;
    @NotNull
    private Date regDatum;

    public Users() {
        super();
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
        return kdNr;
    }

    @Override
    public void setIBAN(String userIBAN) {
        this.userIBAN=userIBAN;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }

    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    public String getEmail() {
        return eMail;
    }

    public void setEmail(String eMail) {
        this.eMail = eMail;
    }

    public String getPasswortHash() {
        return passwortHash;
    }

    public void setPasswortHash(String passwortHash) {
        this.passwortHash = passwortHash;
    }

    public Date getRegDatum() {
        return regDatum;
    }

    public void setRegDatum(Date regDatum) {
        this.regDatum = regDatum;
    }
}
