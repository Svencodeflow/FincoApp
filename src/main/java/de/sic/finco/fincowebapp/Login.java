package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;

import java.util.Date;

public class Login extends Data{

    @Id
    @NotEmpty
    private int loginID;
    @NotEmpty
    private double kdNr;
    @NotEmpty
    private Date userIBAN;
    @NotEmpty
    private int kategorieID;
    @NotEmpty
    private String beschreibung;
    @NotEmpty
    private String kdNr;

    @Override
    String getKdNr() {
        return "";
    }

    @Override
    void setKdNr(String kdNr) {

    }

    @Override
    String getIBAN() {
        return "";
    }

    @Override
    void setIBAN(String userIBAN) {

    }
}
