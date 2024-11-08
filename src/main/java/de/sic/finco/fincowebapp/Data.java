package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;

public abstract class Data {
    abstract int getID();
    abstract void setID(int id);
    abstract String getKdNr();
    abstract void setKdNr(String KdNr);
    abstract String getIBAN();
    abstract void setIBAN(String userIBAN);
}
