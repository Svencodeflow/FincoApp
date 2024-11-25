package de.sic.finco.fincowebapp;

import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;

@Table("users")
public class Users{
    @Id
    @NotNull
    private int userid;
    @NotNull
    private String kdnr;
    @NotNull
    private String useriban;
    @Nullable
    private String oauth1;
    @Nullable
    private String oauth2;
    @NotNull
    private String vorname;
    @NotNull
    private String nachname;
    @NotNull
    private String email;
    @NotNull
    private String passworthash;
    @NotNull
    private LocalDate regdatum;

    public Users() {

    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    @Nullable
    public String getOauth1() {
        return oauth1;
    }

    public void setOauth1(@Nullable String oauth1) {
        this.oauth1 = oauth1;
    }

    @Nullable
    public String getOauth2() {
        return oauth2;
    }

    public void setOauth2(@Nullable String oauth2) {
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
