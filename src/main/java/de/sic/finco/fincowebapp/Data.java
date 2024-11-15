package de.sic.finco.fincowebapp;

public abstract class Data {

    public Data() {
    }

    abstract String getKdNr();
    abstract void setKdNr(String kdNr);
    abstract String getIBAN();
    abstract void setIBAN(String userIBAN);
}
