package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("LOGIN")
public class Login extends Data{

    @Id
    @NotNull
    private int loginID;
    @NotNull
    private String kdNr;
    @NotNull
    private String userIBAN;
    @NotNull
    private LocalDateTime loginZeit;
    @NotNull
    private String ipAdresse;
    @NotNull
    private String status;

    public Login(String kdNr, String userIBAN) {
        super(kdNr, userIBAN);
    }

    public int getLoginID() {
        return loginID;
    }

    public void setLoginID(int loginID) {
        this.loginID = loginID;
    }

    @Override
    public String getKdNr() {
        return kdNr;
    }

    @Override
    public void setKdNr(String kdNr) {
        this.kdNr = kdNr;
    }

    @Override
    public String getIBAN() {
        return userIBAN;
    }

    @Override
    public void setIBAN(String userIBAN) {
        this.userIBAN=userIBAN;
    }

    public LocalDateTime getLoginZeit() {
        return loginZeit;
    }

    public void setLoginZeit(LocalDateTime loginZeit) {
        this.loginZeit = loginZeit;
    }

    public String getIpAdresse() {
        return ipAdresse;
    }

    public void setIpAdresse(String ipAdresse) {
        this.ipAdresse = ipAdresse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
