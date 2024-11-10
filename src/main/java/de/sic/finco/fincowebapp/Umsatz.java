package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;

@Table("UMSATZ")
public class Umsatz {
    @Id
    @NotEmpty
    private int umsatzID;
    @NotEmpty
    private double betrag;
    @NotEmpty
    private Date datum;
    @NotEmpty
    private int kategorieID;
    @NotEmpty
    private String beschreibung;
    @NotEmpty
    private Date datum;
    @NotEmpty
    private Date datum;
    @NotEmpty
    private Date datum;
    @NotEmpty
    private Date datum;


}
