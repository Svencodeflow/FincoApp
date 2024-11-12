package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;

public class Login extends Data{

    @Id
    @NotNull
    private int loginID;
    @NotNull
    private String kdNr;
    @NotNull
    private String userIBAN;
    @NotNull
    private String loginZeit;
    @NotNull
    private String ipAdresse;
    @NotNull
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

    public String getLoginZeit() {
        return loginZeit;
    }

    public void setLoginZeit(String loginZeit) {
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
