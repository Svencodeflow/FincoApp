package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;

public abstract class Data {
    @Id
    @NotNull String kdNr;
    @NotNull String userIBAN;

    public Data(String kdNr, String userIBAN) {
        this.kdNr = kdNr;
        this.userIBAN = userIBAN;
    }

    abstract String getKdNr();
    abstract void setKdNr(String kdNr);
    abstract String getIBAN();
    abstract void setIBAN(String userIBAN);
}
