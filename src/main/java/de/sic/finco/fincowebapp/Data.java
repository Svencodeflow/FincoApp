package de.sic.finco.fincowebapp;

public abstract class Data {
    private String kdNr;
    private String userIBAN;

    public Data(String kdNr, String userIBAN) {
        this.kdNr = kdNr;
        this.userIBAN = userIBAN;
    }

    abstract String getKdNr();
    abstract void setKdNr(String kdNr);
    abstract String getIBAN();
    abstract void setIBAN(String userIBAN);
}
