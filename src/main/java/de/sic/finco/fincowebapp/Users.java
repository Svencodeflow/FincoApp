package de.sic.finco.fincowebapp;

import java.util.Date;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("USERS")
public class Users {
    @Id @NotEmpty
    private String KdNr;
    private String userIBAN;
    private String vorname;
    private String nachname;
    private String eMail;
    private String passwortHash;
    private Date regDatum;

    public Users() {
    }

    public String getKdNr() {
        return KdNr;
    }

    public void setKdNr(String kdNr) {
        KdNr = kdNr;
    }

    public String getUserIBAN() {
        return userIBAN;
    }

    public void setUserIBAN(String userIBAN) {
        this.userIBAN = userIBAN;
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

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
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
