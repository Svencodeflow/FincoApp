package de.sic.finco.fincowebapp;

public abstract class Data {

    public Data() {
    }

    public abstract String getKdNr();
    public abstract void setKdNr(String kdNr);
    public abstract String getIBAN();
    public abstract void setIBAN(String userIBAN);
}
