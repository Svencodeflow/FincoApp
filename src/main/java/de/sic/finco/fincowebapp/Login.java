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
}
