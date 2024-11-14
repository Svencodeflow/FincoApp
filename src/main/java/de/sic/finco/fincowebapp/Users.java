package de.sic.finco.fincowebapp;

import java.util.Date;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("USERS")
public class Users extends Data{
    @Id
    @NotNull
    private String kdNr;
    @NotNull
    private String userIBAN;
    @Nullable
    private String oAuth1;
    @Nullable
    private String oAuth2;
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
        return userIBAN;
    }

    @Override
    public void setIBAN(String userIBAN) {
        this.userIBAN=userIBAN;
    }

    @Nullable
    public String getoAuth1() {
        return oAuth1;
    }

    public void setoAuth1(@Nullable String oAuth1) {
        this.oAuth1 = oAuth1;
    }

    @Nullable
    public String getoAuth2() {
        return oAuth2;
    }

    public void setoAuth2(@Nullable String oAuth2) {
        this.oAuth2 = oAuth2;
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
