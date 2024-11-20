package de.sic.finco.fincowebapp;

public class Transaction_K {

    private String description;
    private double amount;

    public void Transaction(String description, double amount) {
        this.description = description;
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public double getAmount() {
        return amount;
    }
}
