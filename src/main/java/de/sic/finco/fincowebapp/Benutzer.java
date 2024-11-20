package de.sic.finco.fincowebapp;

import java.time.LocalDate;

public class Benutzer {

    private String oauth1;
    private String oauth2;
    private String vorname;
    private String nachname;
    private String name;
    private String email;
    private String passworthash;
    private LocalDate regdatum;

    private String kdnr;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKdnr() {
        return kdnr;
    }

    public void setKdnr(String kdnr) {
        this.kdnr = kdnr;
    }
    public String getUseriban() {
        return useriban;
    }

    public void setUseriban(String useriban) {
        this.useriban = useriban;
    }

    private String useriban;

    public String getOauth1() {
        return oauth1;
    }

    public void setOauth1(String oauth1) {
        this.oauth1 = oauth1;
    }

    public String getOauth2() {
        return oauth2;
    }

    public void setOauth2(String oauth2) {
        this.oauth2 = oauth2;
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
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassworthash() {
        return passworthash;
    }

    public void setPassworthash(String passworthash) {
        this.passworthash = passworthash;
    }

    public LocalDate getRegdatum() {
        return regdatum;
    }

    public void setRegdatum(LocalDate regdatum) {
        this.regdatum = regdatum;
    }


}
