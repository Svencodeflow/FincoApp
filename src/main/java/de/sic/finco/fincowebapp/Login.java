package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Login extends Data{

    @Id
    @NotEmpty
    private int loginID;
    @NotEmpty
    private String kdNr;
    @NotEmpty
    private String userIBAN;
    @NotEmpty
    private LocalDateTime loginZeit;
    @NotEmpty
    private String ipAdresse;
    @NotEmpty
    private String status;

    public Login() {
        super();
    }

    public int getLoginID() {
        return loginID;
    }

    public void setLoginID(int loginID) {
        this.loginID = loginID;
    }

    @Override
    String getKdNr() {
        return kdNr;
    }

    @Override
    void setKdNr(String kdNr) {
        this.kdNr = kdNr;
    }

    @Override
    String getIBAN() {
        return userIBAN;
    }

    @Override
    void setIBAN(String userIBAN) {
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
