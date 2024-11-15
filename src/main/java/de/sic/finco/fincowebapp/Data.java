package de.sic.finco.fincowebapp;

public abstract class Data {
    int id;
    String KdNr;
    String userIBAN;

    public Data(int id, String kdNr, String userIBAN) {
        this.id = id;
        this.KdNr = kdNr;
        this.userIBAN = userIBAN;
    }

    abstract String getKdNr();
    abstract void setKdNr(String kdNr);
    abstract String getIBAN();
    abstract void setIBAN(String userIBAN);
}
