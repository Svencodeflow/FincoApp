package de.sic.finco.fincowebapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UmsatzService {

    @Autowired
    private UmsatzRepository umsatzRepository;

    public Umsatz saveUmsatz(Umsatz umsatz) {
        return umsatzRepository.save(umsatz);
    }

    // Eventuell weitere Methoden für Geschäftslogik hinzufügen
}